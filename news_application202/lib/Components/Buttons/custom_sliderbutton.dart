import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application202/Utilities/app_colors.dart';
import 'package:slider_button/slider_button.dart';

class CustomSliderButton extends StatelessWidget {
  const CustomSliderButton(
      {Key? key, required this.label, required this.action})
      : super(key: key);
  final String label;
  final Function action;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SliderButton(
        width: Get.width / 1.2,
        action: action,
        baseColor: Colors.white,
        highlightedColor: AppColors.colorOfCinder,
        buttonColor: AppColors.colorOfCinder,
        alignLabel: Alignment.center,
        radius: 25,
        backgroundColor: AppColors.colorOfWhiteShadow,
        label: Text(
          label,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        icon: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
