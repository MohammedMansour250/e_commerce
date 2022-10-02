import 'package:e_commerce_project/controller/auth/forget_password_controller.dart';
import 'package:e_commerce_project/core/constant/app_routes_name.dart';
import 'package:e_commerce_project/view/screens/auth/check_email_screen.dart';
import 'package:e_commerce_project/view/screens/auth/forget_password/forget_password_screen.dart';
import 'package:e_commerce_project/view/screens/auth/forget_password/reset_password.dart';
import 'package:e_commerce_project/view/screens/auth/sign_in.dart';
import 'package:e_commerce_project/view/screens/auth/sign_up.dart';
import 'package:e_commerce_project/view/screens/auth/forget_password/success_reset_password.dart';
import 'package:e_commerce_project/view/screens/auth/success_sign_up_screen.dart';
import 'package:e_commerce_project/view/screens/auth/forget_password/verify_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Map<String, Widget Function(BuildContext)> AppRoute = {
  AppRouteName.sign_in: (context) => const SignInScreen(),
  AppRouteName.sign_up: (context) => const SignUpScreen(),
  AppRouteName.forget_password: (context) => const ForgetPasswordScreen(),
  AppRouteName.verify_code: (context) => const VerifyCodeScreen(),
  AppRouteName.reset_password: (context) => const ResetPasswordScreen(),
  AppRouteName.successSignUp: (context) => const SuccessSignUpScreen(),
  AppRouteName.successResetPassword: (context) => const SuccessResetPasswordScreen(),
AppRouteName.check_email :(context)=> const CheckEmailScreen(),

};
