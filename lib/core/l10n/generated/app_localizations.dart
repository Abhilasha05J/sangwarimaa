import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
  ];

  /// Application name
  ///
  /// In en, this message translates to:
  /// **'Sangwari Maa'**
  String get appName;

  /// App tagline shown on splash/welcome
  ///
  /// In en, this message translates to:
  /// **'Your Maternal Health Companion'**
  String get appTagline;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageHindi.
  ///
  /// In en, this message translates to:
  /// **'हिंदी'**
  String get languageHindi;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @continueLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLabel;

  /// Splash screen CTA button
  ///
  /// In en, this message translates to:
  /// **'Let\'s Start'**
  String get splashStart;

  /// Splash screen English tagline
  ///
  /// In en, this message translates to:
  /// **'Sangwari MAA is a reliable pregnancy companion, providing timely guidance, reminders, and alerts to support informed decisions and ensure a safe, confident maternal journey.'**
  String get splashTaglineEn;

  /// Splash screen Hindi tagline
  ///
  /// In en, this message translates to:
  /// **'संगवारी MAA एक भरोसेमंद गर्भावस्था साथी है, जो समय पर मार्गदर्शन, रिमाइंडर और चेतावनी देकर सुरक्षित और जागरूक मातृत्व यात्रा सुनिश्चित करती है'**
  String get splashTaglineHi;

  /// Language select screen title
  ///
  /// In en, this message translates to:
  /// **'Welcome to Sangwari MAA'**
  String get languageTitle;

  /// Language select subtitle
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred language.'**
  String get chooseLanguage;

  /// No description provided for @registerHere.
  ///
  /// In en, this message translates to:
  /// **'Register here'**
  String get registerHere;

  /// No description provided for @identityVerification.
  ///
  /// In en, this message translates to:
  /// **'Identity Verification'**
  String get identityVerification;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get noAccount;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Register to create account'**
  String get registerTitle;

  /// No description provided for @mobileOtp.
  ///
  /// In en, this message translates to:
  /// **'Mobile OTP'**
  String get mobileOtp;

  /// No description provided for @mothersProfile.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s Profile'**
  String get mothersProfile;

  /// No description provided for @fullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Full Name'**
  String get fullNameHint;

  /// No description provided for @ageHint.
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get ageHint;

  /// No description provided for @husbandsAge.
  ///
  /// In en, this message translates to:
  /// **'Husband\'s Age'**
  String get husbandsAge;

  /// No description provided for @dateHint.
  ///
  /// In en, this message translates to:
  /// **'dd-mm-yyyy'**
  String get dateHint;

  /// No description provided for @currentAddress.
  ///
  /// In en, this message translates to:
  /// **'Current Address'**
  String get currentAddress;

  /// No description provided for @addressHint.
  ///
  /// In en, this message translates to:
  /// **'Enter Residential Address'**
  String get addressHint;

  /// No description provided for @bloodGroupHint.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get bloodGroupHint;

  /// No description provided for @gestationalAge.
  ///
  /// In en, this message translates to:
  /// **'Gestational Age'**
  String get gestationalAge;

  /// No description provided for @gestationalAgeHint.
  ///
  /// In en, this message translates to:
  /// **'Weeks'**
  String get gestationalAgeHint;

  /// No description provided for @lmpDetails.
  ///
  /// In en, this message translates to:
  /// **'LMP Details'**
  String get lmpDetails;

  /// No description provided for @eddHint.
  ///
  /// In en, this message translates to:
  /// **'Calculated Delivery Date'**
  String get eddHint;

  /// No description provided for @healthCenter.
  ///
  /// In en, this message translates to:
  /// **'Health Center Selection'**
  String get healthCenter;

  /// No description provided for @selectVillage.
  ///
  /// In en, this message translates to:
  /// **'Select Village'**
  String get selectVillage;

  /// No description provided for @selectVillageHint.
  ///
  /// In en, this message translates to:
  /// **'Select Village'**
  String get selectVillageHint;

  /// No description provided for @phc.
  ///
  /// In en, this message translates to:
  /// **'Primary Health Center (PHC)'**
  String get phc;

  /// No description provided for @phcHint.
  ///
  /// In en, this message translates to:
  /// **'Select Nearest PHC'**
  String get phcHint;

  /// No description provided for @completeReg.
  ///
  /// In en, this message translates to:
  /// **'Complete Registration'**
  String get completeReg;

  /// No description provided for @invalidMobile.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid 10-digit mobile number'**
  String get invalidMobile;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get loading;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @noDataFound.
  ///
  /// In en, this message translates to:
  /// **'No data found'**
  String get noDataFound;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Working offline.'**
  String get errorNetwork;

  /// No description provided for @errorSessionExpired.
  ///
  /// In en, this message translates to:
  /// **'Session expired. Please log in again.'**
  String get errorSessionExpired;

  /// No description provided for @successLabel.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get successLabel;

  /// Welcome screen hero greeting
  ///
  /// In en, this message translates to:
  /// **'Namaste, I am Sangwari Maa'**
  String get welcomeGreeting;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your trusted companion for a safe pregnancy journey'**
  String get welcomeSubtitle;

  /// No description provided for @startRegistration.
  ///
  /// In en, this message translates to:
  /// **'Start Registration'**
  String get startRegistration;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @loginLabel.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginLabel;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// No description provided for @enterMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter 10-digit mobile number'**
  String get enterMobileNumber;

  /// No description provided for @sendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// No description provided for @enterOtp.
  ///
  /// In en, this message translates to:
  /// **'Enter 6-digit OTP'**
  String get enterOtp;

  /// No description provided for @otpSentTo.
  ///
  /// In en, this message translates to:
  /// **'An OTP has been sent on {mobile}'**
  String otpSentTo(String mobile);

  /// No description provided for @verifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtp;

  /// No description provided for @resendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resendOtp;

  /// No description provided for @resendOtpIn.
  ///
  /// In en, this message translates to:
  /// **'Resend in {seconds}s'**
  String resendOtpIn(int seconds);

  /// No description provided for @invalidOtp.
  ///
  /// In en, this message translates to:
  /// **'Invalid OTP. Please try again.'**
  String get invalidOtp;

  /// No description provided for @otpExpired.
  ///
  /// In en, this message translates to:
  /// **'OTP expired. Please request a new one.'**
  String get otpExpired;

  /// No description provided for @loginWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Login with Email'**
  String get loginWithEmail;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Admin 2FA label
  ///
  /// In en, this message translates to:
  /// **'Two-Factor OTP'**
  String get twoFactorOtp;

  /// No description provided for @registrationTitle.
  ///
  /// In en, this message translates to:
  /// **'New Registration'**
  String get registrationTitle;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @husbandName.
  ///
  /// In en, this message translates to:
  /// **'Husband\'s Name'**
  String get husbandName;

  /// No description provided for @husbandMobile.
  ///
  /// In en, this message translates to:
  /// **'Husband\'s Mobile'**
  String get husbandMobile;

  /// No description provided for @lmpDate.
  ///
  /// In en, this message translates to:
  /// **'Last Menstrual Period (LMP)'**
  String get lmpDate;

  /// No description provided for @expectedDeliveryDate.
  ///
  /// In en, this message translates to:
  /// **'Expected Delivery Date'**
  String get expectedDeliveryDate;

  /// No description provided for @bloodGroup.
  ///
  /// In en, this message translates to:
  /// **'Blood Group'**
  String get bloodGroup;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @village.
  ///
  /// In en, this message translates to:
  /// **'Village'**
  String get village;

  /// No description provided for @block.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get block;

  /// No description provided for @district.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get district;

  /// No description provided for @subcentre.
  ///
  /// In en, this message translates to:
  /// **'Sub-centre'**
  String get subcentre;

  /// No description provided for @ashaName.
  ///
  /// In en, this message translates to:
  /// **'ASHA Name'**
  String get ashaName;

  /// No description provided for @consentTitle.
  ///
  /// In en, this message translates to:
  /// **'Digital Health Consent'**
  String get consentTitle;

  /// No description provided for @consentBody.
  ///
  /// In en, this message translates to:
  /// **'I hereby give my consent to store and process my medical records for prenatal care. I understand that my data will be used to provide me the personalized health alerts and AI assistance.'**
  String get consentBody;

  /// No description provided for @consentRequired.
  ///
  /// In en, this message translates to:
  /// **'Please accept consent to proceed.'**
  String get consentRequired;

  /// No description provided for @registrationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Registration successful!'**
  String get registrationSuccess;

  /// No description provided for @homeDashboard.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeDashboard;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// Birth Preparedness & Complication Readiness module
  ///
  /// In en, this message translates to:
  /// **'BPCR Module'**
  String get bpcrModule;

  /// No description provided for @maternalSchemes.
  ///
  /// In en, this message translates to:
  /// **'Maternal Schemes'**
  String get maternalSchemes;

  /// Antenatal Care Services
  ///
  /// In en, this message translates to:
  /// **'ANC Services'**
  String get ancServices;

  /// No description provided for @faqs.
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get faqs;

  /// No description provided for @reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders;

  /// No description provided for @emergency.
  ///
  /// In en, this message translates to:
  /// **'Emergency'**
  String get emergency;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logoutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirm;

  /// No description provided for @bpcrTitle.
  ///
  /// In en, this message translates to:
  /// **'Birth Preparedness'**
  String get bpcrTitle;

  /// No description provided for @bpcrSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Complete all 10 components for a safe delivery'**
  String get bpcrSubtitle;

  /// No description provided for @bpcrScore.
  ///
  /// In en, this message translates to:
  /// **'BPCR Score'**
  String get bpcrScore;

  /// No description provided for @bpcrScoreValue.
  ///
  /// In en, this message translates to:
  /// **'{score}/10'**
  String bpcrScoreValue(int score);

  /// No description provided for @bpcrRiskHigh.
  ///
  /// In en, this message translates to:
  /// **'High Risk'**
  String get bpcrRiskHigh;

  /// No description provided for @bpcrRiskMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium Risk'**
  String get bpcrRiskMedium;

  /// No description provided for @bpcrRiskLow.
  ///
  /// In en, this message translates to:
  /// **'Low Risk'**
  String get bpcrRiskLow;

  /// No description provided for @bpcrComponent1.
  ///
  /// In en, this message translates to:
  /// **'Identified skilled birth attendant'**
  String get bpcrComponent1;

  /// No description provided for @bpcrComponent2.
  ///
  /// In en, this message translates to:
  /// **'Identified delivery place'**
  String get bpcrComponent2;

  /// No description provided for @bpcrComponent3.
  ///
  /// In en, this message translates to:
  /// **'Identified transport'**
  String get bpcrComponent3;

  /// No description provided for @bpcrComponent4.
  ///
  /// In en, this message translates to:
  /// **'Saved money for delivery'**
  String get bpcrComponent4;

  /// No description provided for @bpcrComponent5.
  ///
  /// In en, this message translates to:
  /// **'Identified blood donor'**
  String get bpcrComponent5;

  /// No description provided for @bpcrComponent6.
  ///
  /// In en, this message translates to:
  /// **'Made arrangements for other children'**
  String get bpcrComponent6;

  /// No description provided for @bpcrComponent7.
  ///
  /// In en, this message translates to:
  /// **'Aware of danger signs'**
  String get bpcrComponent7;

  /// No description provided for @bpcrComponent8.
  ///
  /// In en, this message translates to:
  /// **'ANC visits completed'**
  String get bpcrComponent8;

  /// No description provided for @bpcrComponent9.
  ///
  /// In en, this message translates to:
  /// **'Iron-folic acid tablets taken'**
  String get bpcrComponent9;

  /// No description provided for @bpcrComponent10.
  ///
  /// In en, this message translates to:
  /// **'TT vaccination done'**
  String get bpcrComponent10;

  /// No description provided for @bpcrCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get bpcrCompleted;

  /// No description provided for @bpcrPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get bpcrPending;

  /// No description provided for @bpcrIncomplete.
  ///
  /// In en, this message translates to:
  /// **'Incomplete'**
  String get bpcrIncomplete;

  /// No description provided for @bpcrUpdateSuccess.
  ///
  /// In en, this message translates to:
  /// **'BPCR checklist updated.'**
  String get bpcrUpdateSuccess;

  /// No description provided for @schemesTitle.
  ///
  /// In en, this message translates to:
  /// **'Maternal Schemes'**
  String get schemesTitle;

  /// No description provided for @schemeJsy.
  ///
  /// In en, this message translates to:
  /// **'Janani Suraksha Yojana (JSY)'**
  String get schemeJsy;

  /// No description provided for @schemeJssk.
  ///
  /// In en, this message translates to:
  /// **'Janani-Shishu Suraksha Karyakram (JSSK)'**
  String get schemeJssk;

  /// No description provided for @schemePmsma.
  ///
  /// In en, this message translates to:
  /// **'Pradhan Mantri Surakshit Matritva Abhiyan (PMSMA)'**
  String get schemePmsma;

  /// No description provided for @schemePmmvy.
  ///
  /// In en, this message translates to:
  /// **'Pradhan Mantri Matru Vandana Yojana (PMMVY)'**
  String get schemePmmvy;

  /// No description provided for @schemeMinimata.
  ///
  /// In en, this message translates to:
  /// **'Minimata Mahtari Jatan Yojana'**
  String get schemeMinimata;

  /// No description provided for @eligibility.
  ///
  /// In en, this message translates to:
  /// **'Eligibility'**
  String get eligibility;

  /// No description provided for @howToApply.
  ///
  /// In en, this message translates to:
  /// **'How to Apply'**
  String get howToApply;

  /// No description provided for @benefits.
  ///
  /// In en, this message translates to:
  /// **'Benefits'**
  String get benefits;

  /// No description provided for @applyNow.
  ///
  /// In en, this message translates to:
  /// **'Apply Now'**
  String get applyNow;

  /// No description provided for @learnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn More'**
  String get learnMore;

  /// No description provided for @ancTitle.
  ///
  /// In en, this message translates to:
  /// **'ANC Services'**
  String get ancTitle;

  /// No description provided for @ancVisitManager.
  ///
  /// In en, this message translates to:
  /// **'Visit Manager'**
  String get ancVisitManager;

  /// No description provided for @ancHighRiskScreening.
  ///
  /// In en, this message translates to:
  /// **'High-Risk Screening'**
  String get ancHighRiskScreening;

  /// No description provided for @ancSymptomChecker.
  ///
  /// In en, this message translates to:
  /// **'Symptom Checker'**
  String get ancSymptomChecker;

  /// No description provided for @ancWeekByWeek.
  ///
  /// In en, this message translates to:
  /// **'Week-by-Week Guide'**
  String get ancWeekByWeek;

  /// No description provided for @ancNutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition & Diet'**
  String get ancNutrition;

  /// No description provided for @ancVisitDue.
  ///
  /// In en, this message translates to:
  /// **'ANC Visit Due'**
  String get ancVisitDue;

  /// No description provided for @ancVisitOverdue.
  ///
  /// In en, this message translates to:
  /// **'ANC visit overdue by {days} days'**
  String ancVisitOverdue(int days);

  /// No description provided for @ancVisitScheduled.
  ///
  /// In en, this message translates to:
  /// **'Next visit: {date}'**
  String ancVisitScheduled(String date);

  /// No description provided for @ancVisit1.
  ///
  /// In en, this message translates to:
  /// **'1st ANC Visit'**
  String get ancVisit1;

  /// No description provided for @ancVisit2.
  ///
  /// In en, this message translates to:
  /// **'2nd ANC Visit'**
  String get ancVisit2;

  /// No description provided for @ancVisit3.
  ///
  /// In en, this message translates to:
  /// **'3rd ANC Visit'**
  String get ancVisit3;

  /// No description provided for @ancVisit4.
  ///
  /// In en, this message translates to:
  /// **'4th ANC Visit'**
  String get ancVisit4;

  /// No description provided for @ancVisitCompleted.
  ///
  /// In en, this message translates to:
  /// **'Visit completed on {date}'**
  String ancVisitCompleted(String date);

  /// No description provided for @trimester1.
  ///
  /// In en, this message translates to:
  /// **'1st Trimester'**
  String get trimester1;

  /// No description provided for @trimester2.
  ///
  /// In en, this message translates to:
  /// **'2nd Trimester'**
  String get trimester2;

  /// No description provided for @trimester3.
  ///
  /// In en, this message translates to:
  /// **'3rd Trimester'**
  String get trimester3;

  /// No description provided for @weekLabel.
  ///
  /// In en, this message translates to:
  /// **'Week {week}'**
  String weekLabel(int week);

  /// No description provided for @chatbotTitle.
  ///
  /// In en, this message translates to:
  /// **'Ask Sangwari Maa'**
  String get chatbotTitle;

  /// No description provided for @chatbotPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Type your question…'**
  String get chatbotPlaceholder;

  /// No description provided for @chatbotSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get chatbotSend;

  /// No description provided for @chatbotTyping.
  ///
  /// In en, this message translates to:
  /// **'Sangwari Maa is typing…'**
  String get chatbotTyping;

  /// No description provided for @faqTitle.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get faqTitle;

  /// No description provided for @faqEmpty.
  ///
  /// In en, this message translates to:
  /// **'No FAQs available at the moment.'**
  String get faqEmpty;

  /// No description provided for @remindersTitle.
  ///
  /// In en, this message translates to:
  /// **'My Reminders'**
  String get remindersTitle;

  /// No description provided for @reminderAncVisit.
  ///
  /// In en, this message translates to:
  /// **'ANC Visit Reminder'**
  String get reminderAncVisit;

  /// No description provided for @reminderMedicine.
  ///
  /// In en, this message translates to:
  /// **'Medicine Reminder'**
  String get reminderMedicine;

  /// No description provided for @reminderFollowUp.
  ///
  /// In en, this message translates to:
  /// **'Follow-up Reminder'**
  String get reminderFollowUp;

  /// No description provided for @reminderSetFor.
  ///
  /// In en, this message translates to:
  /// **'Set for {time}'**
  String reminderSetFor(String time);

  /// No description provided for @reminderAddNew.
  ///
  /// In en, this message translates to:
  /// **'Add Reminder'**
  String get reminderAddNew;

  /// No description provided for @reminderDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this reminder?'**
  String get reminderDeleteConfirm;

  /// No description provided for @emergencyTitle.
  ///
  /// In en, this message translates to:
  /// **'Emergency Help'**
  String get emergencyTitle;

  /// No description provided for @emergencyDangerSigns.
  ///
  /// In en, this message translates to:
  /// **'Danger Signs'**
  String get emergencyDangerSigns;

  /// No description provided for @emergencyCallAmbulance.
  ///
  /// In en, this message translates to:
  /// **'Call Ambulance (102/108)'**
  String get emergencyCallAmbulance;

  /// No description provided for @emergencyCallAsha.
  ///
  /// In en, this message translates to:
  /// **'Notify My ASHA'**
  String get emergencyCallAsha;

  /// No description provided for @emergencySafetyConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you safe now?'**
  String get emergencySafetyConfirm;

  /// No description provided for @emergencySafetyYes.
  ///
  /// In en, this message translates to:
  /// **'Yes, I am safe'**
  String get emergencySafetyYes;

  /// No description provided for @emergencySafetyNo.
  ///
  /// In en, this message translates to:
  /// **'No, I still need help'**
  String get emergencySafetyNo;

  /// No description provided for @dangerSign1.
  ///
  /// In en, this message translates to:
  /// **'Heavy bleeding'**
  String get dangerSign1;

  /// No description provided for @dangerSign2.
  ///
  /// In en, this message translates to:
  /// **'Severe headache or blurred vision'**
  String get dangerSign2;

  /// No description provided for @dangerSign3.
  ///
  /// In en, this message translates to:
  /// **'High fever'**
  String get dangerSign3;

  /// No description provided for @dangerSign4.
  ///
  /// In en, this message translates to:
  /// **'Fits or convulsions'**
  String get dangerSign4;

  /// No description provided for @dangerSign5.
  ///
  /// In en, this message translates to:
  /// **'Reduced or no fetal movement'**
  String get dangerSign5;

  /// No description provided for @dangerSign6.
  ///
  /// In en, this message translates to:
  /// **'Severe abdominal pain'**
  String get dangerSign6;

  /// No description provided for @dangerSign7.
  ///
  /// In en, this message translates to:
  /// **'Swelling of hands, face, or feet'**
  String get dangerSign7;

  /// No description provided for @dangerSign8.
  ///
  /// In en, this message translates to:
  /// **'Difficulty breathing'**
  String get dangerSign8;

  /// No description provided for @ashaHomeTitle.
  ///
  /// In en, this message translates to:
  /// **'ASHA / ANM Dashboard'**
  String get ashaHomeTitle;

  /// No description provided for @activeAlerts.
  ///
  /// In en, this message translates to:
  /// **'Active Alerts'**
  String get activeAlerts;

  /// No description provided for @hrpCount.
  ///
  /// In en, this message translates to:
  /// **'High-Risk Pregnancies'**
  String get hrpCount;

  /// No description provided for @dueAncVisits.
  ///
  /// In en, this message translates to:
  /// **'ANC Visits Due Today'**
  String get dueAncVisits;

  /// No description provided for @totalRegistered.
  ///
  /// In en, this message translates to:
  /// **'Total Rloegistered'**
  String get totalRegistered;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @alertsTitle.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get alertsTitle;

  /// No description provided for @alertRiskRed.
  ///
  /// In en, this message translates to:
  /// **'Red Alert'**
  String get alertRiskRed;

  /// No description provided for @alertRiskYellow.
  ///
  /// In en, this message translates to:
  /// **'Yellow Alert'**
  String get alertRiskYellow;

  /// No description provided for @alertTimeAgo.
  ///
  /// In en, this message translates to:
  /// **'{time} ago'**
  String alertTimeAgo(String time);

  /// No description provided for @alertSymptoms.
  ///
  /// In en, this message translates to:
  /// **'Symptoms'**
  String get alertSymptoms;

  /// No description provided for @alertStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get alertStatus;

  /// No description provided for @alertStatusNotContacted.
  ///
  /// In en, this message translates to:
  /// **'Not Contacted'**
  String get alertStatusNotContacted;

  /// No description provided for @alertStatusContacted.
  ///
  /// In en, this message translates to:
  /// **'Contacted'**
  String get alertStatusContacted;

  /// No description provided for @alertStatusReferred.
  ///
  /// In en, this message translates to:
  /// **'Referred to Facility'**
  String get alertStatusReferred;

  /// No description provided for @alertStatusResolved.
  ///
  /// In en, this message translates to:
  /// **'Resolved'**
  String get alertStatusResolved;

  /// No description provided for @alertUpdateStatus.
  ///
  /// In en, this message translates to:
  /// **'Update Status'**
  String get alertUpdateStatus;

  /// No description provided for @alertCallBeneficiary.
  ///
  /// In en, this message translates to:
  /// **'Call Beneficiary'**
  String get alertCallBeneficiary;

  /// No description provided for @alertCallAmbulance.
  ///
  /// In en, this message translates to:
  /// **'Call Ambulance (102/108)'**
  String get alertCallAmbulance;

  /// No description provided for @alertNavigate.
  ///
  /// In en, this message translates to:
  /// **'Navigate to Location'**
  String get alertNavigate;

  /// No description provided for @alertOpenVisitForm.
  ///
  /// In en, this message translates to:
  /// **'Open Visit Form'**
  String get alertOpenVisitForm;

  /// No description provided for @alertDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Alert Details'**
  String get alertDetailTitle;

  /// No description provided for @alertBeneficiaryInfo.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary Information'**
  String get alertBeneficiaryInfo;

  /// No description provided for @beneficiaryListTitle.
  ///
  /// In en, this message translates to:
  /// **'Beneficiaries'**
  String get beneficiaryListTitle;

  /// No description provided for @beneficiarySearch.
  ///
  /// In en, this message translates to:
  /// **'Search by name or ID'**
  String get beneficiarySearch;

  /// No description provided for @filterHighRisk.
  ///
  /// In en, this message translates to:
  /// **'High Risk'**
  String get filterHighRisk;

  /// No description provided for @filterBpcrIncomplete.
  ///
  /// In en, this message translates to:
  /// **'BPCR Incomplete'**
  String get filterBpcrIncomplete;

  /// No description provided for @beneficiaryDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary Details'**
  String get beneficiaryDetailTitle;

  /// No description provided for @ancHistory.
  ///
  /// In en, this message translates to:
  /// **'ANC History'**
  String get ancHistory;

  /// No description provided for @visitLog.
  ///
  /// In en, this message translates to:
  /// **'Visit Log'**
  String get visitLog;

  /// No description provided for @activityTracker.
  ///
  /// In en, this message translates to:
  /// **'Activity Tracker'**
  String get activityTracker;

  /// No description provided for @facilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Nearby Facilities'**
  String get facilityTitle;

  /// No description provided for @facilityDistance.
  ///
  /// In en, this message translates to:
  /// **'{distance} km away'**
  String facilityDistance(String distance);

  /// No description provided for @facilityGetDirections.
  ///
  /// In en, this message translates to:
  /// **'Get Directions'**
  String get facilityGetDirections;

  /// No description provided for @currentLocation.
  ///
  /// In en, this message translates to:
  /// **'Current Location'**
  String get currentLocation;

  /// No description provided for @responseTimeTitle.
  ///
  /// In en, this message translates to:
  /// **'Response Time'**
  String get responseTimeTitle;

  /// No description provided for @responseAvgMinutes.
  ///
  /// In en, this message translates to:
  /// **'Avg. Response Time'**
  String get responseAvgMinutes;

  /// No description provided for @responseWithin1hr.
  ///
  /// In en, this message translates to:
  /// **'Within 1 Hour'**
  String get responseWithin1hr;

  /// No description provided for @responseDelayed.
  ///
  /// In en, this message translates to:
  /// **'Delayed Cases (>72hr)'**
  String get responseDelayed;

  /// No description provided for @actionInProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get actionInProgress;

  /// No description provided for @actionClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get actionClosed;

  /// No description provided for @adminDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Admin Dashboard'**
  String get adminDashboardTitle;

  /// No description provided for @panelOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get panelOverview;

  /// No description provided for @panelBpcrAnalytics.
  ///
  /// In en, this message translates to:
  /// **'BPCR Analytics'**
  String get panelBpcrAnalytics;

  /// No description provided for @panelAlertMonitoring.
  ///
  /// In en, this message translates to:
  /// **'Alert Monitoring'**
  String get panelAlertMonitoring;

  /// No description provided for @panelResponseTime.
  ///
  /// In en, this message translates to:
  /// **'Response Time'**
  String get panelResponseTime;

  /// No description provided for @panelUserEngagement.
  ///
  /// In en, this message translates to:
  /// **'User Engagement'**
  String get panelUserEngagement;

  /// No description provided for @panelGisMap.
  ///
  /// In en, this message translates to:
  /// **'GIS Map'**
  String get panelGisMap;

  /// No description provided for @panelDataExport.
  ///
  /// In en, this message translates to:
  /// **'Data Export'**
  String get panelDataExport;

  /// No description provided for @panelSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get panelSettings;

  /// No description provided for @statTotalRegistered.
  ///
  /// In en, this message translates to:
  /// **'Total Registered'**
  String get statTotalRegistered;

  /// No description provided for @statActiveUsers.
  ///
  /// In en, this message translates to:
  /// **'Active Users'**
  String get statActiveUsers;

  /// No description provided for @statDropOffPercent.
  ///
  /// In en, this message translates to:
  /// **'Drop-off Rate'**
  String get statDropOffPercent;

  /// No description provided for @statAvgBpcr.
  ///
  /// In en, this message translates to:
  /// **'Avg. BPCR Score'**
  String get statAvgBpcr;

  /// No description provided for @statActiveAlerts.
  ///
  /// In en, this message translates to:
  /// **'Active Alerts'**
  String get statActiveAlerts;

  /// No description provided for @statDau.
  ///
  /// In en, this message translates to:
  /// **'Daily Active Users'**
  String get statDau;

  /// No description provided for @statRemindersPerUser.
  ///
  /// In en, this message translates to:
  /// **'Reminders / User'**
  String get statRemindersPerUser;

  /// No description provided for @statMostUsedModule.
  ///
  /// In en, this message translates to:
  /// **'Most Used Module'**
  String get statMostUsedModule;

  /// No description provided for @analyticsScoreDistribution.
  ///
  /// In en, this message translates to:
  /// **'Score Distribution'**
  String get analyticsScoreDistribution;

  /// No description provided for @analyticsTrendLine.
  ///
  /// In en, this message translates to:
  /// **'Trend'**
  String get analyticsTrendLine;

  /// No description provided for @analyticsBlockWise.
  ///
  /// In en, this message translates to:
  /// **'Block-wise Comparison'**
  String get analyticsBlockWise;

  /// No description provided for @mapHighRiskPins.
  ///
  /// In en, this message translates to:
  /// **'High-Risk Pregnancies'**
  String get mapHighRiskPins;

  /// No description provided for @mapAlertLocations.
  ///
  /// In en, this message translates to:
  /// **'Alert Locations'**
  String get mapAlertLocations;

  /// No description provided for @mapFacilityOverlay.
  ///
  /// In en, this message translates to:
  /// **'Facilities'**
  String get mapFacilityOverlay;

  /// No description provided for @exportTitle.
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get exportTitle;

  /// No description provided for @exportFilterBlock.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get exportFilterBlock;

  /// No description provided for @exportFilterTrimester.
  ///
  /// In en, this message translates to:
  /// **'Trimester'**
  String get exportFilterTrimester;

  /// No description provided for @exportFilterRisk.
  ///
  /// In en, this message translates to:
  /// **'Risk Level'**
  String get exportFilterRisk;

  /// No description provided for @exportFilterDateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get exportFilterDateRange;

  /// No description provided for @exportDownloadExcel.
  ///
  /// In en, this message translates to:
  /// **'Download Excel'**
  String get exportDownloadExcel;

  /// No description provided for @exportDownloadCsv.
  ///
  /// In en, this message translates to:
  /// **'Download CSV'**
  String get exportDownloadCsv;

  /// No description provided for @exportGenerating.
  ///
  /// In en, this message translates to:
  /// **'Generating export…'**
  String get exportGenerating;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsAlertThreshold.
  ///
  /// In en, this message translates to:
  /// **'Alert Threshold'**
  String get settingsAlertThreshold;

  /// No description provided for @settingsAddAdmin.
  ///
  /// In en, this message translates to:
  /// **'Add Block Admin / BMO'**
  String get settingsAddAdmin;

  /// No description provided for @settingsRoleLabel.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get settingsRoleLabel;

  /// No description provided for @roleWoman.
  ///
  /// In en, this message translates to:
  /// **'Pregnant Woman'**
  String get roleWoman;

  /// No description provided for @roleAsha.
  ///
  /// In en, this message translates to:
  /// **'ASHA'**
  String get roleAsha;

  /// No description provided for @roleAnm.
  ///
  /// In en, this message translates to:
  /// **'ANM'**
  String get roleAnm;

  /// No description provided for @roleBlockAdmin.
  ///
  /// In en, this message translates to:
  /// **'Block Admin'**
  String get roleBlockAdmin;

  /// No description provided for @roleBmo.
  ///
  /// In en, this message translates to:
  /// **'BMO'**
  String get roleBmo;

  /// No description provided for @rolePi.
  ///
  /// In en, this message translates to:
  /// **'Programme Investigator'**
  String get rolePi;

  /// No description provided for @roleSuperAdmin.
  ///
  /// In en, this message translates to:
  /// **'Super Admin'**
  String get roleSuperAdmin;

  /// No description provided for @uniqueId.
  ///
  /// In en, this message translates to:
  /// **'Unique ID'**
  String get uniqueId;

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// No description provided for @profileConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your profile details'**
  String get profileConfirmation;

  /// No description provided for @profileName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get profileName;

  /// No description provided for @profileRole.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get profileRole;

  /// No description provided for @profileArea.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get profileArea;

  /// No description provided for @profileSubcentre.
  ///
  /// In en, this message translates to:
  /// **'Sub-centre'**
  String get profileSubcentre;

  /// No description provided for @profileUniqueId.
  ///
  /// In en, this message translates to:
  /// **'Unique ID'**
  String get profileUniqueId;

  /// No description provided for @confirmDetails.
  ///
  /// In en, this message translates to:
  /// **'Confirm Details'**
  String get confirmDetails;

  /// No description provided for @offlineBannerMessage.
  ///
  /// In en, this message translates to:
  /// **'You are offline. Data will sync when connected.'**
  String get offlineBannerMessage;

  /// No description provided for @syncingData.
  ///
  /// In en, this message translates to:
  /// **'Syncing data…'**
  String get syncingData;

  /// No description provided for @lastSynced.
  ///
  /// In en, this message translates to:
  /// **'Last synced: {time}'**
  String lastSynced(String time);

  /// No description provided for @versionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String versionLabel(String version);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
