import 'package:e_commerce_project/core/constant/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();
  back_to_sign_in();
  go_to_check ();
}

class SignUpControllerImp extends SignUpController {
  TextEditingController text_field_email_controller = TextEditingController();
  TextEditingController text_field_password_controller =
      TextEditingController();
  TextEditingController text_field_phone_controller = TextEditingController();
  TextEditingController text_field_Name_controller = TextEditingController();

  @override
  signup() {
    // TODO: implement signup
    // throw UnimplementedError();
  }

  @override
  void dispose() {
    text_field_Name_controller.dispose();
    text_field_email_controller.dispose();
    text_field_password_controller.dispose();
    text_field_phone_controller.dispose();

    super.dispose();
  }

  @override
  back_to_sign_in() {
    // TODO: implement back_to_sign_in
    Get.toNamed(AppRouteName.sign_in);
    // throw UnimplementedError();
  }

  @override
  go_to_check() {
    // TODO: implement go_to_check


    Get.offNamed(AppRouteName.check_email);

    // throw UnimplementedError();
  }
}
