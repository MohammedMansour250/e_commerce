import 'package:e_commerce_project/controller/on_boarding_controller/on_boarding_controller.dart';
import 'package:e_commerce_project/data/data_source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_Page_View_OnBoarding extends GetView<OnBoardingControllerImp> {
  const Custom_Page_View_OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (i) {
        controller.onPageChanged(i);
      },
      itemCount: onBoardingList.length,
      itemBuilder: ((context, index) {
        return Column(
          children: [
            Text(
              onBoardingList[index].title!,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 100,
            ),
            Image.asset(
              onBoardingList[index].image!,
              fit: BoxFit.cover,
              width: Get.width - 50,
              height: Get.width - 50,
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                onBoardingList[index].body!,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        );
      }),
    );
  }
}
//

class Custom_Dot_Controller_OnBoarding extends StatelessWidget {
  const Custom_Dot_Controller_OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      assignId: true,
      init: OnBoardingControllerImp(),
      builder: (logic) {
        return Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(

              onBoardingList.length,
              (index) => AnimatedContainer(
                margin: EdgeInsets.only(right: 5),
                duration: Duration(milliseconds: 500),
                width: index == logic.currentPage ? 25 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: index == logic.currentPage
                      ? Color.fromARGB(255, 12, 62, 148)
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class Custom_Button_OnBoarding extends GetView<OnBoardingControllerImp> {
  const Custom_Button_OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
        // clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.symmetric(
          horizontal: 100,
          vertical: 0,
        ),
        onPressed: () {
          controller.next();
        },
        textColor: Colors.white,
        color: Colors.deepOrangeAccent,
        child: Text('Continue'),
      ),
    );
  }
}