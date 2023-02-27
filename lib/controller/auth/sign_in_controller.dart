import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce_project/controller/test_controller.dart';
import 'package:e_commerce_project/core/class/crud.dart';
import 'package:e_commerce_project/core/constant/AppLinkData.dart';
import 'package:e_commerce_project/core/constant/app_routes_name.dart';
import 'package:e_commerce_project/core/functions/check_internet.dart';
import 'package:e_commerce_project/core/services/services.dart';
import 'package:e_commerce_project/data/data_source/remote/auth/sign_in.dart';
import 'package:e_commerce_project/flutter_with_php/shared_pref.dart';
import 'package:e_commerce_project/routes/route_app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/functions/statusRequest.dart';

abstract class SignInController extends GetxController {
  sign_in(BuildContext context);

  go_to_sign_up();

  go_to_forget_password();
}

class SignInControllerImp extends SignInController {
  TextEditingController text_field_email_controller = TextEditingController();
  TextEditingController text_field_password_controller =
      TextEditingController();

  bool obs = false;

  change_obs() {
    obs = !obs;
    update();
  }

  MyServices services = Get.find();

  // check() async {
  //   var x = await checkInternet();
  //   print(x.toString());
  // }

  @override
  void onInit() async {
    await FirebaseMessaging.instance.getToken().then((value) {
      print(value);
    });

    services.sharedPreferences.setString('is_show_onBoarding', 'true');
    super.onInit();
  }

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void dispose() {
    text_field_email_controller.dispose();
    text_field_password_controller.dispose();

    super.dispose();
  }

  SignInData signInData = SignInData(Crud());
  StatusRequest statusRequest = StatusRequest.init;

  // SharedPreferences? pref = SharedPref.shared();

  MyServices service = Get.put(MyServices());

  @override
  sign_in(context) async {
    // var formdate = formState.currentState;
    // if (formdate!.validate()) {
    // } else {
    //   print('not valid');
    // }

    statusRequest = StatusRequest.loading;
    update();
    var response = await signInData.postDataSignIn(
      user_email: text_field_email_controller.text,
      password: text_field_password_controller.text,
    );

    // response => left (StatusRequest) or right (Map)
    // right = StatusRequest.success
    // if statusRequest != StatusRequest.success => Error (loading, failure, failureServer, offline)

    statusRequest = handlingData(response);
    //handling => لتحديد نوع status

    print(response['status']);
    // if (response['status'] == '') {}

    if (response['status'] == 'success') {
      // Get.offNamed(AppRouteName.verify_code, arguments: {
      //   'email': '${text_field_email_controller.text}',
      // });

      statusRequest = StatusRequest.success;
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => VerifyCodeSignUpScreen(),
      //     ));

      await Crud().postData(
        AppLinkData.link_get_user_data,
        {
          'user_email': '${text_field_email_controller.text}',
        },
      ).then((value) async {
        value.fold((l) {
          print(l);
        }, (r) async {
          if (r['data'][0]['user_approve'] == 0) {
            Get.offNamed(AppRouteName.verify_code_sign_up, arguments: {
              'email': text_field_email_controller.text.toString(),
            });
          } else {
            print(r['data']);
            await service.sharedPreferences
                .setString('is_show_onBoarding', 'true');
            // print(r['data'][0]['user_email']);
            await service.sharedPreferences
                .setString('email', r['data'][0]['user_email'].toString());
            await service.sharedPreferences
                .setString('name', r['data'][0]['user_name'].toString());
            await service.sharedPreferences.setString(
                'password', r['data'][0]['users_password'].toString());
            await service.sharedPreferences
                .setString('phone', r['data'][0]['user_phone'].toString());
            await service.sharedPreferences
                .setString('approve', r['data'][0]['user_approve'].toString());
            await service.sharedPreferences.setString(
                'user_create', r['data'][0]['user_create'].toString());
            await service.sharedPreferences
                .setString('user_id', r['data'][0]['user_id'].toString());

            Get.offAllNamed(AppRouteName.home);
          }
        });
      });
    } else {
      // if (response['reason'] == '' ){}

      statusRequest = StatusRequest.failure;
      update();

    }
    statusRequest = StatusRequest.init;
    update();

    // throw UnimplementedError();
  }

  @override
  go_to_sign_up() {
    Get.offNamed(AppRouteName.sign_up);
    // throw UnimplementedError();
  }

  @override
  go_to_forget_password() {
    Get.toNamed(AppRouteName.forget_password);
    // throw UnimplementedError();
  }
}
