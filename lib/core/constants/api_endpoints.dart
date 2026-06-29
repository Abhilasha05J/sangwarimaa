class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://sangwarimaa.onrender.com';

  // ── Auth ──────────────────────────────
  static const String sendOtp   = '/api/v1/auth/send-otp';
  static const String verifyOtp = '/api/v1/auth/verify-otp';
  static const String refresh   = '/api/v1/auth/refresh';
  static const String logout    = '/api/v1/auth/logout';
  static const String me        = '/api/v1/auth/me';
  static const String updateFcm = '/api/v1/auth/update-fcm';

  // ── Women ─────────────────────────────
  static const String womenRegister        = '/api/v1/women/register';
  static const String womenProfile         = '/api/v1/women/profile';
  static const String pregnancyCurrent     = '/api/v1/women/pregnancy/current';
  static String pregnancyWeek(int week)    => '/api/v1/women/pregnancy/week/$week';
  static const String bpcr                 = '/api/v1/women/bpcr';
  static const String bpcrRespond          = '/api/v1/women/bpcr/respond';
  static const String ancServices          = '/api/v1/women/anc-services';
  static const String appointments         = '/api/v1/women/appointments';
  static const String reminders            = '/api/v1/women/reminders';
  static const String schemes              = '/api/v1/women/schemes';
  static const String schemeEligibility    = '/api/v1/women/schemes/eligibility';
  static String schemeDetail(String id)    => '/api/v1/women/schemes/$id';
  static const String faqs                 = '/api/v1/women/faqs';
  static const String chatbotHistory       = '/api/v1/women/chatbot/history';
  static const String chatbotMessage       = '/api/v1/women/chatbot/message';
  static const String chatbotFeedback      = '/api/v1/women/chatbot/feedback';
  static const String dangerSign           = '/api/v1/women/danger-sign';
  static const String emergency            = '/api/v1/women/emergency';
  static const String emergencyContacts    = '/api/v1/women/emergency/contacts';
  static const String symptomChecker       = '/api/v1/women/symptom-checker';
  static const String nutrition            = '/api/v1/women/nutrition';
  static const String lifestyle            = '/api/v1/women/lifestyle';
  static const String tests                = '/api/v1/women/tests';
  static const String healthDashboard      = '/api/v1/women/health-dashboard';
  static const String postnatal            = '/api/v1/women/postnatal';
  static const String newbornCare          = '/api/v1/women/newborn-care';
  static const String medicineReminders    = '/api/v1/women/reminders/medicine';

  // ── Mitanin (ASHA/ANM) ────────────────
  static const String mitaninRegister        = '/api/v1/mitanin/register';
  static const String mitaninProfile         = '/api/v1/mitanin/profile';
  static const String mitaninDashboard       = '/api/v1/mitanin/dashboard';
  static const String beneficiaries          = '/api/v1/mitanin/beneficiaries';
  static String beneficiaryDetail(String id) => '/api/v1/mitanin/beneficiaries/$id';
  static String beneficiaryRisk(String id)   => '/api/v1/mitanin/beneficiaries/$id/risk';
  static const String mitaninAlerts          = '/api/v1/mitanin/alerts';
  static String mitaninAlertDetail(String id)=> '/api/v1/mitanin/alerts/$id';
  static String mitaninAlertStatus(String id)=> '/api/v1/mitanin/alerts/$id/status';
  static const String ancVisits              = '/api/v1/mitanin/anc-visits';
  static String ancVisitHistory(String id)   => '/api/v1/mitanin/anc-visits/$id';
  static const String mitaninBpcr            = '/api/v1/mitanin/bpcr';
  static const String overdueAnc             = '/api/v1/mitanin/overdue-anc';
  static const String highRisk               = '/api/v1/mitanin/high-risk';
  static const String mitaninFacilities      = '/api/v1/mitanin/facilities';
  static const String accountability         = '/api/v1/mitanin/accountability';
  static const String visitLog               = '/api/v1/mitanin/visit-log';
  static String visitLogHistory(String id)   => '/api/v1/mitanin/visit-log/$id';

  // ── Admin ─────────────────────────────
  static const String adminLogin           = '/api/v1/admin/login';
  static const String overview             = '/api/v1/admin/overview';
  static const String bpcrDistribution     = '/api/v1/admin/bpcr/distribution';
  static const String bpcrTrend            = '/api/v1/admin/bpcr/trend';
  static const String bpcrBlockComparison  = '/api/v1/admin/bpcr/block-comparison';
  static const String adminAlerts          = '/api/v1/admin/alerts';
  static String adminAlertDetail(String id)=> '/api/v1/admin/alerts/$id';
  static const String responseTime         = '/api/v1/admin/response-time';
  static const String engagement           = '/api/v1/admin/engagement';
  static const String gisHighRisk          = '/api/v1/admin/gis/high-risk';
  static const String gisAlerts            = '/api/v1/admin/gis/alerts';
  static const String exportBpcr           = '/api/v1/admin/export/bpcr';
  static const String exportUsers          = '/api/v1/admin/export/users';
  static const String exportAlerts         = '/api/v1/admin/export/alerts';
  static const String adminUsers           = '/api/v1/admin/users';
  static String adminUserDetail(String id) => '/api/v1/admin/users/$id';
  static const String settings             = '/api/v1/admin/settings';
  static const String adminFacilities      = '/api/v1/admin/facilities';
  static String adminFacilityDetail(String id) => '/api/v1/admin/facilities/$id';
}