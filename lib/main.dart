// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
// import 'package:sangwari_maa/core/router/app_router.dart';
// import 'package:sangwari_maa/shared/providers/locale_provider.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
//
// import 'core/services/token_storage_service.dart';
//
// void main() {
//   final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//
//   // Keep the native splash visible until we explicitly remove it.
//   // This hides the blank white frame while Flutter warms up.
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//
//   // TODO: await Firebase.initializeApp(...) — also add here, not in build()
//
//   runApp(const ProviderScope(child: SangwariMaaApp()));
// }
//
// class SangwariMaaApp extends ConsumerStatefulWidget {
//   const SangwariMaaApp({super.key});
//
//   @override
//   ConsumerState<SangwariMaaApp> createState() => _SangwariMaaAppState();
// }
//
// class _SangwariMaaAppState extends ConsumerState<SangwariMaaApp> {
//   // GoRouter is created once here, NOT as a global top-level variable.
//   //
//   // A top-level `final appRouter = GoRouter(...)` is constructed during Dart
//   // static/module initialization — before main() runs and before the engine
//   // is ready. That synchronous construction (route objects, ChangeNotifier
//   // setup, delegate init) is what caused the 138-frame skip on startup.
//   //
//   // Putting it in initState() defers construction to after the first frame
//   // is scheduled, so it never blocks painting.
//   late final GoRouter _router;
//   bool _ready = false;
//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }
//   Future<void> _init() async {
//     // Check session and role before building the router so initialLocation
//     // is correct on the very first frame — no redirect flicker.
//     final storage = const TokenStorageService(FlutterSecureStorage());
//     final hasSession = await storage.hasSession;
//     final role = await storage.role;
//
//     String initialLocation;
//     if (hasSession) {
//       if (role == 'asha' || role == 'anm') {
//         initialLocation = '/mitanindashboard';
//       } else
//       if (role == 'block_admin' || role == 'pi' || role == 'super_admin') {
//         initialLocation =
//         '/admindashboard'; // falls back to splash if route doesn't exist yet
//       } else {
//         initialLocation = '/womensdashboard';
//       }
//     } else {
//       initialLocation = '/'; // splash — new/logged-out user
//     }
//
//     _router = buildAppRouter(initialLocation: initialLocation);
//
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       FlutterNativeSplash.remove();
//       if (mounted) setState(() => _ready = true);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     if (!_ready) return const MaterialApp(home: Scaffold(backgroundColor: Colors.white));
//     final locale = ref.watch(localeProvider);
//     return MaterialApp.router(
//       title: 'Sangwari MAA',
//       debugShowCheckedModeBanner: false,
//       locale: locale,
//       localizationsDelegates: const [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: AppLocalizations.supportedLocales,
//       routerConfig: _router,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/core/router/app_router.dart';
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

  // Future<void> _init() async {
  //   // Check session and role before building the router so initialLocation
  //   // is correct on the very first frame — no redirect flicker.
  //   final storage = const TokenStorageService(FlutterSecureStorage());
  //   final hasSession = await storage.hasSession;
  //   final role = await storage.role;
  //
  //   String initialLocation;
  //   if (hasSession) {
  //     if (role == 'asha' || role == 'anm') {
  //       initialLocation = '/mitanindashboard';
  //     } else if (role == 'block_admin' || role == 'pi' || role == 'super_admin') {
  //       initialLocation = '/admindashboard'; // falls back to splash if route doesn't exist yet
  //     } else {
  //       initialLocation = '/womensdashboard';
  //     }
  //   } else {
  //     initialLocation = '/'; // splash — new/logged-out user
  //   }
  //
  //   _router = buildAppRouter(initialLocation: initialLocation);
  //
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     FlutterNativeSplash.remove();
  //     if (mounted) setState(() => _ready = true);
  //   });
  // }
  Future<void> _init() async {
    try {
      final storage = const TokenStorageService(FlutterSecureStorage());
      final hasSession = await storage.hasSession;
      final role = await storage.role;

      String initialLocation;
      if (hasSession) {
        if (role == 'asha' || role == 'anm') {
          initialLocation = '/mitanindashboard';
        } else if (role == 'block_admin' || role == 'pi' || role == 'super_admin') {
          initialLocation = '/admindashboard';
        } else {
          initialLocation = '/womensdashboard';
        }
      } else {
        initialLocation = '/';
      }

      _router = buildAppRouter(initialLocation: initialLocation);
    } catch (e, st) {
      // Storage read failed — safe fallback, user goes through normal login flow
      debugPrint('⚠️ Session check failed: $e\n$st'); // replace with your crash reporter later
      _router = buildAppRouter(initialLocation: '/');
    } finally {
      // Always remove splash and show the app regardless of what happened above.
      // Called directly here — NOT inside addPostFrameCallback — so it fires
      // even if no frame has been scheduled yet.
      FlutterNativeSplash.remove();
      if (mounted) setState(() => _ready = true);
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