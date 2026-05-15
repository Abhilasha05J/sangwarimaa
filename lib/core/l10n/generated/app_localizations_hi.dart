// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'संगवारी माँ';

  @override
  String get appTagline => 'आपकी मातृत्व स्वास्थ्य साथी';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageHindi => 'हिंदी';

  @override
  String get selectLanguage => 'भाषा चुनें';

  @override
  String get continueLabel => 'जारी रखें';

  @override
  String get splashStart => 'चलिए शुरू करें';

  @override
  String get splashTaglineEn =>
      'Sangwari MAA is a reliable pregnancy companion, providing timely guidance, reminders, and alerts to support informed decisions and ensure a safe, confident maternal journey.';

  @override
  String get splashTaglineHi =>
      'संगवारी MAA एक भरोसेमंद गर्भावस्था साथी है, जो समय पर मार्गदर्शन, रिमाइंडर और चेतावनी देकर सुरक्षित और जागरूक मातृत्व यात्रा सुनिश्चित करती है';

  @override
  String get languageTitle => 'संगवारी MAA में आपका स्वागत है';

  @override
  String get chooseLanguage => 'अपनी पसंदीदा भाषा चुनें।';

  @override
  String get registerHere => 'यहाँ पंजीकरण करें';

  @override
  String get identityVerification => 'पहचान सत्यापन';

  @override
  String get loginTitle => 'अपने खाते में लॉग इन करें';

  @override
  String get noAccount => 'खाता नहीं है?';

  @override
  String get registerTitle => 'खाता बनाने के लिए पंजीकरण करें';

  @override
  String get mobileOtp => 'मोबाइल OTP';

  @override
  String get mothersProfile => 'माँ की प्रोफ़ाइल';

  @override
  String get fullNameHint => 'अपना पूरा नाम दर्ज करें';

  @override
  String get ageHint => 'वर्ष';

  @override
  String get husbandsAge => 'पति की आयु';

  @override
  String get dateHint => 'दिन-माह-वर्ष';

  @override
  String get currentAddress => 'वर्तमान पता';

  @override
  String get addressHint => 'आवासीय पता दर्ज करें';

  @override
  String get bloodGroupHint => 'चुनें';

  @override
  String get gestationalAge => 'गर्भकालीन आयु';

  @override
  String get gestationalAgeHint => 'सप्ताह';

  @override
  String get lmpDetails => 'LMP विवरण';

  @override
  String get eddHint => 'अनुमानित प्रसव तिथि';

  @override
  String get healthCenter => 'स्वास्थ्य केंद्र चयन';

  @override
  String get selectVillage => 'गाँव चुनें';

  @override
  String get selectVillageHint => 'गाँव चुनें';

  @override
  String get phc => 'प्राथमिक स्वास्थ्य केंद्र (PHC)';

  @override
  String get phcHint => 'निकटतम PHC चुनें';

  @override
  String get completeReg => 'पंजीकरण पूरा करें';

  @override
  String get invalidMobile => 'कृपया 10 अंकों का वैध मोबाइल नंबर दर्ज करें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get save => 'सहेजें';

  @override
  String get submit => 'जमा करें';

  @override
  String get edit => 'संपादित करें';

  @override
  String get delete => 'हटाएं';

  @override
  String get back => 'वापस';

  @override
  String get next => 'आगे';

  @override
  String get loading => 'लोड हो रहा है…';

  @override
  String get retry => 'पुनः प्रयास करें';

  @override
  String get ok => 'ठीक है';

  @override
  String get yes => 'हाँ';

  @override
  String get no => 'नहीं';

  @override
  String get search => 'खोजें';

  @override
  String get filter => 'फ़िल्टर';

  @override
  String get all => 'सभी';

  @override
  String get noDataFound => 'कोई डेटा नहीं मिला';

  @override
  String get errorGeneric => 'कुछ गलत हो गया। कृपया पुनः प्रयास करें।';

  @override
  String get errorNetwork => 'इंटरनेट कनेक्शन नहीं है। ऑफलाइन काम कर रहे हैं।';

  @override
  String get errorSessionExpired =>
      'सत्र समाप्त हो गया। कृपया फिर से लॉगिन करें।';

  @override
  String get successLabel => 'सफलता';

  @override
  String get welcomeGreeting => 'नमस्ते, मैं संगवारी माँ हूँ';

  @override
  String get welcomeSubtitle =>
      'सुरक्षित गर्भावस्था यात्रा के लिए आपकी विश्वसनीय साथी';

  @override
  String get startRegistration => 'पंजीकरण शुरू करें';

  @override
  String get alreadyHaveAccount => 'पहले से खाता है?';

  @override
  String get loginLabel => 'लॉगिन करें';

  @override
  String get mobileNumber => 'मोबाइल नंबर';

  @override
  String get enterMobileNumber => '10 अंकों का मोबाइल नंबर दर्ज करें';

  @override
  String get sendOtp => 'OTP भेजें';

  @override
  String get enterOtp => 'OTP दर्ज करें';

  @override
  String otpSentTo(String mobile) {
    return '$mobile पर OTP भेजा गया';
  }

  @override
  String get verifyOtp => 'OTP सत्यापित करें';

  @override
  String get resendOtp => 'OTP पुनः भेजें';

  @override
  String resendOtpIn(int seconds) {
    return '$seconds सेकंड में पुनः भेजें';
  }

  @override
  String get invalidOtp => 'गलत OTP। कृपया पुनः प्रयास करें।';

  @override
  String get otpExpired => 'OTP समाप्त हो गया। नया OTP मांगें।';

  @override
  String get loginWithEmail => 'ईमेल से लॉगिन करें';

  @override
  String get email => 'ईमेल';

  @override
  String get password => 'पासवर्ड';

  @override
  String get twoFactorOtp => 'द्वि-चरण OTP';

  @override
  String get registrationTitle => 'नया पंजीकरण';

  @override
  String get fullName => 'पूरा नाम';

  @override
  String get age => 'आयु';

  @override
  String get dateOfBirth => 'जन्म तिथि';

  @override
  String get husbandName => 'पति का नाम';

  @override
  String get husbandMobile => 'पति का मोबाइल';

  @override
  String get lmpDate => 'अंतिम मासिक धर्म (LMP)';

  @override
  String get expectedDeliveryDate => 'संभावित प्रसव तिथि';

  @override
  String get bloodGroup => 'रक्त समूह';

  @override
  String get address => 'पता';

  @override
  String get village => 'ग्राम';

  @override
  String get block => 'ब्लॉक';

  @override
  String get district => 'जिला';

  @override
  String get subcentre => 'उप-केंद्र';

  @override
  String get ashaName => 'आशा का नाम';

  @override
  String get consentTitle => 'सहमति';

  @override
  String get consentBody =>
      'मैं इस कार्यक्रम के अंतर्गत मातृत्व देखभाल सेवाओं के लिए अपनी स्वास्थ्य जानकारी साझा करने की सहमति देती हूँ।';

  @override
  String get consentRequired => 'आगे बढ़ने के लिए सहमति दें।';

  @override
  String get registrationSuccess => 'पंजीकरण सफलतापूर्वक हो गया!';

  @override
  String get homeDashboard => 'होम';

  @override
  String get myProfile => 'मेरी प्रोफ़ाइल';

  @override
  String get bpcrModule => 'BPCR मॉड्यूल';

  @override
  String get maternalSchemes => 'मातृत्व योजनाएं';

  @override
  String get ancServices => 'ANC सेवाएं';

  @override
  String get faqs => 'सामान्य प्रश्न';

  @override
  String get reminders => 'अनुस्मारक';

  @override
  String get emergency => 'आपातकाल';

  @override
  String get notifications => 'सूचनाएं';

  @override
  String get logout => 'लॉगआउट';

  @override
  String get logoutConfirm => 'क्या आप लॉगआउट करना चाहती हैं?';

  @override
  String get bpcrTitle => 'प्रसव तैयारी';

  @override
  String get bpcrSubtitle => 'सुरक्षित प्रसव के लिए सभी 10 घटक पूरे करें';

  @override
  String get bpcrScore => 'BPCR स्कोर';

  @override
  String bpcrScoreValue(int score) {
    return '$score/10';
  }

  @override
  String get bpcrRiskHigh => 'उच्च जोखिम';

  @override
  String get bpcrRiskMedium => 'मध्यम जोखिम';

  @override
  String get bpcrRiskLow => 'कम जोखिम';

  @override
  String get bpcrComponent1 => 'प्रशिक्षित प्रसव सहायक की पहचान';

  @override
  String get bpcrComponent2 => 'प्रसव स्थान की पहचान';

  @override
  String get bpcrComponent3 => 'वाहन की व्यवस्था';

  @override
  String get bpcrComponent4 => 'प्रसव के लिए पैसे की बचत';

  @override
  String get bpcrComponent5 => 'रक्तदाता की पहचान';

  @override
  String get bpcrComponent6 => 'अन्य बच्चों की देखभाल की व्यवस्था';

  @override
  String get bpcrComponent7 => 'खतरे के संकेतों की जानकारी';

  @override
  String get bpcrComponent8 => 'ANC विजिट पूरी';

  @override
  String get bpcrComponent9 => 'आयरन-फोलिक एसिड की गोलियां ली';

  @override
  String get bpcrComponent10 => 'TT टीकाकरण हो गया';

  @override
  String get bpcrCompleted => 'पूर्ण';

  @override
  String get bpcrPending => 'बाकी है';

  @override
  String get bpcrIncomplete => 'अधूरा';

  @override
  String get bpcrUpdateSuccess => 'BPCR चेकलिस्ट अपडेट हो गई।';

  @override
  String get schemesTitle => 'मातृत्व योजनाएं';

  @override
  String get schemeJsy => 'जननी सुरक्षा योजना (JSY)';

  @override
  String get schemeJssk => 'जननी-शिशु सुरक्षा कार्यक्रम (JSSK)';

  @override
  String get schemePmsma => 'प्रधानमंत्री सुरक्षित मातृत्व अभियान (PMSMA)';

  @override
  String get schemePmmvy => 'प्रधानमंत्री मातृ वंदना योजना (PMMVY)';

  @override
  String get schemeMinimata => 'मिनीमाता महतारी जतन योजना';

  @override
  String get eligibility => 'पात्रता';

  @override
  String get howToApply => 'आवेदन कैसे करें';

  @override
  String get benefits => 'लाभ';

  @override
  String get applyNow => 'अभी आवेदन करें';

  @override
  String get learnMore => 'अधिक जानें';

  @override
  String get ancTitle => 'ANC सेवाएं';

  @override
  String get ancVisitManager => 'विजिट मैनेजर';

  @override
  String get ancHighRiskScreening => 'उच्च जोखिम जांच';

  @override
  String get ancSymptomChecker => 'लक्षण परीक्षक';

  @override
  String get ancWeekByWeek => 'सप्ताह दर सप्ताह गाइड';

  @override
  String get ancNutrition => 'पोषण और आहार';

  @override
  String get ancVisitDue => 'ANC विजिट देय है';

  @override
  String ancVisitOverdue(int days) {
    return 'ANC विजिट $days दिन से बाकी है';
  }

  @override
  String ancVisitScheduled(String date) {
    return 'अगली विजिट: $date';
  }

  @override
  String get ancVisit1 => 'पहली ANC विजिट';

  @override
  String get ancVisit2 => 'दूसरी ANC विजिट';

  @override
  String get ancVisit3 => 'तीसरी ANC विजिट';

  @override
  String get ancVisit4 => 'चौथी ANC विजिट';

  @override
  String ancVisitCompleted(String date) {
    return 'विजिट $date को पूरी हुई';
  }

  @override
  String get trimester1 => 'पहली तिमाही';

  @override
  String get trimester2 => 'दूसरी तिमाही';

  @override
  String get trimester3 => 'तीसरी तिमाही';

  @override
  String weekLabel(int week) {
    return 'सप्ताह $week';
  }

  @override
  String get chatbotTitle => 'संगवारी माँ से पूछें';

  @override
  String get chatbotPlaceholder => 'अपना सवाल लिखें…';

  @override
  String get chatbotSend => 'भेजें';

  @override
  String get chatbotTyping => 'संगवारी माँ जवाब दे रही है…';

  @override
  String get faqTitle => 'अक्सर पूछे जाने वाले प्रश्न';

  @override
  String get faqEmpty => 'अभी कोई FAQ उपलब्ध नहीं है।';

  @override
  String get remindersTitle => 'मेरे अनुस्मारक';

  @override
  String get reminderAncVisit => 'ANC विजिट अनुस्मारक';

  @override
  String get reminderMedicine => 'दवाई अनुस्मारक';

  @override
  String get reminderFollowUp => 'फॉलो-अप अनुस्मारक';

  @override
  String reminderSetFor(String time) {
    return '$time के लिए सेट';
  }

  @override
  String get reminderAddNew => 'अनुस्मारक जोड़ें';

  @override
  String get reminderDeleteConfirm => 'यह अनुस्मारक हटाएं?';

  @override
  String get emergencyTitle => 'आपातकालीन सहायता';

  @override
  String get emergencyDangerSigns => 'खतरे के संकेत';

  @override
  String get emergencyCallAmbulance => 'एम्बुलेंस बुलाएं (102/108)';

  @override
  String get emergencyCallAsha => 'आशा को सूचित करें';

  @override
  String get emergencySafetyConfirm => 'क्या आप अभी सुरक्षित हैं?';

  @override
  String get emergencySafetyYes => 'हाँ, मैं सुरक्षित हूँ';

  @override
  String get emergencySafetyNo => 'नहीं, मुझे अभी भी मदद चाहिए';

  @override
  String get dangerSign1 => 'अधिक रक्तस्राव';

  @override
  String get dangerSign2 => 'तेज सिरदर्द या धुंधली दृष्टि';

  @override
  String get dangerSign3 => 'तेज बुखार';

  @override
  String get dangerSign4 => 'दौरे या झटके';

  @override
  String get dangerSign5 => 'शिशु की हलचल कम या बंद';

  @override
  String get dangerSign6 => 'तेज पेट दर्द';

  @override
  String get dangerSign7 => 'हाथ, चेहरे या पैरों में सूजन';

  @override
  String get dangerSign8 => 'सांस लेने में तकलीफ';

  @override
  String get ashaHomeTitle => 'आशा / ANM डैशबोर्ड';

  @override
  String get activeAlerts => 'सक्रिय अलर्ट';

  @override
  String get hrpCount => 'उच्च जोखिम गर्भावस्थाएं';

  @override
  String get dueAncVisits => 'आज की ANC विजिट';

  @override
  String get totalRegistered => 'कुल पंजीकृत';

  @override
  String get viewAll => 'सभी देखें';

  @override
  String get alertsTitle => 'अलर्ट';

  @override
  String get alertRiskRed => 'लाल अलर्ट';

  @override
  String get alertRiskYellow => 'पीला अलर्ट';

  @override
  String alertTimeAgo(String time) {
    return '$time पहले';
  }

  @override
  String get alertSymptoms => 'लक्षण';

  @override
  String get alertStatus => 'स्थिति';

  @override
  String get alertStatusNotContacted => 'संपर्क नहीं हुआ';

  @override
  String get alertStatusContacted => 'संपर्क हुआ';

  @override
  String get alertStatusReferred => 'सुविधा केंद्र को रेफर किया';

  @override
  String get alertStatusResolved => 'समाधान हो गया';

  @override
  String get alertUpdateStatus => 'स्थिति अपडेट करें';

  @override
  String get alertCallBeneficiary => 'लाभार्थी को कॉल करें';

  @override
  String get alertCallAmbulance => 'एम्बुलेंस बुलाएं (102/108)';

  @override
  String get alertNavigate => 'स्थान पर नेविगेट करें';

  @override
  String get alertOpenVisitForm => 'विजिट फॉर्म खोलें';

  @override
  String get alertDetailTitle => 'अलर्ट विवरण';

  @override
  String get alertBeneficiaryInfo => 'लाभार्थी की जानकारी';

  @override
  String get beneficiaryListTitle => 'लाभार्थी';

  @override
  String get beneficiarySearch => 'नाम या ID से खोजें';

  @override
  String get filterHighRisk => 'उच्च जोखिम';

  @override
  String get filterBpcrIncomplete => 'BPCR अधूरा';

  @override
  String get beneficiaryDetailTitle => 'लाभार्थी विवरण';

  @override
  String get ancHistory => 'ANC इतिहास';

  @override
  String get visitLog => 'विजिट लॉग';

  @override
  String get activityTracker => 'गतिविधि ट्रैकर';

  @override
  String get facilityTitle => 'नजदीकी सुविधा केंद्र';

  @override
  String facilityDistance(String distance) {
    return '$distance किमी दूर';
  }

  @override
  String get facilityGetDirections => 'रास्ता देखें';

  @override
  String get currentLocation => 'वर्तमान स्थान';

  @override
  String get responseTimeTitle => 'प्रतिक्रिया समय';

  @override
  String get responseAvgMinutes => 'औसत प्रतिक्रिया समय';

  @override
  String get responseWithin1hr => '1 घंटे के भीतर';

  @override
  String get responseDelayed => 'देरी वाले मामले (>72 घंटे)';

  @override
  String get actionInProgress => 'प्रगति में';

  @override
  String get actionClosed => 'बंद';

  @override
  String get adminDashboardTitle => 'एडमिन डैशबोर्ड';

  @override
  String get panelOverview => 'अवलोकन';

  @override
  String get panelBpcrAnalytics => 'BPCR विश्लेषण';

  @override
  String get panelAlertMonitoring => 'अलर्ट निगरानी';

  @override
  String get panelResponseTime => 'प्रतिक्रिया समय';

  @override
  String get panelUserEngagement => 'उपयोगकर्ता सहभागिता';

  @override
  String get panelGisMap => 'GIS मानचित्र';

  @override
  String get panelDataExport => 'डेटा निर्यात';

  @override
  String get panelSettings => 'सेटिंग्स';

  @override
  String get statTotalRegistered => 'कुल पंजीकृत';

  @override
  String get statActiveUsers => 'सक्रिय उपयोगकर्ता';

  @override
  String get statDropOffPercent => 'ड्रॉप-ऑफ दर';

  @override
  String get statAvgBpcr => 'औसत BPCR स्कोर';

  @override
  String get statActiveAlerts => 'सक्रिय अलर्ट';

  @override
  String get statDau => 'दैनिक सक्रिय उपयोगकर्ता';

  @override
  String get statRemindersPerUser => 'प्रति उपयोगकर्ता अनुस्मारक';

  @override
  String get statMostUsedModule => 'सबसे उपयोग किया गया मॉड्यूल';

  @override
  String get analyticsScoreDistribution => 'स्कोर वितरण';

  @override
  String get analyticsTrendLine => 'रुझान';

  @override
  String get analyticsBlockWise => 'ब्लॉक-वार तुलना';

  @override
  String get mapHighRiskPins => 'उच्च जोखिम गर्भावस्थाएं';

  @override
  String get mapAlertLocations => 'अलर्ट स्थान';

  @override
  String get mapFacilityOverlay => 'सुविधा केंद्र';

  @override
  String get exportTitle => 'डेटा निर्यात';

  @override
  String get exportFilterBlock => 'ब्लॉक';

  @override
  String get exportFilterTrimester => 'तिमाही';

  @override
  String get exportFilterRisk => 'जोखिम स्तर';

  @override
  String get exportFilterDateRange => 'तिथि सीमा';

  @override
  String get exportDownloadExcel => 'Excel डाउनलोड करें';

  @override
  String get exportDownloadCsv => 'CSV डाउनलोड करें';

  @override
  String get exportGenerating => 'निर्यात तैयार हो रहा है…';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsNotifications => 'सूचनाएं';

  @override
  String get settingsAlertThreshold => 'अलर्ट सीमा';

  @override
  String get settingsAddAdmin => 'ब्लॉक एडमिन / BMO जोड़ें';

  @override
  String get settingsRoleLabel => 'भूमिका';

  @override
  String get roleWoman => 'गर्भवती महिला';

  @override
  String get roleAsha => 'आशा';

  @override
  String get roleAnm => 'ANM';

  @override
  String get roleBlockAdmin => 'ब्लॉक एडमिन';

  @override
  String get roleBmo => 'BMO';

  @override
  String get rolePi => 'कार्यक्रम अन्वेषक';

  @override
  String get roleSuperAdmin => 'सुपर एडमिन';

  @override
  String get uniqueId => 'विशिष्ट पहचान';

  @override
  String get area => 'क्षेत्र';

  @override
  String get profileConfirmation => 'कृपया अपनी प्रोफ़ाइल विवरण की पुष्टि करें';

  @override
  String get profileName => 'नाम';

  @override
  String get profileRole => 'भूमिका';

  @override
  String get profileArea => 'क्षेत्र';

  @override
  String get profileSubcentre => 'उप-केंद्र';

  @override
  String get profileUniqueId => 'विशिष्ट पहचान';

  @override
  String get confirmDetails => 'विवरण की पुष:पुष्टि करें';

  @override
  String get offlineBannerMessage =>
      'आप ऑफलाइन हैं। कनेक्ट होने पर डेटा सिंक होगा।';

  @override
  String get syncingData => 'डेटा सिंक हो रहा है…';

  @override
  String lastSynced(String time) {
    return 'अंतिम सिंक: $time';
  }

  @override
  String versionLabel(String version) {
    return 'संस्करण $version';
  }
}
