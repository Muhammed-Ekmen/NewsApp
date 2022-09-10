import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_application202/Constants/paths.dart';
import 'package:news_application202/Routes/routes.dart';
import 'package:news_application202/Screens/Error/view/error_page.dart';
import 'package:news_application202/Themes/app_theme.dart';
import 'package:news_application202/Utilities/app_durations.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  ErrorWidget.builder = (details) => const ErrorPage();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: [
  //   SystemUiOverlay.bottom,
  // ]);
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      transitionDuration: durationOfVeryLow,
      defaultTransition: Transition.fadeIn,
      getPages: getPages,
      theme: AppTheme().myTheme,
      initialRoute: pathOfLoginPage,
      unknownRoute: GetPage(
        name: pathOfErrorPage,
        page: () => const ErrorPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


// NE OGRENDIM

// Rx<ModelOfNews> ile list,string,bool disinda rx model yapma
// ListViewBuilder ile column gibi end ozelliginin kullanarak asagidan baslatma BackgroundDrawer