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
  String get newUserCompleteRegistration =>
      'You\'re new here! Please complete your registration to continue.';

  @override
  String get welcomeBackLoggedIn => 'Welcome back! You\'re already registered.';

  @override
  String get accountExistsPleaseLogin =>
      'An account already exists for this number. Please login.';

  @override
  String get dobFutureError => 'Date of birth cannot be in the future';

  @override
  String get ageRangeError => 'Age must be between 14 and 55';

  @override
  String get ageDobMismatch => 'Age does not match the date of birth entered';

  @override
  String get lmpFutureError => 'LMP date cannot be in the future';

  @override
  String get lmpTooOldError => 'LMP date seems too far in the past';

  @override
  String get required => 'Required';

  @override
  String get invalidValue => 'Invalid value';

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
  String get myProfile => 'Profile';

  @override
  String get bpcrModule => 'BPCR';

  @override
  String get bpcrdesc =>
      'Track your birth preparedness and complications readiness milestones.';

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
  String get videomodule => 'Video Modules';

  @override
  String get videomoduledesc => 'Educational content for safe motherhood';

  @override
  String get videoFilterAll => 'All';

  @override
  String get videoFilterBpcr => 'BPCR';

  @override
  String get videoFilterPnc => 'Postnatal & Newborn Care';

  @override
  String get videoLoadError => 'Could not load videos';

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
  String get bpcr_danger_pregnancy_title => 'Danger signs during pregnancy';

  @override
  String get bpcr_danger_pregnancy_desc =>
      'Severe headaches, blurred vision, swelling.';

  @override
  String get bpcr_danger_labor_title =>
      'Danger signs during labor & childbirth';

  @override
  String get bpcr_danger_labor_desc =>
      'Danger signs during labor and childbirth.';

  @override
  String get bpcr_postnatal_title => 'Danger signs during postnatal period';

  @override
  String get bpcr_postnatal_desc =>
      'Foul smelling discharge, severe pain, depression.';

  @override
  String get bpcr_newborn_title => 'Danger signs in the newborn period';

  @override
  String get bpcr_newborn_desc => 'Difficulty breathing, fits, cold to touch.';

  @override
  String get bpcr_health_facility_title => 'Health facility identification';

  @override
  String get bpcr_skill_birth_attendant_title =>
      'Identified skilled birth attendant';

  @override
  String get bpcr_transport_title =>
      'Planned to earmark transport modality to health facility';

  @override
  String get bpcr_transport_desc => '108/102 Emergency call';

  @override
  String get bpcr_save_money_title => 'Planned to save money for delivery';

  @override
  String get bpcr_financial_support_title =>
      'Identified presence of community financial support system';

  @override
  String get bpcr_financial_support_desc => 'Local helpers verified';

  @override
  String get bpcr_blood_donor_title =>
      'Identify the presence of community blood donor';

  @override
  String get bpcrCompleted => 'Completed';

  @override
  String get bpcrPending => 'Pending';

  @override
  String get bpcrIncomplete => 'Incomplete';

  @override
  String get bpcrUpdateSuccess => 'BPCR checklist updated.';

  @override
  String get maternalSchemesdesc =>
      'Explore Government schemes & check eligibility';

  @override
  String get schemesTitle => 'Maternal Benefit Program';

  @override
  String get schemes_explore => 'Explore Schemes';

  @override
  String get schemes_details => 'Scheme Details';

  @override
  String get jsy_name => 'Janani Suraksha Yojana (JSY)';

  @override
  String get jsy_eligibility_1 =>
      'All pregnant women delivering in Government health centres like Sub-centre, PHC/CHC/FRU/ general wards of District and state Hospitals or accredited private institutions';

  @override
  String get jsy_eligibility_2 =>
      'All SC and ST women delivering in a government health centre like Sub-centre, PHC/CHC/ FRU / general ward of District and state Hospitals or accredited private institutions';

  @override
  String get jsy_cash_title => 'Cash Assistance';

  @override
  String get jsy_cash_desc =>
      'given to all births, delivered in a health centre – Government or Accredited Private health institutions';

  @override
  String get jsy_table_category => 'Category';

  @override
  String get jsy_table_rural => 'Rural';

  @override
  String get jsy_table_urban => 'Urban';

  @override
  String get jsy_table_total => 'Total';

  @override
  String get jsy_table_mother_package => 'Mother\'s Package';

  @override
  String get jsy_table_mitanin_package => 'Mitanin\'s Package';

  @override
  String get schemeJssk => 'Janani-Shishu Suraksha Karyakram (JSSK)';

  @override
  String get jssk_eligibility_desc =>
      'All pregnant mothers and sick newborns accessing public health institutions for healthcare.';

  @override
  String get jssk_women_title => 'Entitlements for Pregnant Women';

  @override
  String get jssk_women_1 =>
      'Free and zero expense delivery and Caesarean section';

  @override
  String get jssk_women_2 => 'Free drugs and consumables';

  @override
  String get jssk_women_3 =>
      'Free essential diagnostics including blood, urine tests and ultrasonography';

  @override
  String get jssk_women_4 => 'Free diet during stay in health institutions';

  @override
  String get jssk_women_5 => 'Free provision of blood';

  @override
  String get jssk_women_6 =>
      'Free transport from home to health institution and referral transport';

  @override
  String get jssk_women_7 => 'Exemption from all user charges';

  @override
  String get jssk_newborn_title =>
      'Entitlements for Sick Newborns till One Year after Birth';

  @override
  String get jssk_newborn_1 => 'Free and zero expense treatment';

  @override
  String get jssk_newborn_2 => 'Free drugs and consumables';

  @override
  String get jssk_newborn_3 => 'Free diagnostics';

  @override
  String get jssk_newborn_4 => 'Free provision of blood';

  @override
  String get jssk_newborn_5 => 'Free transport and referral transport';

  @override
  String get jssk_newborn_6 => 'Exemption from all user charges';

  @override
  String get schemePmsma => 'Pradhan Mantri Surakshit Matritva Abhiyan (PMSMA)';

  @override
  String get pmsma_desc_1 =>
      'A special ANC check-up day is held on the 9th of every month across the country at identified public health facilities.';

  @override
  String get pmsma_desc_2 =>
      'Services are provided at Pradhan Mantri Surakshit Matritva Clinics in addition to routine ANC.';

  @override
  String get pmsma_desc_3 =>
      'Every pregnant woman gets at least one free check-up by a doctor in the 2nd or 3rd trimester.';

  @override
  String get pmsma_desc_4 =>
      'All pregnant women in the 2nd or 3rd trimester are eligible.';

  @override
  String get pmsma_services_title => 'Package of Services';

  @override
  String get pmsma_service_1 => 'Routine antenatal care check-up';

  @override
  String get pmsma_service_2 => 'Diagnostic services';

  @override
  String get pmsma_service_3 =>
      'Identification and management of high-risk pregnant women';

  @override
  String get pmsma_service_4 =>
      'Counselling on nutrition, family planning, birth preparedness, newborn and postnatal care';

  @override
  String get schemePmmvy => 'Pradhan Mantri Matru Vandana Yojana (PMMVY)';

  @override
  String get pmmvy_des =>
      'Cash incentive to provide financial support for pregnant and lactating mothers';

  @override
  String get pmmvy_eligibility_1 =>
      'Women belonging to Scheduled Castes and Scheduled Tribes';

  @override
  String get pmmvy_eligibility_2 =>
      'Women who are partially (40%) or fully disabled (Divyang Jan)';

  @override
  String get pmmvy_eligibility_3 => 'Women holding BPL Ration Card';

  @override
  String get pmmvy_eligibility_4 =>
      'Women beneficiaries under Pradhan Mantri Jan Arogya Yojana (PMJAY) under Ayushman Bharat';

  @override
  String get pmmvy_eligibility_5 => 'Women holding E-Shram Card';

  @override
  String get pmmvy_eligibility_6 =>
      'Women farmers who are beneficiaries under Kisan Samman Nidhi';

  @override
  String get pmmvy_eligibility_7 => 'Women holding MGNREGA Job Card';

  @override
  String get pmmvy_eligibility_8 =>
      'Women whose net family income is less than Rs. 8 lakh per annum';

  @override
  String get pmmvy_eligibility_9 => 'Pregnant and Lactating AWWs/AWHs/ASHAs';

  @override
  String get pmmvy_eligibility_10 =>
      'Any other category as may be prescribed by the Central Government';

  @override
  String get pmmvy_exclusion_note =>
      'Further, all pregnant women and lactating mothers in regular employment with the Central Government, State Government, Public Sector Undertakings, or those receiving similar benefits under any law currently in force shall not be entitled to benefits under PMMVY.';

  @override
  String get pmmvy_installment_title => 'Conditionalities and Installments';

  @override
  String get pmmvy_table_installment => 'Installment';

  @override
  String get pmmvy_table_conditions => 'Conditions';

  @override
  String get pmmvy_table_amount => 'Amount';

  @override
  String get pmmvy_first_installment_title => 'First Installment';

  @override
  String get pmmvy_first_installment_condition =>
      'On registration of pregnancy and at least one Ante-natal check-up within 6 months from LMP date at the Anganwadi Centre (AWC) or approved health facility as identified by the respective State/UT.';

  @override
  String get pmmvy_first_installment_amount => '₹ 3000/-';

  @override
  String get pmmvy_second_installment_title => 'Second Installment';

  @override
  String get pmmvy_second_installment_condition_1 =>
      'Child birth is registered.';

  @override
  String get pmmvy_second_installment_condition_2 =>
      'Child has received first cycle of BCG, OPV, DPT and Hepatitis-B or its equivalent/substitute.';

  @override
  String get pmmvy_second_installment_amount => '₹ 2000/-';

  @override
  String get pmmvy_benefit_desc =>
      'Benefit is available to a woman for the first two living children provided the second child is a girl.In case of the first child the amount of ₹5000 in 2 installments and for the second child, the benefit of ₹6000 will be provided subject to second child is a girl child in one installment after the birth.';

  @override
  String get anganwadi_name =>
      'Services at Anganwadi Centre to Pregnant Mothers and Children';

  @override
  String get anganwadi_table_service => 'Services';

  @override
  String get anganwadi_table_target_group => 'Target Group';

  @override
  String get anganwadi_table_provider => 'Services Provided By';

  @override
  String get anganwadi_service_1 => 'Supplementary Nutrition';

  @override
  String get anganwadi_service_1_target =>
      'Children below 3 years and Pregnant & Lactating Mothers - Take Home Ration (THR); Children 3-6 years - Hot Cooked Meal and THR';

  @override
  String get anganwadi_service_1_provider =>
      'Anganwadi Worker (AWW) & Anganwadi Helper (AWH)';

  @override
  String get anganwadi_service_2 => 'Immunization';

  @override
  String get anganwadi_service_2_target =>
      'Children below 6 years; Pregnant & Lactating Mothers';

  @override
  String get anganwadi_service_2_provider => 'ANM / Medical Officer (MO)';

  @override
  String get anganwadi_service_3 => 'Health Check-up';

  @override
  String get anganwadi_service_3_target =>
      'Children below 6 years; Pregnant Women & Lactating Mothers';

  @override
  String get anganwadi_service_3_provider =>
      'ANM / Medical Officer (MO) / Anganwadi Worker (AWW)';

  @override
  String get anganwadi_service_4 => 'Referral Services';

  @override
  String get anganwadi_service_4_target =>
      'Children below 6 years; Pregnant Women & Lactating Mothers';

  @override
  String get anganwadi_service_4_provider =>
      'Anganwadi Worker (AWW) / ANM / Medical Officer (MO)';

  @override
  String get schemeMinimata =>
      'Minimata Mahtari Jatan Yojana (formerly Bhagini Prasuti Sahayata Yojana)';

  @override
  String get minimata_desc =>
      'Under the scheme, a maternity benefit of ₹10,000 is provided, of which ₹5,000 is paid in the first trimester of pregnancy and the remaining ₹5,000 is paid in the third trimester (eighth month). The assistance amount is disbursed within 72 hours of receiving the notification.';

  @override
  String get minimata_eligibility_title =>
      'Eligibility for Participation in the Scheme';

  @override
  String get minimata_eligibility_1 =>
      'Registration of the beneficiary\'s spouse is required.';

  @override
  String get minimata_eligibility_2 =>
      'A doctor, ANM, or Mitanin are required to verify the woman\'s pregnancy.';

  @override
  String get minimata_eligibility_3 =>
      'Wives of construction workers working in public or government institutions will not be eligible for the scheme.';

  @override
  String get minimata_eligibility_4 =>
      'The benefits of the maternity scheme will be payable only for a maximum of two deliveries.';

  @override
  String get minimata_eligibility_5 =>
      'Eligibility for the benefits will be after 90 days of registration.';

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
  String get ancdesc => 'Services for the current pregnancy';

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
  String get chatbot => 'Chatbot';

  @override
  String get chatbotTitle => 'Ask Sangwari Maa';

  @override
  String get chatbotPlaceholder => 'Type your question…';

  @override
  String get chatbotSend => 'Send';

  @override
  String get chatbotTyping => 'Sangwari Maa is typing…';

  @override
  String get chatbotListening => 'Listening...';

  @override
  String get chatbotBrowseTopics => 'Browse Topics';

  @override
  String get faqTitle => 'Frequently Asked Questions';

  @override
  String get faqEmpty => 'No FAQs available at the moment.';

  @override
  String get chatbotWelcome =>
      'Hi! I can help with maternal health questions. Pick a topic below, or type your own question anytime.';

  @override
  String get chatbotCategoryBpcr => 'Birth Preparedness (BPCR)';

  @override
  String get chatbotCategorySchemes => 'Maternal Health Schemes';

  @override
  String get chatbotCategoryPnc => 'Postnatal & Newborn Care';

  @override
  String get chatbotSubAdvanced => 'Advanced Preparedness';

  @override
  String get chatbotSubBirthCompanion => 'Birth Companion';

  @override
  String get chatbotSubEmergencyTransport => 'Emergency Transport';

  @override
  String get chatbotSubFinancial => 'Financial Preparedness';

  @override
  String get chatbotSubBloodDonor => 'Blood Donor Preparedness';

  @override
  String get chatbotSubHighRiskPregnancy => 'High-Risk Pregnancy';

  @override
  String get chatbotSubLaborReadiness => 'Labor Readiness';

  @override
  String get chatbotSubFamilyPreparedness => 'Family Preparedness';

  @override
  String get chatbotSubDeliveryKit => 'Delivery Kit';

  @override
  String get chatbotSubEmergencyDecisionMaking => 'Emergency Decisions';

  @override
  String get chatbotSubAdditional => 'Additional Topics';

  @override
  String get chatbotSubMaternalRecovery => 'Maternal Recovery';

  @override
  String get chatbotSubNutrition => 'Nutrition';

  @override
  String get chatbotSubMentalHealth => 'Mental Health';

  @override
  String get chatbotSubFamilyPlanning => 'Family Planning';

  @override
  String get chatbotSubNewbornCare => 'Newborn Care';

  @override
  String get chatbotSubNewbornDangerSigns => 'Newborn Danger Signs';

  @override
  String get chatbotSubImmunization => 'Immunization & Growth';

  @override
  String get chatbotSubLowBirthWeight => 'Low Birth Weight Care';

  @override
  String get chatbotSubPregnancyRegistration => 'Pregnancy Registration';

  @override
  String get chatbotSubPregnancyDuration => 'Pregnancy Duration';

  @override
  String get chatbotSubAncVisits => 'ANC Visits';

  @override
  String get chatbotSubMaternalNutrition => 'Maternal Nutrition';

  @override
  String get chatbotSubIfaCalcium => 'IFA & Calcium';

  @override
  String get chatbotSubCommonSymptoms => 'Common Symptoms';

  @override
  String get chatbotSubDangerSigns => 'Danger Signs';

  @override
  String chatbotQuestionsIntro(Object category) {
    return 'Here are some common questions about $category:';
  }

  @override
  String get chatbotNoFaqs =>
      'I don\'t have FAQs for this topic yet — try typing your question below.';

  @override
  String get chatbotCategoryLoadError =>
      'Sorry, I could not load that topic. Please try again.';

  @override
  String get chatbotSendError =>
      'Sorry, something went wrong. Please try again.';

  @override
  String get chatbotBackToTopics => '⬅ Back to topics';

  @override
  String get chatbotAnythingElse => 'Anything else on this topic?';

  @override
  String get chatbotNoAnswerYet =>
      'Sorry, I don\'t have an answer for that yet.';

  @override
  String get chatbotGeneralTopic => 'General';

  @override
  String get chatbotYes => 'Yes';

  @override
  String get chatbotNo => 'No';

  @override
  String get chatbotPickAnother => 'Sure, pick another question:';

  @override
  String get chatbotLanguageChanged =>
      'You tapped the language switch button, so the language has changed — messages from here on will appear in this language.';

  @override
  String get remindersTitle => 'My Reminders';

  @override
  String get noReminders => 'No reminders yet';

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
  String get help => 'How Can I Help You !';

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
