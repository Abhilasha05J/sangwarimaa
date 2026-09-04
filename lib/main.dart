import 'dart:async';
import 'dart:developer' as developer;
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/core/router/app_router.dart';
import 'package:sangwari_maa/core/services/destination_service.dart';
import 'package:sangwari_maa/shared/providers/locale_provider.dart';
import 'core/services/auth_event_bus.dart';
import 'core/services/medicine_offline_queue.dart';
import 'core/services/medicine_reminder_scheduler.dart';
import 'core/services/notification_service.dart';
import 'core/services/token_storage_service.dart';
import 'features/ancservices/presentation/controller/anc_services_controller.dart';
import 'features/auth/presentation/provider/auth_providers.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp();

  // ── Crashlytics: capture Flutter framework errors and uncaught async errors ──
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
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
  StreamSubscription<AuthEvent>? _authEventSub;

  @override
  void initState() {
    super.initState();
    _init();
    _authEventSub = AuthEventBus.instance.stream.listen((event) {
      if (event == AuthEvent.sessionExpired && _ready) {
        // Router is built and app is visible — navigate to splash.
        // Use addPostFrameCallback so we don't navigate during a build.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _router.go('/');
        });
      }
    });
  }

  @override
  void dispose() {
    _authEventSub?.cancel();
    super.dispose();
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
      await NotificationService.instance.initialize(rootNavigatorKey,onTokenRefresh: (token) => ref.read(authRepositoryProvider).updateFcmToken(token),
      );

      final token = await NotificationService.instance.getToken();
      debugPrint('=== FCM TOKEN: $token ===');

      final storage = const TokenStorageService(FlutterSecureStorage());
      // final testTime = DateTime.now().add(const Duration(minutes: 1));
      if (await storage.hasSession && await storage.role == 'pregnantWoman') {
        final granted = await MedicineReminderScheduler.instance.ensureExactAlarmPermission();
        if (!granted) {
          developer.log('Exact alarm permission denied — reminders will be inexact', name: 'MedicineReminder');
        }
        await MedicineReminderScheduler.instance.scheduleDaily(
          medicineType: 'iron',
          title: 'Time for your IFA tablet',
          body: 'Taking IFA every day prevents anemia and helps your baby grow',
          // hour: testTime.hour,
          // minute: testTime.minute,
        );
        await MedicineReminderScheduler.instance.scheduleDaily(
          medicineType: 'calcium',
          title: 'Time for your Calcium tablet',
          body: 'Calcium supports your and your baby\'s health during pregnancy',
        );
        await _flushMedicineQueue();
      }
    } catch (e, st) {
      debugPrint('⚠️ Destination resolve failed: $e\n$st');
      _router = buildAppRouter(initialLocation: '/');
    } finally {
      FlutterNativeSplash.remove();
      if (mounted) setState(() => _ready = true);
    }
  }

  Future<void> _flushMedicineQueue() async {
    final pending = await getPendingMedicineActions();
    for (final action in pending) {
      try {
        await ref.read(ancServicesControllerProvider.notifier).toggleMedicineDate(
          action.medicineType,
          DateTime.parse(action.takenDate),
          true,
        );
        await removePendingMedicineAction(action.id);
      } catch (_) {
        // Leave it queued — will retry on next app open.
      }
    }
  }

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