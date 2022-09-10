import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application202/Components/TextFormFields/custom_textformfield.dart';
import 'package:news_application202/Constants/texts.dart';
import 'package:news_application202/Screens/Launcher/controller/launcher_controller.dart';
import 'package:news_application202/Utilities/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.find<LauncherController>().isDrawerOpen.value = true;
        },
        icon: Icon(Icons.menu, color: AppColors.colorOfCinder),
      ),
      actions: [
        IconButton(
          icon:  const Icon(Icons.search),
          color: AppColors.colorOfCinder,
          onPressed: () {
            showDialog(
              barrierColor: Colors.transparent,
              context: context,
              builder: (context) =>  Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: const EdgeInsets.all(10),
                child: CustomTextFormField(labelText: "search news keywords"),
              ),
            );
          },
        ),
      ],
      title: Text(
        AppTexts.textOfAppBarTitle,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      elevation: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
