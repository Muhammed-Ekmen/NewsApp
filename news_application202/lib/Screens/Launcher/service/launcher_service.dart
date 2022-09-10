import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:news_application202/Constants/base_url.dart';
import 'package:news_application202/Models/model_of_news.dart';
import 'package:news_application202/Service/base_service_request.dart';
import 'package:http/http.dart' as http;

class AppService {
  RxBool loadingStatue = false.obs;
  Future<ModelOfNews?> getNews() async {
    try {
      changeLoadingStatue();
      http.Response? response =
          await BaseServiceRequest.getRequest(path: AppBaseUrls.baseURL);
      if (response != null) {
        Map<String, dynamic> responseValue;
        responseValue = jsonDecode(response.body);
        if (responseValue.isNotEmpty) {
          ModelOfNews modelOfNews = ModelOfNews.fromJson(responseValue);
          return modelOfNews;
        }
      }
    } on SocketException catch (e) {
      return Future.error(e);
    } finally {
      changeLoadingStatue();
    }
    return null;
  }

  changeLoadingStatue() {
    loadingStatue.value = !loadingStatue.value;
  }
}

enum AppErrors {
  errorAuthentication,
  errorFetchData,
  errorNadRequest,
  errorSocket,
}
