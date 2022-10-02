import 'package:e_commerce_project/core/localization/translation.dart';
import 'package:e_commerce_project/core/services/services.dart';
import 'package:e_commerce_project/core/theme/theme.dart';
import 'package:e_commerce_project/routes/route_app.dart';
import 'package:e_commerce_project/view/screens/auth/sign_in.dart';
import 'package:e_commerce_project/view/screens/localization/Language.dart';
import 'package:e_commerce_project/view/screens/localization/localization_controller.dart';
import 'package:e_commerce_project/view/screens/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
      routes: AppRoute,
    );
  }
}
