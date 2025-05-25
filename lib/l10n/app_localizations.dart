import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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
    Locale('bn'),
    Locale('en'),
    Locale('hi'),
    Locale('mr'),
    Locale('ta'),
    Locale('te')
  ];

  /// No description provided for @loginDetails.
  ///
  /// In en, this message translates to:
  /// **'Login Details'**
  String get loginDetails;

  /// No description provided for @enterDetails.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Details'**
  String get enterDetails;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @contactNumber.
  ///
  /// In en, this message translates to:
  /// **'Contact Number'**
  String get contactNumber;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @pleaseEnter.
  ///
  /// In en, this message translates to:
  /// **'Please enter'**
  String get pleaseEnter;

  /// No description provided for @invalidName.
  ///
  /// In en, this message translates to:
  /// **'Invalid name. Only alphabets allowed.'**
  String get invalidName;

  /// No description provided for @invalidPhone.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number. Must be 10 digits.'**
  String get invalidPhone;

  /// No description provided for @invalidAge.
  ///
  /// In en, this message translates to:
  /// **'Age must be between 10 and 100.'**
  String get invalidAge;

  /// No description provided for @selectGender.
  ///
  /// In en, this message translates to:
  /// **'Select Gender'**
  String get selectGender;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @genderOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get genderOther;

  /// No description provided for @pleaseSelectGender.
  ///
  /// In en, this message translates to:
  /// **'Please select gender'**
  String get pleaseSelectGender;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @selectState.
  ///
  /// In en, this message translates to:
  /// **'Select State'**
  String get selectState;

  /// No description provided for @fromWhichState.
  ///
  /// In en, this message translates to:
  /// **'From which state you are?'**
  String get fromWhichState;

  /// No description provided for @selectYourState.
  ///
  /// In en, this message translates to:
  /// **'Select your state'**
  String get selectYourState;

  /// No description provided for @selectJob.
  ///
  /// In en, this message translates to:
  /// **'Select Job'**
  String get selectJob;

  /// No description provided for @whichJob.
  ///
  /// In en, this message translates to:
  /// **'Which job do you want?'**
  String get whichJob;

  /// No description provided for @selectJobType.
  ///
  /// In en, this message translates to:
  /// **'Select job type'**
  String get selectJobType;

  /// No description provided for @submitted.
  ///
  /// In en, this message translates to:
  /// **'Submitted'**
  String get submitted;

  /// No description provided for @jobConfirmation.
  ///
  /// In en, this message translates to:
  /// **'We will find a job for you!'**
  String get jobConfirmation;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @pleaseSelectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Please select your language'**
  String get pleaseSelectLanguage;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @jobBabySitter.
  ///
  /// In en, this message translates to:
  /// **'Baby Sitter'**
  String get jobBabySitter;

  /// No description provided for @jobCook.
  ///
  /// In en, this message translates to:
  /// **'Cook'**
  String get jobCook;

  /// No description provided for @jobHelper.
  ///
  /// In en, this message translates to:
  /// **'Helper'**
  String get jobHelper;

  /// No description provided for @jobDriver.
  ///
  /// In en, this message translates to:
  /// **'Driver'**
  String get jobDriver;

  /// No description provided for @jobPatientCareTaker.
  ///
  /// In en, this message translates to:
  /// **'Patient care taker'**
  String get jobPatientCareTaker;

  /// No description provided for @jobDeliveryPerson.
  ///
  /// In en, this message translates to:
  /// **'Delivery person'**
  String get jobDeliveryPerson;

  /// No description provided for @state_AndhraPradesh.
  ///
  /// In en, this message translates to:
  /// **'Andhra Pradesh'**
  String get state_AndhraPradesh;

  /// No description provided for @state_ArunachalPradesh.
  ///
  /// In en, this message translates to:
  /// **'Arunachal Pradesh'**
  String get state_ArunachalPradesh;

  /// No description provided for @state_Assam.
  ///
  /// In en, this message translates to:
  /// **'Assam'**
  String get state_Assam;

  /// No description provided for @state_Bihar.
  ///
  /// In en, this message translates to:
  /// **'Bihar'**
  String get state_Bihar;

  /// No description provided for @state_Chhattisgarh.
  ///
  /// In en, this message translates to:
  /// **'Chhattisgarh'**
  String get state_Chhattisgarh;

  /// No description provided for @state_Delhi.
  ///
  /// In en, this message translates to:
  /// **'Delhi'**
  String get state_Delhi;

  /// No description provided for @state_Goa.
  ///
  /// In en, this message translates to:
  /// **'Goa'**
  String get state_Goa;

  /// No description provided for @state_Gujarat.
  ///
  /// In en, this message translates to:
  /// **'Gujarat'**
  String get state_Gujarat;

  /// No description provided for @state_Haryana.
  ///
  /// In en, this message translates to:
  /// **'Haryana'**
  String get state_Haryana;

  /// No description provided for @state_HimachalPradesh.
  ///
  /// In en, this message translates to:
  /// **'Himachal Pradesh'**
  String get state_HimachalPradesh;

  /// No description provided for @state_Jharkhand.
  ///
  /// In en, this message translates to:
  /// **'Jharkhand'**
  String get state_Jharkhand;

  /// No description provided for @state_Karnataka.
  ///
  /// In en, this message translates to:
  /// **'Karnataka'**
  String get state_Karnataka;

  /// No description provided for @state_Kerala.
  ///
  /// In en, this message translates to:
  /// **'Kerala'**
  String get state_Kerala;

  /// No description provided for @state_MadhyaPradesh.
  ///
  /// In en, this message translates to:
  /// **'Madhya Pradesh'**
  String get state_MadhyaPradesh;

  /// No description provided for @state_Maharashtra.
  ///
  /// In en, this message translates to:
  /// **'Maharashtra'**
  String get state_Maharashtra;

  /// No description provided for @state_Manipur.
  ///
  /// In en, this message translates to:
  /// **'Manipur'**
  String get state_Manipur;

  /// No description provided for @state_Meghalaya.
  ///
  /// In en, this message translates to:
  /// **'Meghalaya'**
  String get state_Meghalaya;

  /// No description provided for @state_Mizoram.
  ///
  /// In en, this message translates to:
  /// **'Mizoram'**
  String get state_Mizoram;

  /// No description provided for @state_Nagaland.
  ///
  /// In en, this message translates to:
  /// **'Nagaland'**
  String get state_Nagaland;

  /// No description provided for @state_Odisha.
  ///
  /// In en, this message translates to:
  /// **'Odisha'**
  String get state_Odisha;

  /// No description provided for @state_Punjab.
  ///
  /// In en, this message translates to:
  /// **'Punjab'**
  String get state_Punjab;

  /// No description provided for @state_Rajasthan.
  ///
  /// In en, this message translates to:
  /// **'Rajasthan'**
  String get state_Rajasthan;

  /// No description provided for @state_Sikkim.
  ///
  /// In en, this message translates to:
  /// **'Sikkim'**
  String get state_Sikkim;

  /// No description provided for @state_TamilNadu.
  ///
  /// In en, this message translates to:
  /// **'Tamil Nadu'**
  String get state_TamilNadu;

  /// No description provided for @state_Telangana.
  ///
  /// In en, this message translates to:
  /// **'Telangana'**
  String get state_Telangana;

  /// No description provided for @state_Tripura.
  ///
  /// In en, this message translates to:
  /// **'Tripura'**
  String get state_Tripura;

  /// No description provided for @state_UttarPradesh.
  ///
  /// In en, this message translates to:
  /// **'Uttar Pradesh'**
  String get state_UttarPradesh;

  /// No description provided for @state_Uttarakhand.
  ///
  /// In en, this message translates to:
  /// **'Uttarakhand'**
  String get state_Uttarakhand;

  /// No description provided for @state_WestBengal.
  ///
  /// In en, this message translates to:
  /// **'West Bengal'**
  String get state_WestBengal;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'bn',
        'en',
        'hi',
        'mr',
        'ta',
        'te'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'mr':
      return AppLocalizationsMr();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
