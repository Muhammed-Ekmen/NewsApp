import 'package:http/http.dart' as http;
import 'package:news_application202/Service/service_exceptions.dart';

class BaseServiceRequest {
  //GET
  static Future<http.Response?> getRequest({required String path}) async {
    try {
      Uri apiAdress = Uri.parse(path);
      http.Response response = await http.get(
        apiAdress,
      );
      switch (response.statusCode) {
        case 200:
          return response;
        case 404:
          throw BadRequestException();
        case 403:
          throw UnAuthenticationException();
        default:
          throw FetchDataException();
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
