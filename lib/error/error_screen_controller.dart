import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants/routes.dart';

class ErrorScreenController extends GetxController {
  RxBool isLogOut = false.obs;
  logOut() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    isLogOut.value = true;
    Get.offNamed(Routes.splashScreen);
  }
}
