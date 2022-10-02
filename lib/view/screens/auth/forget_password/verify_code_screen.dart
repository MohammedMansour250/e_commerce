import 'package:e_commerce_project/controller/auth/forget_password_controller.dart';
import 'package:e_commerce_project/controller/auth/verify_code_controller.dart';
import 'package:e_commerce_project/view/widgets/auth/app_text_field.dart';
import 'package:e_commerce_project/view/widgets/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controllerImp = Get.put(VerifyCodeControllerImp());

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
          "Verification Code",
          style: Theme.of(context).textTheme.headline1!.copyWith(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Center(
          child: ListView(
            children: [
              spaca(Get.height / 4, 0),
              Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  "Check Code",
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              spaca(30, 0),

              OtpTextField(
                numberOfFields: 5,
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controllerImp.go_to_reset_password();
                }, // end onSubmit
              ),
              // AppTextField(
              //   labal: 'Code',
              //   hintText: 'Enter Your Code',
              //   icon: Icons.email_outlined,
              //   controller: controllerImp.text_field_email_controller,
              //   context: context,
              // ),
              spaca(20, 0),
              Custom_Button_Auth(txt: 'Check Code', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
// محمد صيام
// يا امتي النوم طال
