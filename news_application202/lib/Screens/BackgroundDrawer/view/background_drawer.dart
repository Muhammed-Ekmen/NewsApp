import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application202/Components/Buttons/custom_button.dart';
import 'package:news_application202/Constants/texts.dart';
import 'package:news_application202/Helper/GoogleSignInManager/singin_manager.dart';
import 'package:news_application202/Utilities/app_colors.dart';

class BackGroundDrawer extends StatelessWidget {
  const BackGroundDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.colorOfMercury, AppColors.colorOfDarkThatch],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: AppTexts.listOfBackgroundButtons.length,
            itemBuilder: (context, index) {
              return CustomButton(
                widht: Get.width,
                text: AppTexts.listOfBackgroundButtons[index],
                onPressed: _detectAction(index),
              );
            },
          ),
        ),
      ),
    );
  }

  _detectAction(int index) {
    switch (index) {
      case 0:
        return () {};
      case 1:
        return () {};
      case 2:
        return () {
          GoogleSingInManager.logOut();
        };
      default:
        return () {};
    }
  }
}
