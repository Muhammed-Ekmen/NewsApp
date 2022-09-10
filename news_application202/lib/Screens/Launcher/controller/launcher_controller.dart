import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:news_application202/Constants/general_data.dart';
import 'package:news_application202/Models/model_of_news.dart';
import 'package:news_application202/Screens/Launcher/service/launcher_service.dart';

class LauncherController extends GetxController {
  //VARIABLES
  Rx<ModelOfNews?> modelOfNews = ModelOfNews().obs;
  RxBool loadingStatue = false.obs;

  @override
  void onInit() {
    detectCountry();
    fetchData();
    super.onInit();
  }

  //IT CHANGE LOADING STATUE
  changeLoadingStatue() {
    loadingStatue.value = !loadingStatue.value;
  }

  //IT GIVES DATA
  fetchData() async {
    changeLoadingStatue();
    modelOfNews.value = await AppService().getNews();
    changeLoadingStatue();
  }

  //IT CHANGE THE COUNTRY FROM APPBASEURL CLASS
  detectCountry() {
    String country = describeEnum(Get.arguments);
    GeneralData.country = country;
  }

  //DRAWER
  RxBool isDrawerOpen = false.obs;
  RxDouble xOffset = 0.0.obs;
  RxDouble yOffset = 0.0.obs;
}
