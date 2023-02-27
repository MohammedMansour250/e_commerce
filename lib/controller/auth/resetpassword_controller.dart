import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce_project/core/class/crud.dart';
import 'package:e_commerce_project/core/constant/AppLinkData.dart';
import 'package:e_commerce_project/core/constant/app_routes_name.dart';
import 'package:e_commerce_project/core/functions/statusRequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  reset_password(BuildContext context);

  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  // ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  // StatusRequest statusRequest = StatusRequest.none ;

  late TextEditingController password;
  late TextEditingController re_password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.init;

  @override
  reset_password(context) async {
    if (password.text == re_password.text) {
      try {
        await Crud().postData(AppLinkData.reset_password, {
          'email': Get.arguments['email'],
          'pass': password.text,
          'reset_pass': re_password.text,
        }).then((value) {
          value.fold((l) {
            statusRequest = l;
          }, (r) {
            print(r['status']);
            Get.offNamed(AppRouteName.successResetPassword);

          });
        });
      } catch (e) {
        print(e);

        statusRequest = StatusRequest.failure;
        update();

        AwesomeDialog(
                context: context,
                title: 'Error',
                body: Text('The Password Cannot Be Change'))
            .show();
        statusRequest = StatusRequest.init;
      }
    } else {
      re_password.text = '';
      AwesomeDialog(
        context: context,
        body: Text('Unequal Password'),
      ).show();
      update();
    }
    update();
  }

  @override
  goToSuccessResetPassword() async {
    Get.offNamed(AppRouteName.successResetPassword);
  }

  @override
  void onInit() {
    password = TextEditingController();
    re_password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    re_password.dispose();
    super.dispose();
  }
}
