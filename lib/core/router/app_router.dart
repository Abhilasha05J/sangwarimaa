import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sangwari_maa/features/Emergency/data/model/emergency_args.dart';
import 'package:sangwari_maa/features/Emergency/presentation/pages/women_emergency.dart';
import 'package:sangwari_maa/features/auth/presentation/pages/login_page.dart';
import 'package:sangwari_maa/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:sangwari_maa/features/bpcr/presentation/pages/women_bpcr.dart';
import 'package:sangwari_maa/features/chatbot/presentation/pages/women_chatbot.dart';
import 'package:sangwari_maa/features/dashboard/presentation/pages/mitanins_dashboard.dart';
import 'package:sangwari_maa/features/dashboard/presentation/pages/womens_dashboard.dart';
import 'package:sangwari_maa/features/onboarding/presentation/pages/language_selection_page.dart';
import 'package:sangwari_maa/features/onboarding/presentation/pages/splash_page.dart';
import 'package:sangwari_maa/features/profile/presentation/pages/women_profile.dart';
import 'package:sangwari_maa/features/registration/presentation/pages/registration_page.dart';
import 'package:sangwari_maa/features/reminders/presentation/pages/women_reminders.dart';
import 'package:sangwari_maa/features/schemes/presentation/pages/maternal_schemes.dart';
import 'package:sangwari_maa/features/schemes/presentation/pages/scheme_details.dart';
import 'package:sangwari_maa/features/videomodule/presentation/pages/video_modules.dart';

abstract final class Routes {
  static const splash          = '/';
  static const language        = '/language';
  static const login           = '/language/login';
  static const otp             = '/language/login/otp';
  static const register        = '/language/register';
  static const womensDashboard = '/womensdashboard';
  static const maternalSchemes = '/womensdashboard/maternal-schemes';
  static const schemeDetails   = '/womensdashboard/maternal-schemes/:id';
  static const videoModules    = '/womensdashboard/video-modules';
  static const womenprofile    = '/womensdashboard/womenprofile';
  static const womenreminders  = '/womensdashboard/womenreminders';
  static const chatbot   = '/womensdashboard/chatbot';
  static const emergency = '/womensdashboard/emergency';
  static const bpcr      = '/womensdashboard/bpcr';
  static const bpcrDangerSignsPregnancy      = '/womensdashboard/bpcr/danger-signs-pregnancy';
  static const bpcrDangerSignsLabor          = '/womensdashboard/bpcr/danger-signs-labor';
  static const bpcrDangerSignsPostnatal      = '/womensdashboard/bpcr/danger-signs-postnatal';
  static const bpcrDangerSignsNewborn        = '/womensdashboard/bpcr/danger-signs-newborn';
  static const bpcrHealthFacilityId          = '/womensdashboard/bpcr/health-facility-id';
  static const bpcrSkillBirthAttendant       = '/womensdashboard/bpcr/skill-birth-attendant';
  static const bpcrTransportModality         = '/womensdashboard/bpcr/transport-modality';
  static const bpcrSavedMoneyDelivery        = '/womensdashboard/bpcr/saved-money-delivery';
  static const bpcrCommunityFinancialSupport = '/womensdashboard/bpcr/community-financial-support';
  static const bpcrCommunityBloodDonor       = '/womensdashboard/bpcr/community-blood-donor';


  //Mitanin
  static const mitaninDashboard  = '/mitanindashboard';
}

