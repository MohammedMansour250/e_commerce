import 'package:e_commerce_project/controller/cart/CartController.dart';
import 'package:e_commerce_project/controller/items/favorite.dart';
import 'package:e_commerce_project/core/class/crud.dart';
import 'package:e_commerce_project/core/localization/translation.dart';
import 'package:e_commerce_project/core/services/services.dart';
import 'package:e_commerce_project/core/theme/theme.dart';
import 'package:e_commerce_project/data/data_source/remote/items.dart';
import 'package:e_commerce_project/data/data_source/static/static.dart';
import 'package:e_commerce_project/flutter_with_php/shared_pref.dart';
import 'package:e_commerce_project/routes/route_app.dart';
import 'package:e_commerce_project/sqflite_test/home_screen_sqflite.dart';
import 'package:e_commerce_project/view/screens/auth/sign_in.dart';
import 'package:e_commerce_project/controller/localization/localization_controller.dart';
import 'package:e_commerce_project/view/screens/on_boarding/on_boarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
import 'controller/sqflite/sqflite_database.dart';
import 'view/screens/home/main_home_screen.dart';
import 'view/screens/settings/address/locate_adderss_in_map.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialServices();
  await MyServices().init();
  await SharedPref.init();
  MyServices services = Get.find();
  Widget first_screen = SignInScreen();
  //
  String? is_show =
      services.sharedPreferences.getString('is_show_onBoarding') ?? 'false';
  print('is_show : ' + is_show.toString());
  String? is_login = services.sharedPreferences.getString('email') ?? 'null';

  user_id = services.sharedPreferences.getString('user_id') ?? 'null';
  print('user_id : ' + user_id.toString());

  FavoriteController favoriteController = Get.put(FavoriteController());
  await favoriteController.get_Favorites();
  print('%%%%%%%%%%%%%%%%');
  await SqfliteData.initSqflite();

  await SqfliteData.getData();
  id_item_added_to_cart = [];

  CartList.forEach((element) {
    id_item_added_to_cart.add(element['id_item'].toString());
  });


// try{
//
//   var response = await  http.post(Uri.parse('http://10.0.2.2:8080/e_commerce/address/view_address.php'),body: {
//     'user_id':'15',
//     // 'address_name':'hello',
//     // 'street':'mansora',
//     // 'city':'gaza',
//     // 'lat':'5',
//     // 'long':'5',
//   }).then((value)  {
//     print(value.body);
//
//     return value ;
//   } );
//   print('response.body');
//   print(response.body);
//
//
// }
// catch(e){
//   print('ERRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR : '+e.toString()+' : ERRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR');
//
// }





  printing();
  if (is_show == 'true') {
    if (is_login != 'null') {
      first_screen = main_home_screen();
    } else {
      first_screen = SignInScreen();
    }
  } else {
    first_screen = OnBoardingScreens();
  }

  runApp(MyApp(first_screen));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  Widget first_widget;

  MyApp(this.first_widget); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      theme: AppTheme.get_theme(),
      debugShowCheckedModeBanner: false,
      // home: first_widget,

      home: first_widget,
      routes: AppRoute,
    );
  }
}

void printing() {
  MyServices services = Get.find();

  try {
    print(services.sharedPreferences.getString('email') ?? 'Nothing');
    print(services.sharedPreferences.getString('name') ?? 'Nothing');
    print(services.sharedPreferences.getString('password') ?? 'Nothing');
    print(services.sharedPreferences.getString('phone') ?? 'Nothing');
    print(services.sharedPreferences.getString('approve') ?? 'Nothing');
    print(services.sharedPreferences.getString('user_create') ?? 'Nothing');
    print(services.sharedPreferences.getString('user_id') ?? 'Nothing');
  } catch (e) {
    print('Nothing User');
  }
}

// void main ()
// {
//   runApp(MaterialApp(home: Scaffold(
//
//   ),)) ;
// }
