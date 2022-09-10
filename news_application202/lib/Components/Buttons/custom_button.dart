import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application202/Utilities/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.color,
    required this.text,
    required this.onPressed,
    this.widht,
  }) : super(key: key);
  final Color? color;
  final String text;
  final double? widht;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 20,
      width: widht ?? Get.width / 4,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states == MaterialState.pressed) {
            return color ?? AppColors.colorOfMercury;
          } else {
            return color ?? AppColors.astral;
          }
        })),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: AppColors.colorOfGrey,
                fontSize: 12,
              ),
        ),
      ),
    );
  }
}
