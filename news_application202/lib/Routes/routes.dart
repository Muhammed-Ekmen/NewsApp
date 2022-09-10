import 'package:get/get.dart';
import 'package:news_application202/Constants/paths.dart';
import 'package:news_application202/Screens/Launcher/view/launcher.dart';
import 'package:news_application202/Screens/Login/view/loginpage.dart';
import 'package:news_application202/Screens/Lounge/view/lounge.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: pathOfLoginPage, page: () => LoginPage()),
  GetPage(name: pathOfLoungePage, page: () => const Lounge()),
  GetPage(name: pathOfLauncherPage, page: () =>  LauncherPage(countryCode: Get.arguments,))
];
