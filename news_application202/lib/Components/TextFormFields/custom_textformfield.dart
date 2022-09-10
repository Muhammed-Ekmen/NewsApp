import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application202/Screens/Login/controllers/login_controller.dart';
import 'package:news_application202/Utilities/app_borderradius.dart';
import 'package:news_application202/Utilities/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.labelText,
    this.controller,
  }) : super(key: key);
  final String? labelText;
  final TextEditingController? controller;
  final LoginController _controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: TextFormField(
          obscuringCharacter: "#",
          keyboardAppearance: Brightness.dark,
          obscureText: _controller.passwordSeemStatue.value,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: AppColors.colorOfCinder,
          decoration: _inputDecoration(context),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(BuildContext context) {
    // BorderVariable
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: appBorderRadius,
      borderSide: BorderSide(color: AppColors.colorOfCinder, width: 1),
    );
    return InputDecoration(
      errorStyle: Theme.of(context)
          .textTheme
          .bodyText1
          ?.copyWith(color: Colors.red, fontSize: 14),
      suffixIcon: _detectIcon(labelText),
      hintText: labelText,
      hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      filled: true,
      fillColor: AppColors.colorOfMercury,
      errorBorder: outlineInputBorder,
      focusedErrorBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
    );
  }

  _detectIcon(String? label) {
    switch (label) {
      case "Email":
        return Icon(Icons.email, color: AppColors.astral);
      case "Password":
        return IconButton(
          onPressed: () {
            _controller.changePasswordStatue();
          },
          icon: _controller.passwordSeemStatue.value == true
              ? Icon(
                  Icons.key,
                  color: AppColors.astral,
                )
              : Icon(
                  Icons.key_off,
                  color: AppColors.astral,
                ),
        );
      case "search news keywords":
        return Icon(
          Icons.search,
          color: AppColors.astral,
        );
      default:
        return const Icon(
          Icons.error,
          color: Colors.red,
        );
    }
  }
}