GoRouter buildAppRouter({String initialLocation = '/'}) => GoRouter(
  initialLocation: initialLocation,
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
              builder: (_, state) => RegistrationPage(
                initialMobile: state.extra as String?,
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/womensdashboard',
      name: 'Womensdashboard',
      builder: (_, __) => const WomensDashboard(),
      routes: [
        GoRoute(
        path: 'maternal-schemes',
        name: 'maternalSchemes',
        builder: (_, __)=> const MaternalSchemesPage(),

        routes: [
          GoRoute(
          path: ':id',
          name: 'schemeDetail',
          builder: (_, state) => SchemeDetailPage(schemeId: state.pathParameters['id']??'',
          ) ,
          ),
        ],
        ),
        GoRoute(
          path: 'video-modules',
          name: 'videoModules',
          builder: (_, __) => const VideoModulesScreen(),
        ),
        GoRoute(
          path: 'womenprofile',
          name: 'womenprofile',
          builder: (_, __) => const WomenProfileScreen(),
        ),
        GoRoute(
          path: 'womenreminders',
          name: 'womenreminders',
          builder: (_, __) => const WomenRemindersScreen(),
        ),
        GoRoute(
          path: 'chatbot',
          name: 'chatbot',
          builder: (_, __) => const ChatbotScreen(),
        ),
        GoRoute(
          path: 'emergency',
          name: 'emergency',
          builder: (_, state) => EmergencyScreen(
            args: state.extra as EmergencyArgs,
          ),
        ),
       GoRoute(
path: 'bpcr',
name: 'bpcr',
builder: (_, __) => const BpcrScreen(),
  routes: [
    GoRoute(
      path: 'danger-signs-pregnancy',
      name: 'dangerSignsPregnancy',
      builder: (_, __) => const _BpcrPlaceholder(title: 'Danger Signs — Pregnancy'),
    ),
    GoRoute(
      path: 'danger-signs-labor',
      name: 'dangerSignsLabor',
      builder: (_, __) => const _BpcrPlaceholder(title: 'Danger Signs — Labor & Childbirth'),
    ),
    GoRoute(
      path: 'danger-signs-postnatal',
      name: 'dangerSignsPostnatal',
      builder: (_, __) => const _BpcrPlaceholder(title: 'Danger Signs — Postnatal'),
    ),
    GoRoute(
      path: 'danger-signs-newborn',
      name: 'dangerSignsNewborn',
      builder: (_, __) => const _BpcrPlaceholder(title: 'Danger Signs — Newborn'),
    ),
    GoRoute(
      path: 'health-facility-id',
      name: 'healthFacilityId',
      builder: (_, __) => const _BpcrPlaceholder(title: 'Health Facility Identification'),
    ),
    GoRoute(
      path: 'skill-birth-attendant',
      name: 'skillBirthAttendant',
      builder: (_, __) => const _BpcrPlaceholder(title: 'Skilled Birth Attendant'),
    ),
    GoRoute(
      path: 'transport-modality',
      name: 'transportModality',
      builder: (_, __) => const _BpcrPlaceholder(title: 'Transport Modality'),
    ),
    GoRoute(
      path: 'saved-money-delivery',
      name: 'savedMoneyDelivery',
      builder: (_, __) => const _BpcrPlaceholder(title: 'Saved Money for Delivery'),
    ),
    GoRoute(
      path: 'community-financial-support',
      name: 'communityFinancialSupport',
      builder: (_, __) => const _BpcrPlaceholder(title: 'Community Financial Support'),
    ),
    GoRoute(
      path: 'community-blood-donor',
      name: 'communityBloodDonor',
      builder: (_, __) => const _BpcrPlaceholder(title: 'Community Blood Donor'),
    ),
  ],
)
      ],
    ),
    GoRoute(
      path: '/mitanindashboard',
      name: 'mitaninDashboard',
      builder: (_, __) => const MitaninsDashboard(),
    ),
  ],
  errorBuilder: (_, state) => Scaffold(
    body: Center(child: Text('Route not found: ${state.uri}')),
  ),
);


// ─────────────────────────────────────────────────────────────────────────────
// TEMPORARY placeholder — delete once real BPCR detail screens are built.
// ─────────────────────────────────────────────────────────────────────────────
class _BpcrPlaceholder extends StatelessWidget {
  final String title;
  const _BpcrPlaceholder({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title — coming soon')),
    );
  }
}
