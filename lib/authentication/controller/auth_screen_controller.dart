import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  signIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        if (googleSignInAuthentication.accessToken != null &&
            googleSignInAuthentication.idToken != null) {
          final AuthCredential credential = GoogleAuthProvider.credential(
              accessToken: googleSignInAuthentication.accessToken,
              idToken: googleSignInAuthentication.idToken);
          try {
            _auth.signInWithCredential(credential);
            //ignore: avoid_print
            print(
                'User Signed In with ${_auth.currentUser?.email} and ${_auth.currentUser?.displayName}');
            // await auth_auth.signInWithCredential(credential);
          } on FirebaseAuthException catch (e) {
            Get.snackbar('auth.signUpErrorTitle'.tr, e.message!,
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 10),
                backgroundColor: Get.theme.snackBarTheme.backgroundColor,
                colorText: Get.theme.snackBarTheme.actionTextColor);
            //ignore: avoid_print
            print(e);
          }
        }
      }
    } catch (e) {
      //ignore: avoid_print
      print(e);
    }
  }
}
