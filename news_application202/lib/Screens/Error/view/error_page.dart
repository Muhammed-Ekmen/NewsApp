import 'package:flutter/material.dart';
import 'package:news_application202/Constants/texts.dart';
import 'package:news_application202/Utilities/app_colors.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: AppColors.colorOfRedRibbon,
              size: 128,
            ),
            Text(AppTexts.textOfErrorPageMessage)
          ],
        ),
      ),
    );
  }
}
