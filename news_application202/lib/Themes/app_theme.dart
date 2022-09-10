import 'package:flutter/material.dart';
import 'package:news_application202/Utilities/app_colors.dart';

class AppTheme {
  final myTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
    iconTheme: IconThemeData(color: AppColors.colorOfCinder),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.colorOfCinder),
            foregroundColor: MaterialStateProperty.all(AppColors.colorOfGrey))),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: AppColors.colorOfCinder,
        fontWeight: FontWeight.w100,
        fontSize: 20,
        fontFamily: "Oswalds",
      ),
      bodyText2: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: AppColors.colorOfCinder,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: "Oswalds",
      ),
    ),
  );
}
