import 'package:e_commerce_project/core/localization/translation.dart';import 'package:e_commerce_project/controller/localization/localization_controller.dart';import 'package:flutter/material.dart';import 'package:get/get.dart';import 'package:get/get_core/src/get_main.dart';class Language extends StatelessWidget {  const Language({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    LocaleController controller = Get.put(LocaleController());    return Scaffold(      body: Container(        padding: EdgeInsets.all(15),        child: Column(          mainAxisAlignment: MainAxisAlignment.center,          children: [            Text('hello'.tr),            Container(              padding: EdgeInsets.symmetric(horizontal: 100),              width: double.infinity,              color: Colors.purpleAccent,              child: MaterialButton(                color: Colors.white,                onPressed: ()                {                  // controller.changeLang('ar');                },                child: Text('Ar'),              ),            ),            SizedBox(              height: 20,            ),            Container(              padding: EdgeInsets.symmetric(horizontal: 100),              width: double.infinity,              color: Colors.purpleAccent,              child: MaterialButton(                color: Colors.white,                onPressed: ()                {                  // controller.changeLang('en');                },                child: Text('En'),              ),            ),          ],        ),      ),    );  }}