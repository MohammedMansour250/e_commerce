import 'package:e_commerce_project/controller/auth/forget_password_controller.dart';
import 'package:e_commerce_project/view/widgets/auth/app_text_field.dart';
import 'package:e_commerce_project/view/widgets/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Card(

            child: ListView(
              children: [
                spaca(Get.height/4, 0),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "Check Email",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                spaca(30, 0),

                AppTextField(
                  labal: 'Email',
                  hintText: 'Enter Your Email',
                  icon: Icons.email_outlined,
                  controller: controllerImp.text_field_email_controller,
                  context: context,
                ),
                spaca(20, 0),
                Custom_Button_Auth(txt: 'Check', onPressed: ()
                {
                  controllerImp.go_to_success_reset_pass();
                }),
                spaca(30, 0),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
// ???????? ????????
// ???? ???????? ?????????? ??????
