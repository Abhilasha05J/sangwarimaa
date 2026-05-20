import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/core/l10n/generated/app_localizations.dart';
import 'package:sangwari_maa/core/router/app_router.dart';
import 'package:sangwari_maa/shared/providers/locale_provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Keep the native splash visible until we explicitly remove it.
  // This hides the blank white frame while Flutter warms up.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // TODO: await Firebase.initializeApp(...) — also add here, not in build()

  runApp(const ProviderScope(child: SangwariMaaApp()));
}

class SangwariMaaApp extends ConsumerStatefulWidget {
  const SangwariMaaApp({super.key});

  @override
  ConsumerState<SangwariMaaApp> createState() => _SangwariMaaAppState();
}

class _SangwariMaaAppState extends ConsumerState<SangwariMaaApp> {
  // GoRouter is created once here, NOT as a global top-level variable.
  //
  // A top-level `final appRouter = GoRouter(...)` is constructed during Dart
  // static/module initialization — before main() runs and before the engine
  // is ready. That synchronous construction (route objects, ChangeNotifier
  // setup, delegate init) is what caused the 138-frame skip on startup.
  //
  // Putting it in initState() defers construction to after the first frame
  // is scheduled, so it never blocks painting.
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = buildAppRouter(); // see app_router.dart
    // Remove native splash on the first frame after the widget tree is ready.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
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