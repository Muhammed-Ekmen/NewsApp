import 'package:news_application202/Constants/general_data.dart';

class AppBaseUrls {
  static String baseURL ="https://newsapi.org/v2/top-headlines?country=${GeneralData.country}&apiKey=${GeneralData.apiKey}";
  static String trialURL = "https://jsonplaceholder.typicode.com/posts";
}
