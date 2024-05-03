// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get homeTitle {
    return Intl.message(
      'Home',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Gesture Detector`
  String get cardGestureDetectorTitle {
    return Intl.message(
      'Gesture Detector',
      name: 'cardGestureDetectorTitle',
      desc: '',
      args: [],
    );
  }

  /// `The ability to perceive the shape and movement of hands can be a vital component in improving the user experience in a variety of applications and devices.`
  String get cardGestureDetectorDescription {
    return Intl.message(
      'The ability to perceive the shape and movement of hands can be a vital component in improving the user experience in a variety of applications and devices.',
      name: 'cardGestureDetectorDescription',
      desc: '',
      args: [],
    );
  }

  /// `about us`
  String get pageAboutUs {
    return Intl.message(
      'about us',
      name: 'pageAboutUs',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get infoTitle {
    return Intl.message(
      'About Us',
      name: 'infoTitle',
      desc: '',
      args: [],
    );
  }

  /// `We are a team of professionals who are dedicated to providing the best service to our clients. We have been in business for over 10 years and have helped thousands of people achieve their goals. Our team is made up of experts in their field who are passionate about what they do. We are committed to providing the highest quality service to our clients and are always looking for ways to improve. We are here to help you succeed and will do everything we can to make sure you are satisfied with our service.`
  String get infoDescription {
    return Intl.message(
      'We are a team of professionals who are dedicated to providing the best service to our clients. We have been in business for over 10 years and have helped thousands of people achieve their goals. Our team is made up of experts in their field who are passionate about what they do. We are committed to providing the highest quality service to our clients and are always looking for ways to improve. We are here to help you succeed and will do everything we can to make sure you are satisfied with our service.',
      name: 'infoDescription',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get profileTitle {
    return Intl.message(
      'My Profile',
      name: 'profileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Personal Info`
  String get profilePersonalInfo {
    return Intl.message(
      'Personal Info',
      name: 'profilePersonalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Contact Details`
  String get profileContactDetails {
    return Intl.message(
      'Contact Details',
      name: 'profileContactDetails',
      desc: '',
      args: [],
    );
  }

  /// `Work Experience`
  String get profileWorkExperience {
    return Intl.message(
      'Work Experience',
      name: 'profileWorkExperience',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get profileEducation {
    return Intl.message(
      'Education',
      name: 'profileEducation',
      desc: '',
      args: [],
    );
  }

  /// `Appreciation`
  String get profileAppreciation {
    return Intl.message(
      'Appreciation',
      name: 'profileAppreciation',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get profileLogout {
    return Intl.message(
      'Logout',
      name: 'profileLogout',
      desc: '',
      args: [],
    );
  }

  /// `Tab`
  String get navigationTab {
    return Intl.message(
      'Tab',
      name: 'navigationTab',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get navigationTabHome {
    return Intl.message(
      'Home',
      name: 'navigationTabHome',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get navigationTabAboutUs {
    return Intl.message(
      'About us',
      name: 'navigationTabAboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get navigationTabProfile {
    return Intl.message(
      'Profile',
      name: 'navigationTabProfile',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'ES'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
