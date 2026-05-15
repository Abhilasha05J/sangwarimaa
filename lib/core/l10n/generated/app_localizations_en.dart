// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Sangwari Maa';

  @override
  String get appTagline => 'Your Maternal Health Companion';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageHindi => 'हिंदी';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get continueLabel => 'Continue';

  @override
  String get splashStart => 'Let\'s Start';

  @override
  String get splashTaglineEn =>
      'Sangwari MAA is a reliable pregnancy companion, providing timely guidance, reminders, and alerts to support informed decisions and ensure a safe, confident maternal journey.';

  @override
  String get splashTaglineHi =>
      'संगवारी MAA एक भरोसेमंद गर्भावस्था साथी है, जो समय पर मार्गदर्शन, रिमाइंडर और चेतावनी देकर सुरक्षित और जागरूक मातृत्व यात्रा सुनिश्चित करती है';

  @override
  String get languageTitle => 'Welcome to Sangwari MAA';

  @override
  String get chooseLanguage => 'Choose your preferred language.';

  @override
  String get registerHere => 'Register here';

  @override
  String get identityVerification => 'Identity Verification';

  @override
  String get loginTitle => 'Login';

  @override
  String get noAccount => 'Don\'t have an account?';

  @override
  String get registerTitle => 'Register to create account';

  @override
  String get mobileOtp => 'Mobile OTP';

  @override
  String get mothersProfile => 'Mother\'s Profile';

  @override
  String get fullNameHint => 'Enter Your Full Name';

  @override
  String get ageHint => 'Years';

  @override
  String get husbandsAge => 'Husband\'s Age';

  @override
  String get dateHint => 'dd-mm-yyyy';

  @override
  String get currentAddress => 'Current Address';

  @override
  String get addressHint => 'Enter Residential Address';

  @override
  String get bloodGroupHint => 'Select';

  @override
  String get gestationalAge => 'Gestational Age';

  @override
  String get gestationalAgeHint => 'Weeks';

  @override
  String get lmpDetails => 'LMP Details';

  @override
  String get eddHint => 'Calculated Delivery Date';

  @override
  String get healthCenter => 'Health Center Selection';

  @override
  String get selectVillage => 'Select Village';

  @override
  String get selectVillageHint => 'Select Village';

  @override
  String get phc => 'Primary Health Center (PHC)';

  @override
  String get phcHint => 'Select Nearest PHC';

  @override
  String get completeReg => 'Complete Registration';

  @override
  String get invalidMobile => 'Please enter a valid 10-digit mobile number';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get submit => 'Submit';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String get back => 'Back';

  @override
  String get next => 'Next';

  @override
  String get loading => 'Loading…';

  @override
  String get retry => 'Retry';

  @override
  String get ok => 'OK';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get search => 'Search';

  @override
  String get filter => 'Filter';

  @override
  String get all => 'All';

  @override
  String get noDataFound => 'No data found';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get errorNetwork => 'No internet connection. Working offline.';

  @override
  String get errorSessionExpired => 'Session expired. Please log in again.';

  @override
  String get successLabel => 'Success';

  @override
  String get welcomeGreeting => 'Namaste, I am Sangwari Maa';

  @override
  String get welcomeSubtitle =>
      'Your trusted companion for a safe pregnancy journey';

  @override
  String get startRegistration => 'Start Registration';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get loginLabel => 'Login';

  @override
  String get mobileNumber => 'Mobile Number';

  @override
  String get enterMobileNumber => 'Enter 10-digit mobile number';

  @override
  String get sendOtp => 'Send OTP';

  @override
  String get enterOtp => 'Enter 6-digit OTP';

  @override
  String otpSentTo(String mobile) {
    return 'An OTP has been sent on $mobile';
  }

  @override
  String get verifyOtp => 'Verify OTP';

  @override
  String get resendOtp => 'Resend OTP';

  @override
  String resendOtpIn(int seconds) {
    return 'Resend in ${seconds}s';
  }

  @override
  String get invalidOtp => 'Invalid OTP. Please try again.';

  @override
  String get otpExpired => 'OTP expired. Please request a new one.';

  @override
  String get loginWithEmail => 'Login with Email';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get twoFactorOtp => 'Two-Factor OTP';

  @override
  String get registrationTitle => 'New Registration';

  @override
  String get fullName => 'Full Name';

  @override
  String get age => 'Age';

  @override
  String get dateOfBirth => 'Date of Birth';

  @override
  String get husbandName => 'Husband\'s Name';

  @override
  String get husbandMobile => 'Husband\'s Mobile';

  @override
  String get lmpDate => 'Last Menstrual Period (LMP)';

  @override
  String get expectedDeliveryDate => 'Expected Delivery Date';

  @override
  String get bloodGroup => 'Blood Group';

  @override
  String get address => 'Address';

  @override
  String get village => 'Village';

  @override
  String get block => 'Block';

  @override
  String get district => 'District';

  @override
  String get subcentre => 'Sub-centre';

  @override
  String get ashaName => 'ASHA Name';

  @override
  String get consentTitle => 'Digital Health Consent';

  @override
  String get consentBody =>
      'I hereby give my consent to store and process my medical records for prenatal care. I understand that my data will be used to provide me the personalized health alerts and AI assistance.';

  @override
  String get consentRequired => 'Please accept consent to proceed.';

  @override
  String get registrationSuccess => 'Registration successful!';

  @override
  String get homeDashboard => 'Home';

  @override
  String get myProfile => 'My Profile';

  @override
  String get bpcrModule => 'BPCR Module';

  @override
  String get maternalSchemes => 'Maternal Schemes';

  @override
  String get ancServices => 'ANC Services';

  @override
  String get faqs => 'FAQs';

  @override
  String get reminders => 'Reminders';

  @override
  String get emergency => 'Emergency';

  @override
  String get notifications => 'Notifications';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirm => 'Are you sure you want to logout?';

  @override
  String get bpcrTitle => 'Birth Preparedness';

  @override
  String get bpcrSubtitle => 'Complete all 10 components for a safe delivery';

  @override
  String get bpcrScore => 'BPCR Score';

  @override
  String bpcrScoreValue(int score) {
    return '$score/10';
  }

  @override
  String get bpcrRiskHigh => 'High Risk';

  @override
  String get bpcrRiskMedium => 'Medium Risk';

  @override
  String get bpcrRiskLow => 'Low Risk';

  @override
  String get bpcrComponent1 => 'Identified skilled birth attendant';

  @override
  String get bpcrComponent2 => 'Identified delivery place';

  @override
  String get bpcrComponent3 => 'Identified transport';

  @override
  String get bpcrComponent4 => 'Saved money for delivery';

  @override
  String get bpcrComponent5 => 'Identified blood donor';

  @override
  String get bpcrComponent6 => 'Made arrangements for other children';

  @override
  String get bpcrComponent7 => 'Aware of danger signs';

  @override
  String get bpcrComponent8 => 'ANC visits completed';

  @override
  String get bpcrComponent9 => 'Iron-folic acid tablets taken';

  @override
  String get bpcrComponent10 => 'TT vaccination done';

  @override
  String get bpcrCompleted => 'Completed';

  @override
  String get bpcrPending => 'Pending';

  @override
  String get bpcrIncomplete => 'Incomplete';

  @override
  String get bpcrUpdateSuccess => 'BPCR checklist updated.';

  @override
  String get schemesTitle => 'Maternal Schemes';

  @override
  String get schemeJsy => 'Janani Suraksha Yojana (JSY)';

  @override
  String get schemeJssk => 'Janani-Shishu Suraksha Karyakram (JSSK)';

  @override
  String get schemePmsma => 'Pradhan Mantri Surakshit Matritva Abhiyan (PMSMA)';

  @override
  String get schemePmmvy => 'Pradhan Mantri Matru Vandana Yojana (PMMVY)';

  @override
  String get schemeMinimata => 'Minimata Mahtari Jatan Yojana';

  @override
  String get eligibility => 'Eligibility';

  @override
  String get howToApply => 'How to Apply';

  @override
  String get benefits => 'Benefits';

  @override
  String get applyNow => 'Apply Now';

  @override
  String get learnMore => 'Learn More';

  @override
  String get ancTitle => 'ANC Services';

  @override
  String get ancVisitManager => 'Visit Manager';

  @override
  String get ancHighRiskScreening => 'High-Risk Screening';

  @override
  String get ancSymptomChecker => 'Symptom Checker';

  @override
  String get ancWeekByWeek => 'Week-by-Week Guide';

  @override
  String get ancNutrition => 'Nutrition & Diet';

  @override
  String get ancVisitDue => 'ANC Visit Due';

  @override
  String ancVisitOverdue(int days) {
    return 'ANC visit overdue by $days days';
  }

  @override
  String ancVisitScheduled(String date) {
    return 'Next visit: $date';
  }

  @override
  String get ancVisit1 => '1st ANC Visit';

  @override
  String get ancVisit2 => '2nd ANC Visit';

  @override
  String get ancVisit3 => '3rd ANC Visit';

  @override
  String get ancVisit4 => '4th ANC Visit';

  @override
  String ancVisitCompleted(String date) {
    return 'Visit completed on $date';
  }

  @override
  String get trimester1 => '1st Trimester';

  @override
  String get trimester2 => '2nd Trimester';

  @override
  String get trimester3 => '3rd Trimester';

  @override
  String weekLabel(int week) {
    return 'Week $week';
  }

  @override
  String get chatbotTitle => 'Ask Sangwari Maa';

  @override
  String get chatbotPlaceholder => 'Type your question…';

  @override
  String get chatbotSend => 'Send';

  @override
  String get chatbotTyping => 'Sangwari Maa is typing…';

  @override
  String get faqTitle => 'Frequently Asked Questions';

  @override
  String get faqEmpty => 'No FAQs available at the moment.';

  @override
  String get remindersTitle => 'My Reminders';

  @override
  String get reminderAncVisit => 'ANC Visit Reminder';

  @override
  String get reminderMedicine => 'Medicine Reminder';

  @override
  String get reminderFollowUp => 'Follow-up Reminder';

  @override
  String reminderSetFor(String time) {
    return 'Set for $time';
  }

  @override
  String get reminderAddNew => 'Add Reminder';

  @override
  String get reminderDeleteConfirm => 'Delete this reminder?';

  @override
  String get emergencyTitle => 'Emergency Help';

  @override
  String get emergencyDangerSigns => 'Danger Signs';

  @override
  String get emergencyCallAmbulance => 'Call Ambulance (102/108)';

  @override
  String get emergencyCallAsha => 'Notify My ASHA';

  @override
  String get emergencySafetyConfirm => 'Are you safe now?';

  @override
  String get emergencySafetyYes => 'Yes, I am safe';

  @override
  String get emergencySafetyNo => 'No, I still need help';

  @override
  String get dangerSign1 => 'Heavy bleeding';

  @override
  String get dangerSign2 => 'Severe headache or blurred vision';

  @override
  String get dangerSign3 => 'High fever';

  @override
  String get dangerSign4 => 'Fits or convulsions';

  @override
  String get dangerSign5 => 'Reduced or no fetal movement';

  @override
  String get dangerSign6 => 'Severe abdominal pain';

  @override
  String get dangerSign7 => 'Swelling of hands, face, or feet';

  @override
  String get dangerSign8 => 'Difficulty breathing';

  @override
  String get ashaHomeTitle => 'ASHA / ANM Dashboard';

  @override
  String get activeAlerts => 'Active Alerts';

  @override
  String get hrpCount => 'High-Risk Pregnancies';

  @override
  String get dueAncVisits => 'ANC Visits Due Today';

  @override
  String get totalRegistered => 'Total Rloegistered';

  @override
  String get viewAll => 'View All';

  @override
  String get alertsTitle => 'Alerts';

  @override
  String get alertRiskRed => 'Red Alert';

  @override
  String get alertRiskYellow => 'Yellow Alert';

  @override
  String alertTimeAgo(String time) {
    return '$time ago';
  }

  @override
  String get alertSymptoms => 'Symptoms';

  @override
  String get alertStatus => 'Status';

  @override
  String get alertStatusNotContacted => 'Not Contacted';

  @override
  String get alertStatusContacted => 'Contacted';

  @override
  String get alertStatusReferred => 'Referred to Facility';

  @override
  String get alertStatusResolved => 'Resolved';

  @override
  String get alertUpdateStatus => 'Update Status';

  @override
  String get alertCallBeneficiary => 'Call Beneficiary';

  @override
  String get alertCallAmbulance => 'Call Ambulance (102/108)';

  @override
  String get alertNavigate => 'Navigate to Location';

  @override
  String get alertOpenVisitForm => 'Open Visit Form';

  @override
  String get alertDetailTitle => 'Alert Details';

  @override
  String get alertBeneficiaryInfo => 'Beneficiary Information';

  @override
  String get beneficiaryListTitle => 'Beneficiaries';

  @override
  String get beneficiarySearch => 'Search by name or ID';

  @override
  String get filterHighRisk => 'High Risk';

  @override
  String get filterBpcrIncomplete => 'BPCR Incomplete';

  @override
  String get beneficiaryDetailTitle => 'Beneficiary Details';

  @override
  String get ancHistory => 'ANC History';

  @override
  String get visitLog => 'Visit Log';

  @override
  String get activityTracker => 'Activity Tracker';

  @override
  String get facilityTitle => 'Nearby Facilities';

  @override
  String facilityDistance(String distance) {
    return '$distance km away';
  }

  @override
  String get facilityGetDirections => 'Get Directions';

  @override
  String get currentLocation => 'Current Location';

  @override
  String get responseTimeTitle => 'Response Time';

  @override
  String get responseAvgMinutes => 'Avg. Response Time';

  @override
  String get responseWithin1hr => 'Within 1 Hour';

  @override
  String get responseDelayed => 'Delayed Cases (>72hr)';

  @override
  String get actionInProgress => 'In Progress';

  @override
  String get actionClosed => 'Closed';

  @override
  String get adminDashboardTitle => 'Admin Dashboard';

  @override
  String get panelOverview => 'Overview';

  @override
  String get panelBpcrAnalytics => 'BPCR Analytics';

  @override
  String get panelAlertMonitoring => 'Alert Monitoring';

  @override
  String get panelResponseTime => 'Response Time';

  @override
  String get panelUserEngagement => 'User Engagement';

  @override
  String get panelGisMap => 'GIS Map';

  @override
  String get panelDataExport => 'Data Export';

  @override
  String get panelSettings => 'Settings';

  @override
  String get statTotalRegistered => 'Total Registered';

  @override
  String get statActiveUsers => 'Active Users';

  @override
  String get statDropOffPercent => 'Drop-off Rate';

  @override
  String get statAvgBpcr => 'Avg. BPCR Score';

  @override
  String get statActiveAlerts => 'Active Alerts';

  @override
  String get statDau => 'Daily Active Users';

  @override
  String get statRemindersPerUser => 'Reminders / User';

  @override
  String get statMostUsedModule => 'Most Used Module';

  @override
  String get analyticsScoreDistribution => 'Score Distribution';

  @override
  String get analyticsTrendLine => 'Trend';

  @override
  String get analyticsBlockWise => 'Block-wise Comparison';

  @override
  String get mapHighRiskPins => 'High-Risk Pregnancies';

  @override
  String get mapAlertLocations => 'Alert Locations';

  @override
  String get mapFacilityOverlay => 'Facilities';

  @override
  String get exportTitle => 'Export Data';

  @override
  String get exportFilterBlock => 'Block';

  @override
  String get exportFilterTrimester => 'Trimester';

  @override
  String get exportFilterRisk => 'Risk Level';

  @override
  String get exportFilterDateRange => 'Date Range';

  @override
  String get exportDownloadExcel => 'Download Excel';

  @override
  String get exportDownloadCsv => 'Download CSV';

  @override
  String get exportGenerating => 'Generating export…';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsAlertThreshold => 'Alert Threshold';

  @override
  String get settingsAddAdmin => 'Add Block Admin / BMO';

  @override
  String get settingsRoleLabel => 'Role';

  @override
  String get roleWoman => 'Pregnant Woman';

  @override
  String get roleAsha => 'ASHA';

  @override
  String get roleAnm => 'ANM';

  @override
  String get roleBlockAdmin => 'Block Admin';

  @override
  String get roleBmo => 'BMO';

  @override
  String get rolePi => 'Programme Investigator';

  @override
  String get roleSuperAdmin => 'Super Admin';

  @override
  String get uniqueId => 'Unique ID';

  @override
  String get area => 'Area';

  @override
  String get profileConfirmation => 'Please confirm your profile details';

  @override
  String get profileName => 'Name';

  @override
  String get profileRole => 'Role';

  @override
  String get profileArea => 'Area';

  @override
  String get profileSubcentre => 'Sub-centre';

  @override
  String get profileUniqueId => 'Unique ID';

  @override
  String get confirmDetails => 'Confirm Details';

  @override
  String get offlineBannerMessage =>
      'You are offline. Data will sync when connected.';

  @override
  String get syncingData => 'Syncing data…';

  @override
  String lastSynced(String time) {
    return 'Last synced: $time';
  }

  @override
  String versionLabel(String version) {
    return 'Version $version';
  }
}
