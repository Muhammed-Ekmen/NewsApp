import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_application202/Constants/paths.dart';

class GoogleSingInManager {
  static final _googleSignIn = GoogleSignIn();

  //logIn Function
  static Future<GoogleSignInAccount?> logIn() {
    return _googleSignIn.signIn().whenComplete(() {
      if (_googleSignIn.currentUser != null) {
        Get.offAndToNamed(pathOfLoungePage);
      }
    });
  }

  //logOut Function
  static Future<void> logOut() async {
    bool result = await _googleSignIn.isSignedIn();
    result == false
        ? Get.offAndToNamed(pathOfLoginPage)
        : await _googleSignIn
            .disconnect()
            .whenComplete(() => Get.offAndToNamed(pathOfLoginPage));
  }
}
