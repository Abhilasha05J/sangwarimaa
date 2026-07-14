import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sangwari_maa/core/network/dio_client.dart';
import 'package:sangwari_maa/core/services/token_storage_service.dart';
import 'package:sangwari_maa/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:sangwari_maa/features/auth/data/repository/auth_repository.dart';
import 'package:sangwari_maa/features/profile/data/datasource/profile_remote_datasource.dart';
import 'package:sangwari_maa/features/profile/data/repository/profile_repository.dart';

sealed class AppDestination {
  const AppDestination();
}

class SplashDestination extends AppDestination {
  const SplashDestination();
  String get path => '/';
}

class DashboardDestination extends AppDestination {
  final String path;
  const DashboardDestination(this.path);
}

class RegistrationDestination extends AppDestination {
  final String? mobile;
  const RegistrationDestination({this.mobile});
}

Future<AppDestination> resolveDestination() async {
  final storage = const TokenStorageService(FlutterSecureStorage());

  // ── Step 1: Check session ──────────────────────────────────────────────
  final hasSession = await storage.hasSession;
  if (!hasSession) return const SplashDestination();

  final role = await storage.role;

  // ── Step 2: Admin roles — no profile completion step ──────────────────
  if (role == 'blockAdmin' || role == 'pi' || role == 'superAdmin') {
    return const DashboardDestination('/admindashboard');
  }

  // ── Step 3: Check profile completeness via backend ────────────────────
  final profileRepo = ProfileRepository(
    ProfileRemoteDataSource(DioClient.instance.dio),
    storage,
  );

  final result = await profileRepo.isProfileComplete(role);

  return await result.fold(
        (failure) => DashboardDestination(_dashboardPath(role)),
        (isComplete) async {
      if (isComplete) return DashboardDestination(_dashboardPath(role));

      // Profile incomplete — get mobile from /auth/me (User table),
      // NOT from /women/profile which 404s for incomplete users.
      String? mobile;
      final authRepo = AuthRepository(
        AuthRemoteDataSource(DioClient.instance.dio),
        storage,
      );
      final userResult = await authRepo.getCurrentUser();
      mobile = userResult.fold((_) => null, (user) => user.mobile);

      return RegistrationDestination(mobile: mobile);
    },
  );
}

String _dashboardPath(String? role) {
  return switch (role) {
    'asha' || 'anm' => '/mitanindashboard',
    _ => '/womensdashboard',
  };
}