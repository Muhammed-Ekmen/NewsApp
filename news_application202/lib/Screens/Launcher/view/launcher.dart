import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application202/Components/appbar/custom_appbar.dart';
import 'package:news_application202/Screens/BackgroundDrawer/view/background_drawer.dart';
import 'package:news_application202/Screens/Launcher/controller/launcher_controller.dart';
import 'package:news_application202/Screens/Launcher/tabs/Home/home_tab.dart';
import 'package:news_application202/Screens/Launcher/tabs/Profile/profile_tab.dart';
import 'package:news_application202/Screens/Launcher/tabs/Saved/saved_tab.dart';
import 'package:news_application202/Utilities/app_borderradius.dart';
import 'package:news_application202/Utilities/app_colors.dart';
import 'package:news_application202/Utilities/image/app_flags_svg.dart';

class LauncherPage extends StatelessWidget {
  LauncherPage({Key? key, required this.countryCode}) : super(key: key);
  final FlagsImage countryCode;
  final LauncherController _launcherController = Get.put(LauncherController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: 3,
        child: Stack(
          children: [
            const BackGroundDrawer(),
            GestureDetector(
              onPanEnd: (details) =>
                  _launcherController.isDrawerOpen.value = false,
              child: AnimatedContainer(
                transform: Matrix4.translationValues(
                  0,
                  0,
                  0,
                )
                  ..scale(_launcherController.isDrawerOpen.value ? 0.85 : 1.00)
                  ..rotateZ(_launcherController.isDrawerOpen.value ? 100 : 0),
                duration: const Duration(milliseconds: 500),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(-20, 20),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: _launcherController.isDrawerOpen.value == true
                      ? appBorderRadius
                      : BorderRadius.zero,
                  child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    backgroundColor: Colors.white,
                    appBar: const CustomAppBar(),
                    body: TabBarView(
                      physics: _launcherController.isDrawerOpen.value == true
                          ? const NeverScrollableScrollPhysics()
                          : null,
                      children: [
                        HomeTab(),
                        const SavedTab(),
                        const ProfileTab(),
                      ],
                    ),
                    bottomSheet: TabBar(
                      indicatorColor: Colors.transparent,
                      labelColor: AppColors.colorOfCinder,
                      unselectedLabelColor: AppColors.colorOfWhiteShadow,
                      tabs: Tabs.values
                          .map((e) => createTab(describeEnum(e)))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Tab createTab(String name) {
    Icon? icon;
    switch (name) {
      case "home":
        icon = const Icon(Icons.home);
        break;
      case "saved":
        icon = const Icon(Icons.bookmark_border);
        break;
      case "profile":
        icon = const Icon(Icons.person_pin);
        break;
      default:
        icon = const Icon(Icons.apple);
    }
    return Tab(
      icon: icon,
      height: Get.height / 12,
      child: Text(name.toString()),
    );
  }
}

enum Tabs { home, saved, profile }
