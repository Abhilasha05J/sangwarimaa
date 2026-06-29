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
  String get newUserCompleteRegistration =>
      'आप यहाँ नए हैं! जारी रखने के लिए कृपया अपना पंजीकरण पूरा करें।';

  @override
  String get welcomeBackLoggedIn =>
      'वापसी पर स्वागत है! आप पहले से पंजीकृत हैं।';

  @override
  String get accountExistsPleaseLogin =>
      'इस नंबर के लिए खाता पहले से मौजूद है। कृपया लॉगिन करें।';

  @override
  String get dobFutureError => 'जन्म तिथि भविष्य में नहीं हो सकती';

  @override
  String get ageRangeError => 'आयु 14 से 55 के बीच होनी चाहिए';

  @override
  String get ageDobMismatch => 'आयु दर्ज की गई जन्म तिथि से मेल नहीं खाती';

  @override
  String get lmpFutureError => 'LMP तिथि भविष्य में नहीं हो सकती';

  @override
  String get lmpTooOldError => 'LMP तिथि बहुत पुरानी लगती है';

  @override
  String get required => 'आवश्यक';

  @override
  String get invalidValue => 'अमान्य मूल्य';

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
  String get myProfile => 'प्रोफ़ाइल';

  @override
  String get bpcrModule => 'BPCR';

  @override
  String get bpcrdesc =>
      'जन्म तैयारी एवं जटिलता तत्परता (BPCR) के महत्वपूर्ण चरणों की प्रगति को ट्रैक करें।';

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
  String get videomodule => 'वीडियो अनुभाग';

  @override
  String get videomoduledesc => 'सुरक्षित मातृत्व के लिए शैक्षणिक सामग्री';

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
  String get bpcr_danger_pregnancy_title => 'गर्भावस्था के दौरान खतरे के संकेत';

  @override
  String get bpcr_danger_pregnancy_desc =>
      'तेज़ सिरदर्द, धुंधला दिखाई देना, सूजन।';

  @override
  String get bpcr_danger_labor_title =>
      'प्रसव एवं बच्चे के जन्म के दौरान खतरे के संकेत';

  @override
  String get bpcr_danger_labor_desc =>
      'प्रसव और बच्चे के जन्म के दौरान खतरे के संकेत।';

  @override
  String get bpcr_postnatal_title => 'प्रसवोत्तर अवधि के दौरान खतरे के संकेत';

  @override
  String get bpcr_postnatal_desc => 'दुर्गंधयुक्त स्राव, तेज दर्द, अवसाद।';

  @override
  String get bpcr_newborn_title => 'नवजात अवधि में खतरे के संकेत';

  @override
  String get bpcr_newborn_desc =>
      'सांस लेने में कठिनाई, दौरे पड़ना, शरीर ठंडा होना।';

  @override
  String get bpcr_health_facility_title => 'स्वास्थ्य सुविधा की पहचान';

  @override
  String get bpcr_skill_birth_attendant_title =>
      'प्रशिक्षित प्रसव सहायक की पहचान';

  @override
  String get bpcr_transport_title =>
      'स्वास्थ्य सुविधा तक पहुँचने के लिए परिवहन व्यवस्था की योजना';

  @override
  String get bpcr_transport_desc => '108/102 आपातकालीन कॉल';

  @override
  String get bpcr_save_money_title => 'प्रसव के लिए धन बचाने की योजना';

  @override
  String get bpcr_financial_support_title =>
      'सामुदायिक वित्तीय सहायता प्रणाली की उपलब्धता की पहचान';

  @override
  String get bpcr_financial_support_desc => 'स्थानीय सहायता उपलब्ध';

  @override
  String get bpcr_blood_donor_title =>
      'सामुदायिक रक्तदाता की उपलब्धता की पहचान';

  @override
  String get bpcrCompleted => 'Completed';

  @override
  String get bpcrPending => 'बाकी है';

  @override
  String get bpcrIncomplete => 'अधूरा';

  @override
  String get bpcrUpdateSuccess => 'BPCR चेकलिस्ट अपडेट हो गई।';

  @override
  String get maternalSchemesdesc =>
      'सरकारी योजनाओं के बारे में जानें और पात्रता की जाँच करें।';

  @override
  String get schemesTitle => 'मातृत्व लाभ योजनाएं';

  @override
  String get schemes_explore => 'योजनाओं के बारे में जानें';

  @override
  String get schemes_details => 'योजना का विवरण';

  @override
  String get jsy_name => 'जननी सुरक्षा योजना (JSY)';

  @override
  String get jsy_eligibility_1 =>
      'सरकारी स्वास्थ्य केंद्रों जैसे उप-केंद्र, PHC/CHC/FRU/जिला और राज्य अस्पतालों के सामान्य वार्डों या मान्यता प्राप्त निजी संस्थानों में प्रसव कराने वाली सभी गर्भवती महिलाएं';

  @override
  String get jsy_eligibility_2 =>
      'सरकारी स्वास्थ्य केंद्र में प्रसव कराने वाली सभी SC और ST महिलाएं';

  @override
  String get jsy_cash_title => 'नकद सहायता';

  @override
  String get jsy_cash_desc =>
      'सरकारी या मान्यता प्राप्त निजी स्वास्थ्य संस्थानों में प्रसव पर सभी को दी जाती है';

  @override
  String get jsy_table_category => 'श्रेणी';

  @override
  String get jsy_table_rural => 'ग्रामीण';

  @override
  String get jsy_table_urban => 'शहरी';

  @override
  String get jsy_table_total => 'कुल';

  @override
  String get jsy_table_mother_package => 'माता सहायता राशि';

  @override
  String get jsy_table_mitanin_package => 'मितानिन सहायता राशि';

  @override
  String get schemeJssk => 'जननी-शिशु सुरक्षा कार्यक्रम (JSSK)';

  @override
  String get jssk_eligibility_desc =>
      'सभी गर्भवती माताएँ एवं बीमार नवजात शिशु जो सार्वजनिक स्वास्थ्य संस्थानों में उपचार प्राप्त करते हैं।';

  @override
  String get jssk_women_title => 'गर्भवती महिलाओं हेतु लाभ';

  @override
  String get jssk_women_1 =>
      'निःशुल्क एवं शून्य व्यय प्रसव तथा सिजेरियन सेक्शन';

  @override
  String get jssk_women_2 => 'निःशुल्क दवाइयाँ एवं उपभोग्य सामग्री';

  @override
  String get jssk_women_3 =>
      'निःशुल्क आवश्यक जांचें (रक्त, मूत्र एवं अल्ट्रासोनोग्राफी)';

  @override
  String get jssk_women_4 =>
      'स्वास्थ्य संस्थान में भर्ती अवधि के दौरान निःशुल्क भोजन';

  @override
  String get jssk_women_5 => 'निःशुल्क रक्त उपलब्धता';

  @override
  String get jssk_women_6 =>
      'घर से स्वास्थ्य संस्थान तक तथा रेफरल हेतु निःशुल्क परिवहन';

  @override
  String get jssk_women_7 => 'सभी प्रकार के उपयोगकर्ता शुल्कों से छूट';

  @override
  String get jssk_newborn_title =>
      'जन्म के एक वर्ष तक बीमार नवजात शिशुओं हेतु लाभ';

  @override
  String get jssk_newborn_1 => 'निःशुल्क एवं शून्य व्यय उपचार';

  @override
  String get jssk_newborn_2 => 'निःशुल्क दवाइयाँ एवं उपभोग्य सामग्री';

  @override
  String get jssk_newborn_3 => 'निःशुल्क जांच';

  @override
  String get jssk_newborn_4 => 'निःशुल्क रक्त उपलब्धता';

  @override
  String get jssk_newborn_5 => 'निःशुल्क परिवहन एवं रेफरल परिवहन';

  @override
  String get jssk_newborn_6 => 'सभी प्रकार के उपयोगकर्ता शुल्कों से छूट';

  @override
  String get schemePmsma => 'प्रधानमंत्री सुरक्षित मातृत्व अभियान (PMSMA)';

  @override
  String get pmsma_desc_1 =>
      'देशभर में प्रत्येक माह की 9 तारीख को चिन्हित सरकारी स्वास्थ्य संस्थानों में विशेष एएनसी जांच दिवस आयोजित किया जाता है।';

  @override
  String get pmsma_desc_2 =>
      'नियमित एएनसी के अतिरिक्त प्रधानमंत्री सुरक्षित मातृत्व क्लीनिकों में सेवाएँ प्रदान की जाती हैं।';

  @override
  String get pmsma_desc_3 =>
      'प्रत्येक गर्भवती महिला को दूसरी या तीसरी तिमाही में कम से कम एक निःशुल्क चिकित्सकीय जांच प्राप्त होती है।';

  @override
  String get pmsma_desc_4 =>
      'दूसरी या तीसरी तिमाही की सभी गर्भवती महिलाएँ पात्र हैं।';

  @override
  String get pmsma_services_title => 'सेवाओं का पैकेज';

  @override
  String get pmsma_service_1 => 'नियमित प्रसवपूर्व जांच';

  @override
  String get pmsma_service_2 => 'नैदानिक सेवाएँ';

  @override
  String get pmsma_service_3 =>
      'उच्च जोखिम वाली गर्भवती महिलाओं की पहचान एवं प्रबंधन';

  @override
  String get pmsma_service_4 =>
      'पोषण, परिवार नियोजन, सुरक्षित प्रसव तैयारी, नवजात एवं प्रसवोत्तर देखभाल पर परामर्श';

  @override
  String get schemePmmvy => 'प्रधानमंत्री मातृ वंदना योजना (PMMVY)';

  @override
  String get pmmvy_des =>
      'गर्भवती और स्तनपान कराने वाली माताओं को आर्थिक सहायता देने के लिए नकद प्रोत्साहन';

  @override
  String get pmmvy_eligibility_1 =>
      'अनुसूचित जाति एवं अनुसूचित जनजाति की महिलाएँ';

  @override
  String get pmmvy_eligibility_2 =>
      'आंशिक (40%) या पूर्ण रूप से दिव्यांग महिलाएँ';

  @override
  String get pmmvy_eligibility_3 => 'बीपीएल राशन कार्ड धारक महिलाएँ';

  @override
  String get pmmvy_eligibility_4 =>
      'आयुष्मान भारत के अंतर्गत प्रधानमंत्री जन आरोग्य योजना (PMJAY) की लाभार्थी महिलाएँ';

  @override
  String get pmmvy_eligibility_5 => 'ई-श्रम कार्ड धारक महिलाएँ';

  @override
  String get pmmvy_eligibility_6 => 'किसान सम्मान निधि की लाभार्थी महिला किसान';

  @override
  String get pmmvy_eligibility_7 => 'मनरेगा जॉब कार्ड धारक महिलाएँ';

  @override
  String get pmmvy_eligibility_8 =>
      'जिन महिलाओं की पारिवारिक वार्षिक आय 8 लाख रुपये से कम है';

  @override
  String get pmmvy_eligibility_9 =>
      'गर्भवती एवं स्तनपान कराने वाली आंगनवाड़ी कार्यकर्ता, आंगनवाड़ी सहायिका एवं आशा कार्यकर्ता';

  @override
  String get pmmvy_eligibility_10 =>
      'केंद्र सरकार द्वारा निर्धारित कोई अन्य श्रेणी';

  @override
  String get pmmvy_exclusion_note =>
      'केंद्र सरकार, राज्य सरकार, सार्वजनिक उपक्रमों में नियमित रूप से कार्यरत गर्भवती एवं स्तनपान कराने वाली महिलाएँ अथवा वर्तमान में किसी अन्य कानून के अंतर्गत समान लाभ प्राप्त करने वाली महिलाएँ PMMVY के लाभ हेतु पात्र नहीं होंगी।';

  @override
  String get pmmvy_installment_title => 'शर्तें एवं किश्तें';

  @override
  String get pmmvy_table_installment => 'किश्त';

  @override
  String get pmmvy_table_conditions => 'शर्तें';

  @override
  String get pmmvy_table_amount => 'राशि';

  @override
  String get pmmvy_first_installment_title => 'प्रथम किश्त';

  @override
  String get pmmvy_first_installment_condition =>
      'गर्भावस्था के पंजीकरण तथा LMP तिथि से 6 माह के भीतर कम से कम एक प्रसवपूर्व जांच (ANC) आंगनवाड़ी केन्द्र या राज्य/केंद्रशासित प्रदेश द्वारा अनुमोदित स्वास्थ्य संस्थान में करवाने पर।';

  @override
  String get pmmvy_first_installment_amount => '₹ 3000/-';

  @override
  String get pmmvy_second_installment_title => 'द्वितीय किश्त';

  @override
  String get pmmvy_second_installment_condition_1 =>
      'बच्चे के जन्म का पंजीकरण किया गया हो।';

  @override
  String get pmmvy_second_installment_condition_2 =>
      'बच्चे को BCG, OPV, DPT तथा हेपेटाइटिस-B अथवा उसके समकक्ष टीकों का प्रथम चक्र प्राप्त हुआ हो।';

  @override
  String get pmmvy_second_installment_amount => '₹ 2000/-';

  @override
  String get pmmvy_benefit_desc =>
      'यह फ़ायदा महिला को उसके पहले दो जीवित बच्चों के लिए मिलता है, बशर्ते दूसरा बच्चा लड़की हो। पहले बच्चे के लिए ₹5,000 की राशि दो किश्तों में दी जाती है, और दूसरे बच्चे के लिए ₹6,000 का फ़ायदा एक ही किश्त में दिया जाता है (बच्चे के जन्म के बाद), बशर्ते दूसरा बच्चा लड़की हो।';

  @override
  String get anganwadi_name =>
      'गर्भवती माताओं एवं बच्चों हेतु आंगनवाड़ी केन्द्र की सेवाएँ';

  @override
  String get anganwadi_table_service => 'सेवाएँ';

  @override
  String get anganwadi_table_target_group => 'लक्षित समूह';

  @override
  String get anganwadi_table_provider => 'सेवा प्रदाता';

  @override
  String get anganwadi_service_1 => 'पूरक पोषण';

  @override
  String get anganwadi_service_1_target =>
      '3 वर्ष से कम आयु के बच्चे तथा गर्भवती एवं स्तनपान कराने वाली माताएँ - टेक होम राशन (THR); 3-6 वर्ष के बच्चों हेतु गर्म पका हुआ भोजन एवं THR';

  @override
  String get anganwadi_service_1_provider =>
      'आंगनवाड़ी कार्यकर्ता (AWW) एवं आंगनवाड़ी सहायिका (AWH)';

  @override
  String get anganwadi_service_2 => 'टीकाकरण';

  @override
  String get anganwadi_service_2_target =>
      '6 वर्ष से कम आयु के बच्चे; गर्भवती एवं स्तनपान कराने वाली माताएँ';

  @override
  String get anganwadi_service_2_provider => 'एएनएम / चिकित्सा अधिकारी (MO)';

  @override
  String get anganwadi_service_3 => 'स्वास्थ्य जांच';

  @override
  String get anganwadi_service_3_target =>
      '6 वर्ष से कम आयु के बच्चे; गर्भवती एवं स्तनपान कराने वाली माताएँ';

  @override
  String get anganwadi_service_3_provider =>
      'एएनएम / चिकित्सा अधिकारी (MO) / आंगनवाड़ी कार्यकर्ता (AWW)';

  @override
  String get anganwadi_service_4 => 'रेफरल सेवाएँ';

  @override
  String get anganwadi_service_4_target =>
      '6 वर्ष से कम आयु के बच्चे; गर्भवती एवं स्तनपान कराने वाली माताएँ';

  @override
  String get anganwadi_service_4_provider =>
      'आंगनवाड़ी कार्यकर्ता (AWW) / एएनएम / चिकित्सा अधिकारी (MO)';

  @override
  String get schemeMinimata =>
      'मिनीमाता महतारी जतन योजना (पूर्व में भगिनी प्रसूति सहायता योजना)';

  @override
  String get minimata_desc =>
      'इस योजना के अंतर्गत ₹10,000 की मातृत्व सहायता प्रदान की जाती है, जिसमें से ₹5,000 गर्भावस्था की प्रथम तिमाही में तथा शेष ₹5,000 तृतीय तिमाही (आठवें माह) में दिए जाते हैं। सूचना प्राप्त होने के 72 घंटे के भीतर सहायता राशि का भुगतान कर दिया जाता है।';

  @override
  String get minimata_eligibility_title => 'योजना में भागीदारी हेतु पात्रता';

  @override
  String get minimata_eligibility_1 => 'लाभार्थी के पति का पंजीकरण आवश्यक है।';

  @override
  String get minimata_eligibility_2 =>
      'महिला की गर्भावस्था का सत्यापन डॉक्टर, एएनएम या मितानिन द्वारा किया जाना आवश्यक है।';

  @override
  String get minimata_eligibility_3 =>
      'सार्वजनिक या शासकीय संस्थानों में कार्यरत निर्माण श्रमिकों की पत्नियाँ इस योजना के लिए पात्र नहीं होंगी।';

  @override
  String get minimata_eligibility_4 =>
      'मातृत्व योजना का लाभ अधिकतम दो प्रसवों तक ही देय होगा।';

  @override
  String get minimata_eligibility_5 =>
      'पंजीकरण के 90 दिनों बाद लाभ हेतु पात्रता प्राप्त होगी।';

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
  String get ancdesc => 'वर्तमान गर्भावस्था के लिए उपलब्ध सेवाएँ';

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
  String get chatbot => 'चैटबॉट';

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
  String get chatbotWelcome =>
      'नमस्ते! मैं मातृ स्वास्थ्य संबंधी सवालों में मदद कर सकती हूं। नीचे एक विषय चुनें, या कभी भी अपना सवाल टाइप करें।';

  @override
  String get chatbotCategoryBpcr => 'प्रसव की तैयारी (BPCR)';

  @override
  String get chatbotCategorySchemes => 'मातृ स्वास्थ्य योजनाएं';

  @override
  String get chatbotCategoryPnc => 'प्रसवोत्तर और नवजात देखभाल';

  @override
  String chatbotQuestionsIntro(Object category) {
    return '$category के बारे में कुछ सामान्य सवाल यहां हैं:';
  }

  @override
  String get chatbotNoFaqs =>
      'इस विषय पर अभी मेरे पास सवाल-जवाब नहीं हैं — कृपया नीचे अपना सवाल टाइप करें।';

  @override
  String get chatbotCategoryLoadError =>
      'क्षमा करें, यह विषय लोड नहीं हो सका। कृपया फिर से प्रयास करें।';

  @override
  String get chatbotSendError =>
      'क्षमा करें, कुछ गड़बड़ हो गई। कृपया फिर से प्रयास करें।';

  @override
  String get chatbotBackToTopics => '⬅ विषयों पर वापस जाएं';

  @override
  String get chatbotAnythingElse => 'इस विषय पर कुछ और जानना है?';

  @override
  String get chatbotNoAnswerYet =>
      'क्षमा करें, इसका उत्तर अभी मेरे पास नहीं है।';

  @override
  String get chatbotGeneralTopic => 'सामान्य';

  @override
  String get chatbotYes => 'हां';

  @override
  String get chatbotNo => 'नहीं';

  @override
  String get chatbotPickAnother => 'ठीक है, एक और सवाल चुनें:';

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
  String get help => 'मैं आपकी क्या मदद कर सकता हूँ ?';

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
