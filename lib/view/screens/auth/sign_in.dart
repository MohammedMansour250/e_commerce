
import 'package:e_commerce_project/controller/auth/sign_in_controller.dart';
import 'package:e_commerce_project/core/constant/image_assets.dart';
import 'package:e_commerce_project/core/functions/alert_exist_app.dart';
import 'package:e_commerce_project/core/functions/statusRequest.dart';
import 'package:e_commerce_project/core/functions/valide.dart';
import 'package:e_commerce_project/core/services/services.dart';
import 'package:e_commerce_project/controller/localization/localization_controller.dart';
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
      body:

      WillPopScope(
        child: GetBuilder<SignInControllerImp>(
          // initState: SignInControllerImp(),

          // init: SignInControllerImp(),
          // assignId: true,
          builder: (logic) {
            if (logic.statusRequest == StatusRequest.failure) {
              return Center(
                child: Text(
                  'Error',
                  style: TextStyle(fontSize: 23),
                ),
              );
            }

            if (logic.statusRequest == StatusRequest.init || logic.statusRequest == StatusRequest.success)
            {

                        ////////////////////////////////////////////////////////////

              return Container(
                padding: EdgeInsets.all(15),
                child: Form(
                  key: controllerImp.formState,
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
                      space(60, 0),
                      AppTextField(
                        label: 'Email',
                        hintText: 'Enter Your Email',
                        icon: Icons.email_outlined,
                        controller: controllerImp.text_field_email_controller,
                        context: context,
                        valid: (val) {
                          return validInput(val!, 5, 100, 'email');
                        },
                      ),
                      // spaca(20, 0),

                      space(20, 0),
                      AppTextField(
                        label: 'Password',
                        hintText: 'Enter Your Password',
                        obs_fun: () {
                          logic.change_obs();
                        },
                        is_avliabe: logic.obs,
                        icon: Icons.lock_outlined,
                        obs: logic.obs,
                        controller: logic.text_field_password_controller,
                        context: context,
                        valid: (val) {
                          return validInput(val!, 6, 100, 'password');
                        },
                      ),

                      space(10, 0),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: InkWell(
                          onTap: () {
                            controllerImp.go_to_forget_password();
                          },
                          child: Text(
                            'Forget Password ?',
                            style:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      space(10, 0),

                      Custom_Button_Auth(
                          txt: 'Sign In',
                          onPressed: () {
                            controllerImp.sign_in(context);
                          }),

                      space(30, 0),
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
              //////////////////////////////////////////////////////////////


            }

            else
            {
              return Center(child: Container(child: Text('Error'),));
            }

          },
        ),
        onWillPop: alertExitApp,
      ),
    );
  }
}
// محمد صيام
// يا امتي النوم طال
