import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/core/router/app_router.dart';
import 'package:sangwari_maa/core/services/destination_service.dart';
import 'package:sangwari_maa/core/services/token_storage_service.dart';
import 'package:sangwari_maa/shared/providers/locale_provider.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const ProviderScope(child: SangwariMaaApp()));
}

class SangwariMaaApp extends ConsumerStatefulWidget {
  const SangwariMaaApp({super.key});

  @override
  ConsumerState<SangwariMaaApp> createState() => _SangwariMaaAppState();
}

class _SangwariMaaAppState extends ConsumerState<SangwariMaaApp> {
  late final GoRouter _router;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    try {
      final destination = await resolveDestination();
      switch (destination) {
        case SplashDestination():
          _router = buildAppRouter(initialLocation: '/');
        case DashboardDestination(:final path):
          _router = buildAppRouter(initialLocation: path);
        case RegistrationDestination(:final mobile):
          _router = buildAppRouter(
            initialLocation: '/register-complete',
            pendingMobile: mobile,
          );
      }
    } catch (e, st) {
      debugPrint('⚠️ Destination resolve failed: $e\n$st');
      _router = buildAppRouter(initialLocation: '/');
    } finally {
      FlutterNativeSplash.remove();
      if (mounted) setState(() => _ready = true);
    }
  }
  //
  // Future<void> _init() async {
  //   try {
  //     final destination = await resolveDestination();
  //
  //     switch (destination) {
  //       case SplashDestination():
  //         _router = buildAppRouter(initialLocation: '/');
  //       case DashboardDestination(:final path):
  //         _router = buildAppRouter(initialLocation: path);
  //       case RegistrationDestination(:final mobile):
  //         _pendingRegistrationMobile = mobile;
  //         _router = buildAppRouter(
  //           initialLocation: '/register-complete',
  //           pendingMobile: mobile,
  //         );
  //     }
  //   } catch (e, st) {
  //     debugPrint('⚠️ Destination resolve failed: $e\n$st');
  //     _router = buildAppRouter(initialLocation: '/');
  //   } finally {
  //     FlutterNativeSplash.remove();
  //     if (mounted) setState(() => _ready = true);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    // Hold a blank scaffold while session check runs (usually <100ms).
    // Native splash stays visible over this until remove() is called above.
    if (!_ready) return const MaterialApp(home: Scaffold(backgroundColor: Colors.white));

    final locale = ref.watch(localeProvider);
    return MaterialApp.router(
      title: 'Sangwari MAA',
      debugShowCheckedModeBanner: false,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _router,
    );
  }
}