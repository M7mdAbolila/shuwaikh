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

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Let’s sign you in`
  String get lets_sign_in {
    return Intl.message(
      'Let’s sign you in',
      name: 'lets_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `welcome back, you have been mised.`
  String get welcome_back {
    return Intl.message(
      'welcome back, you have been mised.',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get sign_in {
    return Intl.message(
      'Sign in',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account ? `
  String get dont_have_account {
    return Intl.message(
      'Don’t have an account ? ',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Login With`
  String get login_with {
    return Intl.message(
      'Login With',
      name: 'login_with',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get username {
    return Intl.message(
      'User Name',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Great to see you here!`
  String get Great_to_see_you {
    return Intl.message(
      'Great to see you here!',
      name: 'Great_to_see_you',
      desc: '',
      args: [],
    );
  }

  /// `Let's set up your account in just a couple of steps`
  String get lets_setup_account {
    return Intl.message(
      'Let\'s set up your account in just a couple of steps',
      name: 'lets_setup_account',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phome_number {
    return Intl.message(
      'Phone Number',
      name: 'phome_number',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_pass {
    return Intl.message(
      'Confirm password',
      name: 'confirm_pass',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message(
      'Sign up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Do you have an account ? `
  String get do_you_have_account {
    return Intl.message(
      'Do you have an account ? ',
      name: 'do_you_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get enter_valid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'enter_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid password`
  String get enter_valid_pass {
    return Intl.message(
      'Please enter a valid password',
      name: 'enter_valid_pass',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get enter_valid_phone {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'enter_valid_phone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid user name`
  String get enter_valid_username {
    return Intl.message(
      'Please enter a valid user name',
      name: 'enter_valid_username',
      desc: '',
      args: [],
    );
  }

  /// `Password confirmation does not match`
  String get not_match {
    return Intl.message(
      'Password confirmation does not match',
      name: 'not_match',
      desc: '',
      args: [],
    );
  }

  /// `User name must over 3 characters`
  String get username_must_over_3 {
    return Intl.message(
      'User name must over 3 characters',
      name: 'username_must_over_3',
      desc: '',
      args: [],
    );
  }

  /// `Confirm OTP`
  String get confirm_otp {
    return Intl.message(
      'Confirm OTP',
      name: 'confirm_otp',
      desc: '',
      args: [],
    );
  }

  /// `Please enter 4 digits code form the SMS sent to your phone`
  String get enter_otp {
    return Intl.message(
      'Please enter 4 digits code form the SMS sent to your phone',
      name: 'enter_otp',
      desc: '',
      args: [],
    );
  }

  /// `Don't receive SMS ? `
  String get dont_recive {
    return Intl.message(
      'Don\'t receive SMS ? ',
      name: 'dont_recive',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Transaction history`
  String get trans_history {
    return Intl.message(
      'Transaction history',
      name: 'trans_history',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get account {
    return Intl.message(
      'My Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Your favourite`
  String get your_favorite {
    return Intl.message(
      'Your favourite',
      name: 'your_favorite',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contact_us {
    return Intl.message(
      'Contact us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get log_out {
    return Intl.message(
      'Log Out',
      name: 'log_out',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to`
  String get welcome_to {
    return Intl.message(
      'Welcome to',
      name: 'welcome_to',
      desc: '',
      args: [],
    );
  }

  /// `price: `
  String get price {
    return Intl.message(
      'price: ',
      name: 'price',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
