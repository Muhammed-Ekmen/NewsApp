import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application202/Constants/paths.dart';
import 'package:news_application202/Constants/texts.dart';
import 'package:news_application202/Screens/Login/model/model_user.dart';
import 'package:news_application202/Helper/SharedManager/shared_manager.dart';
import 'package:news_application202/Utilities/app_colors.dart';
import 'package:news_application202/Utilities/app_durations.dart';

class LoginController extends GetxController {
  @override
  void onClose() {
    disposeAllController();
    super.onClose();
  }

  //email created
  final GetStorageManager _getStorageManager = GetStorageManager();

  //create User
  createUser() {
    final model = ModelOfUser(
        email: emailController.text, password: passwordController.text);
    _getStorageManager
        .saveUser(key: GetStorageKey.user, userModel: model)
        .whenComplete(() {
      clearAllController();
      Get.back();
    });
  }

  //password Statue
  RxBool passwordSeemStatue = true.obs;
  changePasswordStatue() {
    passwordSeemStatue.value = !passwordSeemStatue.value;
  }

  // textFormFields Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  clearAllController() {
    emailController.clear();
    passwordController.clear();
  }

  disposeAllController() {
    emailController.dispose();
    passwordController.dispose();
  }

  // Form key
  final loginFormKey = GlobalKey<FormState>();

  //LogIn Button Checker
  logInChecker() {
    ModelOfUser? user = _getStorageManager.getUser(key: GetStorageKey.user);
    debugPrint("***** ${user?.email}");
    if (loginFormKey.currentState!.validate() == true) {
      if (user != null) {
        user.email == emailController.text &&
                user.password == passwordController.text
            ? Get.offAndToNamed(pathOfLoungePage)
            : {
                Get.snackbar(
                  borderWidth: 3,
                  borderColor: AppColors.colorOfCinder,
                  animationDuration: durationOfVeryLow,
                  icon: Icon(
                    Icons.person,
                    color: AppColors.colorOfCinder,
                  ),
                  AppTexts.textOfSnackBarTitle,
                  AppTexts.textOfSnackBarMessage,
                  backgroundColor: AppColors.colorOfThatch,
                ),
                clearAllController()
              };
      } else {
        Get.dialog(CupertinoAlertDialog(
          title: const Text("No User Found,Please Register First."),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text("Back"),
              ),
            ),
          ],
        ));
      }
    }
  }
}
