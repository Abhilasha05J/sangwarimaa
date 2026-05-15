import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/core/router/app_router.dart';
import 'package:sangwari_maa/shared/providers/locale_provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
 // TODO: await Firebase.initializeApp(...)
  runApp(
      const ProviderScope(child: SangwariMaaApp())
  );
}

class SangwariMaaApp extends ConsumerWidget {
  const SangwariMaaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Rebuilds whenever the user switches language
    final locale = ref.watch(localeProvider);
    return MaterialApp.router(
      title: 'Sangwari MAA',
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false,
      // ── Localization setup ──────────────────────────────────────────────
      locale: locale,          // [en, hi]
      localizationsDelegates: const [
        AppLocalizations.delegate,                  // generated delegate
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,

      // ────────────────────────────────────────────────────────────────────

      // ── Router ────────────────────────────────────────────────────────
      routerConfig: appRouter,
    );
  }
}


/// Simple role-based router placeholder.
/// Replace with your actual GoRouter / auto_route setup.
// class _RootRouter extends StatefulWidget {
//   const _RootRouter();
//
//   @override
//   State<_RootRouter> createState() => _RootRouterState();
// }
//
// class _RootRouterState extends State<_RootRouter> {
//
//   @override
//   void initState() {
//     super.initState();
//     FlutterNativeSplash.remove(); // ← splash dismissed as soon as first frame is ready
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: replace with your GoRouter / auto_route setup
//     return const Scaffold(
//       body: Center(child: Text('App loaded. Wire up your router here.')),
//     );
//   }
// }
//
