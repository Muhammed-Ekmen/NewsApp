import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:news_application202/Screens/Login/model/model_user.dart';

enum GetStorageKey { user }

class GetStorageManager {
  Future<void> saveUser(
      {required GetStorageKey key, required ModelOfUser userModel}) async {
    try {
      await GetStorage().write(key.name, jsonEncode(userModel.toJson()));
    } catch (e) {
      return Future.error(e);
    }
  }

  ModelOfUser? getUser({required GetStorageKey key}) {
    try {
      final stringUser = GetStorage().read(key.name);
      if (stringUser != null) {
        final json = jsonDecode(stringUser);
        if (json is Map<String, dynamic>) {
          return ModelOfUser.fromJson(json);
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
