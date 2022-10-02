import 'package:e_commerce_project/core/constant/app_routes_name.dart';
import 'package:e_commerce_project/routes/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController {
  sign_in();

  go_to_sign_up();
  go_to_forget_password();
}

class SignInControllerImp extends SignInController {
  TextEditingController text_field_email_controller = TextEditingController();
  TextEditingController text_field_password_controller =
      TextEditingController();

  @override
  void dispose() {
    text_field_email_controller.dispose();
    text_field_password_controller.dispose();

    super.dispose();
  }

  @override
  sign_in() {
    // TODO: implement sign_in
    // throw UnimplementedError();
  }

  @override
  go_to_sign_up() {
    // TODO: implement go_to_sign_up
    Get.offAndToNamed(AppRouteName.sign_up);
    // throw UnimplementedError();
  }

  @override
  go_to_forget_password() {
    Get.toNamed(AppRouteName.forget_password);
    // TODO: implement go_to_forget_password
    // throw UnimplementedError();
  }
}
