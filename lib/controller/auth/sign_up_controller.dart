import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce_project/controller/test_controller.dart';
import 'package:e_commerce_project/core/class/crud.dart';
import 'package:e_commerce_project/core/constant/app_routes_name.dart';
import 'package:e_commerce_project/core/functions/statusRequest.dart';
import 'package:e_commerce_project/data/data_source/remote/test_data.dart';
import 'package:e_commerce_project/flutter_with_php/auth/sign_up.dart';
import 'package:e_commerce_project/view/screens/auth/verify_code_sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/data_source/remote/auth/sign_up.dart';

abstract class SignUpController extends GetxController {
  sign_up(BuildContext context);

  back_to_sign_in();

  go_to_verify(context);
}

class SignUpControllerImp extends SignUpController {
  TextEditingController text_field_email_controller = TextEditingController();
  TextEditingController text_field_password_controller =
      TextEditingController();
  TextEditingController text_field_phone_controller = TextEditingController();
  TextEditingController text_field_Name_controller = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  // signup() {
  //   var formdate = formState.currentState;
  //   if (formdate!.validate()) {
  //     go_to_verify();
  //   } else {
  //     print('not valid');
  //   }
  //
  //   // TODO: implement signup
  //   // throw UnimplementedError();
  // }

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
    Get.offNamed(AppRouteName.sign_in);
    // throw UnimplementedError();
  }

  @override
  go_to_verify(context) {
  }
  late StatusRequest? statusRequest = StatusRequest.init;

  SignUpData signUpData = SignUpData(Crud());

  print_field() {
    print('&&&&&&&&&&&&&&&&&&');
    print(text_field_email_controller.text);
    print(text_field_password_controller.text);
    print(text_field_phone_controller.text);
    print(text_field_Name_controller.text);
    print('&&&&&&&&&&&&&&&&&&');
  }

  sign_up(context) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signUpData.postDataSignUp(
      user_email: text_field_email_controller.text,
      password: text_field_password_controller.text,
      phone: text_field_phone_controller.text,
      user_name: text_field_Name_controller.text,
    );

    // response => left (StatusRequest) or right (Map)
    // right = StatusRequest.success
    // if statusRequest != StatusRequest.success => Error (loading, failure, failureServer, offline)

    statusRequest = handlingData(response);
    //handling => لتحديد نوع status

    print(response['status']);
    // if (response['status'] == '') {}

    if (response['status'] == 'success') {
      Get.offNamed(AppRouteName.verify_code_sign_up, arguments: {
        'email': '${text_field_email_controller.text}',
      });

      statusRequest = StatusRequest.success;
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => VerifyCodeSignUpScreen(),
      //     ));
    } else {
      // if (response['reason'] == '' ){}

      statusRequest = StatusRequest.failure;

      AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          title: 'الايميل او رقم الهاتف مستخدم',
          autoHide: Duration(
            seconds: 2,
          )).show();
      statusRequest = StatusRequest.init;
    }

    update();
  }

// @override
// void onInit() {
//
//   super.onInit();
// }
}
