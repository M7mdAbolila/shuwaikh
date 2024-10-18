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

  /// `Welcome back, you have been missed.`
  String get welcome_back {
    return Intl.message(
      'Welcome back, you have been missed.',
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

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
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

  /// `Confirm Password`
  String get confirm_pass {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_pass',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up Successfully`
  String get signup_scess {
    return Intl.message(
      'Sign Up Successfully',
      name: 'signup_scess',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations, you have signed up successfully!`
  String get congratulate_signup {
    return Intl.message(
      'Congratulations, you have signed up successfully!',
      name: 'congratulate_signup',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_word {
    return Intl.message(
      'Continue',
      name: 'continue_word',
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

  /// `Your Vouchers`
  String get your_voucher {
    return Intl.message(
      'Your Vouchers',
      name: 'your_voucher',
      desc: '',
      args: [],
    );
  }

  /// `It’s great day for`
  String get its_great_day_for {
    return Intl.message(
      'It’s great day for',
      name: 'its_great_day_for',
      desc: '',
      args: [],
    );
  }

  /// `COFFEE`
  String get coffee {
    return Intl.message(
      'COFFEE',
      name: 'coffee',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get my_cart {
    return Intl.message(
      'My Cart',
      name: 'my_cart',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get items {
    return Intl.message(
      'items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `ADD MORE ITEMS`
  String get add_more_items {
    return Intl.message(
      'ADD MORE ITEMS',
      name: 'add_more_items',
      desc: '',
      args: [],
    );
  }

  /// `ADD ITEMS TO CART`
  String get add_items_to_cart {
    return Intl.message(
      'ADD ITEMS TO CART',
      name: 'add_items_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get check_out {
    return Intl.message(
      'Checkout',
      name: 'check_out',
      desc: '',
      args: [],
    );
  }

  /// `ORDER`
  String get order {
    return Intl.message(
      'ORDER',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Select Add On's (Optional)`
  String get select_add_ons {
    return Intl.message(
      'Select Add On\'s (Optional)',
      name: 'select_add_ons',
      desc: '',
      args: [],
    );
  }

  /// `Topping`
  String get topping {
    return Intl.message(
      'Topping',
      name: 'topping',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `ADD TO CART`
  String get add_to_cart {
    return Intl.message(
      'ADD TO CART',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Ice`
  String get ice {
    return Intl.message(
      'Ice',
      name: 'ice',
      desc: '',
      args: [],
    );
  }

  /// `Sugar`
  String get sugar {
    return Intl.message(
      'Sugar',
      name: 'sugar',
      desc: '',
      args: [],
    );
  }

  /// `Select Size **`
  String get select_size {
    return Intl.message(
      'Select Size **',
      name: 'select_size',
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

  /// `Regular`
  String get regular {
    return Intl.message(
      'Regular',
      name: 'regular',
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

  /// `All Categories`
  String get all_categories {
    return Intl.message(
      'All Categories',
      name: 'all_categories',
      desc: '',
      args: [],
    );
  }

  /// `minimum discount for orders over`
  String get minimum_discount {
    return Intl.message(
      'minimum discount for orders over',
      name: 'minimum_discount',
      desc: '',
      args: [],
    );
  }

  /// `expirt date`
  String get expired {
    return Intl.message(
      'expirt date',
      name: 'expired',
      desc: '',
      args: [],
    );
  }

  /// `No Offers Found`
  String get no_offers_found {
    return Intl.message(
      'No Offers Found',
      name: 'no_offers_found',
      desc: '',
      args: [],
    );
  }

  /// `Your Offers`
  String get your_offers {
    return Intl.message(
      'Your Offers',
      name: 'your_offers',
      desc: '',
      args: [],
    );
  }

  /// `size`
  String get size {
    return Intl.message(
      'size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Add On's`
  String get addons {
    return Intl.message(
      'Add On\'s',
      name: 'addons',
      desc: '',
      args: [],
    );
  }

  /// `Variation`
  String get variation {
    return Intl.message(
      'Variation',
      name: 'variation',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Adderss`
  String get address {
    return Intl.message(
      'Adderss',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Town / City`
  String get city {
    return Intl.message(
      'Town / City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Contact Email`
  String get contact_email {
    return Intl.message(
      'Contact Email',
      name: 'contact_email',
      desc: '',
      args: [],
    );
  }

  /// `UPDATE PROFILE`
  String get edit_profile {
    return Intl.message(
      'UPDATE PROFILE',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `EDIT BILLING DETAILS`
  String get edit_billing {
    return Intl.message(
      'EDIT BILLING DETAILS',
      name: 'edit_billing',
      desc: '',
      args: [],
    );
  }

  /// `EDIT SHIPPING DETAILS`
  String get edit_shipping {
    return Intl.message(
      'EDIT SHIPPING DETAILS',
      name: 'edit_shipping',
      desc: '',
      args: [],
    );
  }

  /// `UPDATE`
  String get update {
    return Intl.message(
      'UPDATE',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_pass {
    return Intl.message(
      'New Password',
      name: 'new_pass',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get old_pass {
    return Intl.message(
      'Old Password',
      name: 'old_pass',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_lang {
    return Intl.message(
      'Change Language',
      name: 'change_lang',
      desc: '',
      args: [],
    );
  }

  /// `No Coupons Found`
  String get no_coupons {
    return Intl.message(
      'No Coupons Found',
      name: 'no_coupons',
      desc: '',
      args: [],
    );
  }

  /// `Read More`
  String get read_more {
    return Intl.message(
      'Read More',
      name: 'read_more',
      desc: '',
      args: [],
    );
  }

  /// `Read Less`
  String get read_less {
    return Intl.message(
      'Read Less',
      name: 'read_less',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Charges *`
  String get shipping_charges {
    return Intl.message(
      'Shipping Charges *',
      name: 'shipping_charges',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Address`
  String get shipping_address {
    return Intl.message(
      'Shipping Address',
      name: 'shipping_address',
      desc: '',
      args: [],
    );
  }

  /// `Billing Address`
  String get billing_address {
    return Intl.message(
      'Billing Address',
      name: 'billing_address',
      desc: '',
      args: [],
    );
  }

  /// `Order Total`
  String get order_total {
    return Intl.message(
      'Order Total',
      name: 'order_total',
      desc: '',
      args: [],
    );
  }

  /// `Cart Total`
  String get cart_total {
    return Intl.message(
      'Cart Total',
      name: 'cart_total',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get discount {
    return Intl.message(
      'Discount',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `Tax`
  String get tax {
    return Intl.message(
      'Tax',
      name: 'tax',
      desc: '',
      args: [],
    );
  }

  /// `Cart Subtotal`
  String get cart_subtotal {
    return Intl.message(
      'Cart Subtotal',
      name: 'cart_subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Pay Via`
  String get pay_via {
    return Intl.message(
      'Pay Via',
      name: 'pay_via',
      desc: '',
      args: [],
    );
  }

  /// `Cash On Delivery`
  String get cash_on_delivery {
    return Intl.message(
      'Cash On Delivery',
      name: 'cash_on_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Enter Valid Info`
  String get enter_valid_info {
    return Intl.message(
      'Enter Valid Info',
      name: 'enter_valid_info',
      desc: '',
      args: [],
    );
  }

  /// `Billing Address will be Same as Shipping Address`
  String get same_address {
    return Intl.message(
      'Billing Address will be Same as Shipping Address',
      name: 'same_address',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get my_orders {
    return Intl.message(
      'My Orders',
      name: 'my_orders',
      desc: '',
      args: [],
    );
  }

  /// `Order Number`
  String get order_number {
    return Intl.message(
      'Order Number',
      name: 'order_number',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Select Shipping Charge`
  String get select_shipping_charge {
    return Intl.message(
      'Select Shipping Charge',
      name: 'select_shipping_charge',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Method`
  String get shipping_method {
    return Intl.message(
      'Shipping Method',
      name: 'shipping_method',
      desc: '',
      args: [],
    );
  }

  /// `Payment Status`
  String get payment_status {
    return Intl.message(
      'Payment Status',
      name: 'payment_status',
      desc: '',
      args: [],
    );
  }

  /// `Order Status`
  String get order_status {
    return Intl.message(
      'Order Status',
      name: 'order_status',
      desc: '',
      args: [],
    );
  }

  /// `size price`
  String get size_price {
    return Intl.message(
      'size price',
      name: 'size_price',
      desc: '',
      args: [],
    );
  }

  /// `UPDATE PROFILE`
  String get update_profile {
    return Intl.message(
      'UPDATE PROFILE',
      name: 'update_profile',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message(
      'Copy',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  /// `Copied To Clipboard`
  String get copied {
    return Intl.message(
      'Copied To Clipboard',
      name: 'copied',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `The cart is empty `
  String get cart_empty {
    return Intl.message(
      'The cart is empty ',
      name: 'cart_empty',
      desc: '',
      args: [],
    );
  }

  /// `Use Saved Details`
  String get use_saved_data {
    return Intl.message(
      'Use Saved Details',
      name: 'use_saved_data',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to use your saved shipping and billing details?`
  String get want_use_saved_details {
    return Intl.message(
      'Do you want to use your saved shipping and billing details?',
      name: 'want_use_saved_details',
      desc: '',
      args: [],
    );
  }

  /// `Save Details`
  String get save_details {
    return Intl.message(
      'Save Details',
      name: 'save_details',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to save these details for future use?`
  String get want_save_for_future {
    return Intl.message(
      'Do you want to save these details for future use?',
      name: 'want_save_for_future',
      desc: '',
      args: [],
    );
  }

  /// `Can edit details any time form "Setting" -> "Edit Shipping Details" or "Edit Billing Details"`
  String get can_edit_from_setting {
    return Intl.message(
      'Can edit details any time form "Setting" -> "Edit Shipping Details" or "Edit Billing Details"',
      name: 'can_edit_from_setting',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Coupon`
  String get coupon {
    return Intl.message(
      'Coupon',
      name: 'coupon',
      desc: '',
      args: [],
    );
  }

  /// `Copy coupon and paste it when checkout`
  String get copy_and_paste {
    return Intl.message(
      'Copy coupon and paste it when checkout',
      name: 'copy_and_paste',
      desc: '',
      args: [],
    );
  }

  /// `there is an empty information field`
  String get empty_field {
    return Intl.message(
      'there is an empty information field',
      name: 'empty_field',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get delete_acc {
    return Intl.message(
      'Delete Account',
      name: 'delete_acc',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account Successfully`
  String get delet_acc_success {
    return Intl.message(
      'Delete Account Successfully',
      name: 'delet_acc_success',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure Delete Your Account?`
  String get sure_delete_acc {
    return Intl.message(
      'Are You Sure Delete Your Account?',
      name: 'sure_delete_acc',
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
