import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application202/Components/Buttons/custom_button.dart';
import 'package:news_application202/Components/TextFormFields/custom_textformfield.dart';
import 'package:news_application202/Constants/texts.dart';
import 'package:news_application202/Helper/GoogleSignInManager/singin_manager.dart';
import 'package:news_application202/Screens/Login/controllers/login_controller.dart';
import 'package:news_application202/Utilities/app_colors.dart';
import 'package:news_application202/Utilities/image/app_image_asset.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final LoginController _controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _controller.loginFormKey,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  //Image
                  Expanded(
                    flex: 1,
                    child: ImageName.newsWriting.toWidget(),
                  ),
                  //Image
                  Expanded(
                    flex: 3,
                    child: ImageName.newsBackground.toWidget(),
                  ),
                  // Title
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Keep trends in your pocket",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(fontSize: 36),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet,consetetur sadipscing elitr, sed diam nonumy eirmod tempor.",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //TExtForms and Button
                  Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            labelText: AppTexts.textOfFormFieldEmailLabel,
                          ),
                          CustomTextFormField(
                            labelText: AppTexts.textOfFormFieldPasswordLabel,
                          ),
                          CustomButton(
                            widht: Get.width,
                            text: "Get Start",
                            onPressed: () => _controller.logInChecker(),
                          ),
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Email And Password TextFormField && LogInButton and Google Icon Button in A Row
  _textFieldsAndButton() {
    return Column(
      children: [
        // CustomEmailTextFormField(
        //   controller: _controller.emailController,
        //   labelText: AppTexts.textOfFormFieldEmailLabel,
        // ),
        // CustomPasswordTextFormField(
        //   obsecureText: _controller.passwordSeemStatue.value,
        //   controller: _controller.passwordController,
        //   labelText: AppTexts.textOfFormFieldPasswordLabel,
        //   suffixIcon: IconButton(
        //     onPressed: () {
        //       _controller.changePasswordStatue();
        //     },
        //     icon: _controller.passwordIcon(),
        //   ),
        // ),
        // //sing in and google logo button
        Row(
          children: [
            Expanded(
              flex: 7,
              child: CustomButton(
                text: AppTexts.textOfSingInButton,
                onPressed: () => _controller.logInChecker(),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () async {
                  await GoogleSingInManager.logIn();
                },
                child: ImageName.googleLogo.toWidget(
                  fileExtension: "png",
                  height: Get.height / 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // BottomCard "Don't you Have Account? Register?"
  _bottomCard(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: Get.width,
      height: Get.height / 15,
      decoration: BoxDecoration(
          color: AppColors.colorOfMercury,
          boxShadow: [
            BoxShadow(
              color: AppColors.colorOfCinder,
              offset: const Offset(-10, -10),
              blurRadius: 12,
            ),
          ],
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(50),
          )),
      child: TextButton(
        child: Text(AppTexts.textOfRegisterButton,
            style: Theme.of(context).textTheme.bodyText1),
        onPressed: () {
          _bottomCardShowModalBottomSheet(context);
        },
      ),
    );
  }

  // *BottomCard's ShowBottomModelSheet
  _bottomCardShowModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      constraints: BoxConstraints(
          maxHeight:
              Get.height / 2.8), // barrierColor: AppColors.colorOfMercury,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.colorOfCinder, width: 5),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(50),
        ),
      ),
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CustomEmailTextFormField(
          //     controller: _controller.createEmailController,
          //     labelText: AppTexts.textOfFormFieldEmailLabel),
          // CustomPasswordTextFormField(
          //     controller: _controller.createPasswordController,
          //     labelText: AppTexts.textOfFormFieldPasswordLabel,
          //     obsecureText: false),
          CustomButton(
            text: AppTexts.textOfCreateButton,
            onPressed: () {
              _controller.createUser();
            },
          )
        ],
      ),
    );
  }
}
