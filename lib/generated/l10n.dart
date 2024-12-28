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

  /// `Experience your best moments alongside a cup of `
  String get onboarding_description {
    return Intl.message(
      'Experience your best moments alongside a cup of ',
      name: 'onboarding_description',
      desc: '',
      args: [],
    );
  }

  /// `coffee`
  String get onboarding_description_highlight {
    return Intl.message(
      'coffee',
      name: 'onboarding_description_highlight',
      desc: '',
      args: [],
    );
  }

  /// `.`
  String get onboarding_description_part2 {
    return Intl.message(
      '.',
      name: 'onboarding_description_part2',
      desc: '',
      args: [],
    );
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

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
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

  /// `Enter`
  String get enter {
    return Intl.message(
      'Enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account yet?`
  String get Dont_have_an_account_yet {
    return Intl.message(
      'Don\'t have an account yet?',
      name: 'Dont_have_an_account_yet',
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

  /// `Sign up`
  String get register {
    return Intl.message(
      'Sign up',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Repeat password`
  String get repeat_password {
    return Intl.message(
      'Repeat password',
      name: 'repeat_password',
      desc: '',
      args: [],
    );
  }

  /// `e-mail`
  String get e_mail {
    return Intl.message(
      'e-mail',
      name: 'e_mail',
      desc: '',
      args: [],
    );
  }

  /// `I already have an account.`
  String get I_already_have_an_account {
    return Intl.message(
      'I already have an account.',
      name: 'I_already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Access`
  String get Access {
    return Intl.message(
      'Access',
      name: 'Access',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `password too short`
  String get password_too_short {
    return Intl.message(
      'password too short',
      name: 'password_too_short',
      desc: '',
      args: [],
    );
  }

  /// `password invalid`
  String get password_invalid {
    return Intl.message(
      'password invalid',
      name: 'password_invalid',
      desc: '',
      args: [],
    );
  }

  /// `passwords do not match`
  String get passwords_do_not_match {
    return Intl.message(
      'passwords do not match',
      name: 'passwords_do_not_match',
      desc: '',
      args: [],
    );
  }

  /// `please enter a password`
  String get please_enter_a_password {
    return Intl.message(
      'please enter a password',
      name: 'please_enter_a_password',
      desc: '',
      args: [],
    );
  }

  /// `please enter the password again`
  String get please_enter_the_password_again {
    return Intl.message(
      'please enter the password again',
      name: 'please_enter_the_password_again',
      desc: '',
      args: [],
    );
  }

  /// `Fill in all fields`
  String get fill_in_all_fields {
    return Intl.message(
      'Fill in all fields',
      name: 'fill_in_all_fields',
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
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'tr'),
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
