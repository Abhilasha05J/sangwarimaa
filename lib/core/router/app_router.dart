// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sangwari_maa/features/auth/presentation/pages/login_page.dart';
// import 'package:sangwari_maa/features/auth/presentation/pages/otp_verification_page.dart';
// import 'package:sangwari_maa/features/dashboard/presentation/pages/womens_dashboard.dart';
// import 'package:sangwari_maa/features/onboarding/presentation/pages/language_selection_page.dart';
// import 'package:sangwari_maa/features/onboarding/presentation/pages/splash_page.dart';
// import 'package:sangwari_maa/features/registration/presentation/pages/registration_page.dart';
//
// abstract final class Routes {
//   static const splash   = '/';
//   static const language = '/language';
//   static const login    = '/language/login';
//   static const otp      = '/language/login/otp';
//   static const register = '/language/register';
//   static const Womensdashboard     = '/womensdashboard';
// }
//
// final appRouter = GoRouter(
//   initialLocation: Routes.splash,
//   debugLogDiagnostics: true,
//   routes: [
//     GoRoute(
//       path: '/',
//       name: 'splash',
//       builder: (_, __) => const SplashPage(),
//       routes: [
//         GoRoute(
//           path: 'language',
//           name: 'language',
//           builder: (_, __) => const LanguageSelectionPage(),
//           routes: [
//             GoRoute(
//               path: 'login',
//               name: 'login',
//               builder: (_, __) => const LoginPage(),
//               routes: [
//                 GoRoute(
//                   path: 'otp',
//                   name: 'otp',
//                   builder: (_, state) => OtpVerificationPage(
//                     mobile: state.extra as String? ?? '',
//                   ),
//                 ),
//               ],
//             ),
//             GoRoute(
//               path: 'register',
//               name: 'register',
//               builder: (_, __) => const RegistrationPage(),
//             ),
//           ],
//         ),
//       ],
//     ),
//     GoRoute(
//       path: '/womensdashboard',
//       name: 'Womensdashboard',
//       builder: (_, __) => const WomensDashboard(),
//     ),
//   ],
//   errorBuilder: (_, state) => Scaffold(
//     body: Center(child: Text('Route not found: ${state.uri}')),
//   ),
// );
//
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/features/auth/presentation/pages/login_page.dart';
import 'package:sangwari_maa/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:sangwari_maa/features/dashboard/presentation/pages/womens_dashboard.dart';
import 'package:sangwari_maa/features/onboarding/presentation/pages/language_selection_page.dart';
import 'package:sangwari_maa/features/onboarding/presentation/pages/splash_page.dart';
import 'package:sangwari_maa/features/registration/presentation/pages/registration_page.dart';

abstract final class Routes {
  static const splash          = '/';
  static const language        = '/language';
  static const login           = '/language/login';
  static const otp             = '/language/login/otp';
  static const register        = '/language/register';
  static const womensDashboard = '/womensdashboard';
}

GoRouter buildAppRouter() => GoRouter(
  initialLocation: Routes.splash,
    debugLogDiagnostics: kDebugMode,
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (_, __) => const SplashPage(),
      routes: [
        GoRoute(
          path: 'language',
          name: 'language',
          builder: (_, __) => const LanguageSelectionPage(),
          routes: [
            GoRoute(
              path: 'login',
              name: 'login',
              builder: (_, __) => const LoginPage(),
              routes: [
                GoRoute(
                  path: 'otp',
                  name: 'otp',
                  builder: (_, state) => OtpVerificationPage(
                    mobile: state.extra as String? ?? '',
                  ),
                ),
              ],
            ),
            GoRoute(
              path: 'register',
              name: 'register',
              builder: (_, __) => const RegistrationPage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/womensdashboard',
      name: 'Womensdashboard',
      builder: (_, __) => const WomensDashboard(),
    ),
  ],
  errorBuilder: (_, state) => Scaffold(
    body: Center(child: Text('Route not found: ${state.uri}')),
  ),
);