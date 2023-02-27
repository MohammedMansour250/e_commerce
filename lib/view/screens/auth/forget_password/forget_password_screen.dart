import 'dart:math';

import 'package:e_commerce_project/controller/auth/check_email_controller.dart';
import 'package:e_commerce_project/controller/auth/forget_password_controller.dart';
import 'package:e_commerce_project/core/functions/statusRequest.dart';
import 'package:e_commerce_project/view/widgets/auth/app_text_field.dart';
import 'package:e_commerce_project/view/widgets/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_project/core/functions/valide.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controllerImp =
        Get.put(ForgetPasswordControllerImp());

    return Scaffold(
      // backgroundColor: Color(0xFFF5F7FBFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F7FBFF),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.language,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          "Forget Password",
          style: Theme.of(context).textTheme.headline1!.copyWith(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        init: ForgetPasswordControllerImp(),
        // assignId: true,
        builder: (logic) {
          if (logic.statusRequest == StatusRequest.init ||
              logic.statusRequest == StatusRequest.success) {
            return Center(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Card(
                  child: Form(
                    key: controllerImp.formState,
                    child: ListView(
                      children: [
                        space(Get.height / 4, 0),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            "Check Email",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        space(30, 0),
                        AppTextField(
                          label: 'Email',
                          hintText: 'Enter Your Email',
                          icon: Icons.email_outlined,
                          controller: controllerImp.text_field_email_controller,
                          context: context,
                          valid: (val) {
                            if (val!.isEmpty) {
                              return validInput(val, 6, 100, 'email');
                            }
                            return null;
                          },
                        ),
                        space(20, 0),
                        Custom_Button_Auth(
                            txt: 'Check',
                            onPressed: () {
                              if (controllerImp.formState.currentState!
                                  .validate()) {
                                controllerImp.check_email(context);
                              }
                            }),
                        space(30, 0),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (logic.statusRequest == StatusRequest.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (logic.statusRequest == StatusRequest.failure) {
            return Center(
              child: Text('Try Again'),
            );
          } else {
            return Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }
}
// محمد صيام
// يا امتي النوم طال
