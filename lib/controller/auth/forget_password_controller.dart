import 'package:e_commerce_project/core/constant/app_routes_name.dart';
import 'package:e_commerce_project/routes/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  sign_in();
check_email();
  go_to_success_reset_pass();

}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  TextEditingController text_field_email_controller = TextEditingController();


  @override
  void dispose() {
    text_field_email_controller.dispose();

    super.dispose();
  }

  @override
  sign_in() {
    // TODO: implement sign_in
    // throw UnimplementedError();
  }

  @override
  go_to_success_reset_pass() {
    // TODO: implement go_to_sign_up
    Get.offAndToNamed(AppRouteName.successResetPassword);
    // throw UnimplementedError();
  }

  @override
  check_email() {
    // TODO: implement check_email
    throw UnimplementedError();
  }


}
