import 'package:e_commerce_project/controller/auth/sign_in_controller.dart';
import 'package:e_commerce_project/core/constant/image_assets.dart';
import 'package:e_commerce_project/core/services/services.dart';
import 'package:e_commerce_project/view/screens/localization/localization_controller.dart';
import 'package:e_commerce_project/view/widgets/auth/app_text_field.dart';
import 'package:e_commerce_project/view/widgets/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignInControllerImp controllerImp = Get.put(SignInControllerImp());

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
          "Sign In",
          style: Theme.of(context).textTheme.headline1!.copyWith(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Image.asset(
              ImageAssets.logo,
              width: Get.width - 200,
              height: Get.width - 200,
            ),
            Text(
              'welcome_back'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    letterSpacing: 2,
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Text(
                'un_welcome'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    // fontSize: 25,
                    ),
              ),
            ),
            spaca(60, 0),
            AppTextField(
              labal: 'Email',
              hintText: 'Enter Your Email',
              icon: Icons.email_outlined,
              controller: controllerImp.text_field_email_controller,
              context: context,
            ),
            // spaca(20, 0),

            spaca(20, 0),
            AppTextField(
              labal: 'Password',
              hintText: 'Enter Your Password',
              icon: Icons.lock_outlined,
              controller: controllerImp.text_field_password_controller,
              context: context,
            ),

            spaca(10, 0),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: InkWell(
                onTap: () {
                  controllerImp.go_to_forget_password();
                },
                child: Text(
                  'Forget Password ?',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14,
                      ),
                ),
              ),
            ),
            spaca(10, 0),

            Custom_Button_Auth(txt: 'Sign In', onPressed: () {}),

            spaca(30, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont hava an account ?  '),
                InkWell(
                  onTap: () {
                    controllerImp.go_to_sign_up();
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// محمد صيام
// يا امتي النوم طال
