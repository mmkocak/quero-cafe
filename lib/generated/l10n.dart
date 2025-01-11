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

  /// `The password must contain at least one lowercase letter [a-z], at least one uppercase letter [A-Z], at least one number [0-9] and at least one special character [@$!%*?&].`
  String get password_type {
    return Intl.message(
      'The password must contain at least one lowercase letter [a-z], at least one uppercase letter [A-Z], at least one number [0-9] and at least one special character [@\$!%*?&].',
      name: 'password_type',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `so and so`
  String get so_and_so {
    return Intl.message(
      'so and so',
      name: 'so_and_so',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Latte`
  String get latte {
    return Intl.message(
      'Latte',
      name: 'latte',
      desc: '',
      args: [],
    );
  }

  /// `with milk`
  String get with_milk {
    return Intl.message(
      'with milk',
      name: 'with_milk',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `with Chocolate`
  String get with_chocolate {
    return Intl.message(
      'with Chocolate',
      name: 'with_chocolate',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `A cappuccino is a drink of approximately 10% espresso coffee, 32% fresh milk and 56% coffee, we use special beans...`
  String get coffee_description {
    return Intl.message(
      'A cappuccino is a drink of approximately 10% espresso coffee, 32% fresh milk and 56% coffee, we use special beans...',
      name: 'coffee_description',
      desc: '',
      args: [],
    );
  }

  /// `Read more`
  String get read_more {
    return Intl.message(
      'Read more',
      name: 'read_more',
      desc: '',
      args: [],
    );
  }

  /// `Available sizes`
  String get available_sizes {
    return Intl.message(
      'Available sizes',
      name: 'available_sizes',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get add_to_cart {
    return Intl.message(
      'Add to cart',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Small`
  String get small {
    return Intl.message(
      'Small',
      name: 'small',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get medium {
    return Intl.message(
      'Medium',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `Large`
  String get large {
    return Intl.message(
      'Large',
      name: 'large',
      desc: '',
      args: [],
    );
  }

  /// `Payment Summary`
  String get cartPaymentSummary {
    return Intl.message(
      'Payment Summary',
      name: 'cartPaymentSummary',
      desc: 'Title of the payment summary section in cart',
      args: [],
    );
  }

  /// `Price`
  String get cartPrice {
    return Intl.message(
      'Price',
      name: 'cartPrice',
      desc: 'Label for price in cart',
      args: [],
    );
  }

  /// `Delivery Fee`
  String get cartDeliveryFee {
    return Intl.message(
      'Delivery Fee',
      name: 'cartDeliveryFee',
      desc: 'Label for delivery fee in cart',
      args: [],
    );
  }

  /// `Total`
  String get cartTotal {
    return Intl.message(
      'Total',
      name: 'cartTotal',
      desc: 'Label for total amount in cart',
      args: [],
    );
  }

  /// `Order Now`
  String get cartOrderNow {
    return Intl.message(
      'Order Now',
      name: 'cartOrderNow',
      desc: 'Button text for placing order',
      args: [],
    );
  }

  /// `Your cart is empty`
  String get cartEmptyMessage {
    return Intl.message(
      'Your cart is empty',
      name: 'cartEmptyMessage',
      desc: 'Message shown when cart is empty',
      args: [],
    );
  }

  /// `Coupon Applied`
  String get cartCouponApplied {
    return Intl.message(
      'Coupon Applied',
      name: 'cartCouponApplied',
      desc: 'Label for applied coupon',
      args: [],
    );
  }

  /// `Add Coupon`
  String get cartAddCoupon {
    return Intl.message(
      'Add Coupon',
      name: 'cartAddCoupon',
      desc: 'Button text for adding coupon',
      args: [],
    );
  }

  /// `Delivery Address`
  String get cartDeliveryAddress {
    return Intl.message(
      'Delivery Address',
      name: 'cartDeliveryAddress',
      desc: 'Title for delivery address section',
      args: [],
    );
  }

  /// `Pickup Address`
  String get cartPickupAddress {
    return Intl.message(
      'Pickup Address',
      name: 'cartPickupAddress',
      desc: 'Title for pickup address section',
      args: [],
    );
  }

  /// `Edit Address`
  String get cartEditAddress {
    return Intl.message(
      'Edit Address',
      name: 'cartEditAddress',
      desc: 'Button text for editing address',
      args: [],
    );
  }

  /// `Add Note`
  String get cartAddNote {
    return Intl.message(
      'Add Note',
      name: 'cartAddNote',
      desc: 'Button text for adding note',
      args: [],
    );
  }

  /// `Select an address`
  String get cartSelectAddress {
    return Intl.message(
      'Select an address',
      name: 'cartSelectAddress',
      desc: 'Placeholder text when no address is selected',
      args: [],
    );
  }

  /// `Cash`
  String get cartCash {
    return Intl.message(
      'Cash',
      name: 'cartCash',
      desc: 'Payment method - cash',
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
