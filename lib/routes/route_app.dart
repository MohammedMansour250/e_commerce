import 'package:e_commerce_project/controller/auth/forget_password_controller.dart';
import 'package:e_commerce_project/core/constant/app_routes_name.dart';
import 'package:e_commerce_project/data/data_source/remote/address/address.dart';
import 'package:e_commerce_project/view/screens/auth/check_email_screen.dart';
import 'package:e_commerce_project/view/screens/auth/forget_password/forget_password_screen.dart';
import 'package:e_commerce_project/view/screens/auth/forget_password/reset_password.dart';
import 'package:e_commerce_project/view/screens/auth/sign_in.dart';
import 'package:e_commerce_project/view/screens/auth/sign_up.dart';
import 'package:e_commerce_project/view/screens/auth/forget_password/success_reset_password.dart';
import 'package:e_commerce_project/view/screens/auth/success_sign_up_screen.dart';
import 'package:e_commerce_project/view/screens/auth/forget_password/verify_code_screen.dart';
import 'package:e_commerce_project/view/screens/auth/verify_code_sign_up_screen.dart';
import 'package:e_commerce_project/view/screens/home/search_screen.dart';
import 'package:e_commerce_project/view/screens/items/items_screen.dart';
import 'package:e_commerce_project/view/screens/home/main_home_screen.dart';
import 'package:e_commerce_project/view/screens/home/home_screen.dart';
import 'package:e_commerce_project/view/screens/localization/Language.dart';
import 'package:e_commerce_project/view/screens/others/product_details.dart';
import 'package:e_commerce_project/view/screens/settings/address/add_address.dart';
import 'package:e_commerce_project/view/screens/settings/address/view_address.dart';
import 'package:flutter/material.dart';

import '../view/screens/settings/address/locate_adderss_in_map.dart';

Map<String, Widget Function(BuildContext)> AppRoute = {
  AppRouteName.sign_in: (context) => const SignInScreen(),
  AppRouteName.sign_up: (context) => const SignUpScreen(),
  AppRouteName.forget_password: (context) => const ForgetPasswordScreen(),
  AppRouteName.verify_code_forget_pass: (context) => VerifyCodeScreen(),
  AppRouteName.reset_password: (context) => const ResetPasswordScreen(),
  AppRouteName.successSignUp: (context) => const SuccessSignUpScreen(),
  AppRouteName.successResetPassword: (context) =>
      const SuccessResetPasswordScreen(),
// AppRouteName.check_email :(context)=> const CheckEmailScreen(),
  AppRouteName.verify_code_sign_up: (context) => VerifyCodeSignUpScreen(),
  AppRouteName.choose_language: (context) => const Language(),
  AppRouteName.home: (context) => const main_home_screen(),
  AppRouteName.items: (context) => const ItemsScreen(),
  AppRouteName.product_details: (context) => const ProductDetails(),
  AppRouteName.search: (context) => const Search_Screen(),
  AppRouteName.address: (context) => const AddressScreen(),
  AppRouteName.new_address: (context) => const Add_Address(),
  AppRouteName.locate_map: (context) => const MapSample(),
};
