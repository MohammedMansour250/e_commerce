import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce_project/core/class/crud.dart';
import 'package:e_commerce_project/core/constant/app_routes_name.dart';
import 'package:e_commerce_project/core/functions/statusRequest.dart';
import 'package:e_commerce_project/data/data_source/remote/auth/check_email_to_reset_pass.dart';
import 'package:e_commerce_project/routes/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  check_email(BuildContext context);
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  TextEditingController text_field_email_controller = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void dispose() {
    text_field_email_controller.dispose();

    super.dispose();
  }

  CheckEmail checkEmail = CheckEmail(Crud());
  StatusRequest statusRequest = StatusRequest.init;

  @override
  check_email(context) async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      await checkEmail
          .postCheckEmail(user_email: '${text_field_email_controller.text}')
          .then((x) {
        if (x['status'] == 'success') {
          statusRequest = StatusRequest.success;
          update();
          Get.offAllNamed(AppRouteName.verify_code_forget_pass, arguments: {
            'email': text_field_email_controller.text,
          });
        } else if (x['status'] == 'fail') {
          text_field_email_controller.text = '';
          AwesomeDialog(context: context, body: Text('Email Error')).show();
          statusRequest = StatusRequest.init;

          update();
        }
      });
    } catch (e) {
      print(e);
      statusRequest = StatusRequest.failure;
      AwesomeDialog(context: context, body: Text('Try Again'), title: 'Error')
          .show();
      text_field_email_controller.text = '';
      statusRequest = StatusRequest.init;
    }
    update();
  }
}
