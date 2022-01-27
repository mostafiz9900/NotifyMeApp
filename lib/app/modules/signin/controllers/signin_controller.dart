import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:notify_me_app/app/auth_controller.dart';
import 'package:notify_me_app/app/routes/app_pages.dart';

class SigninController extends GetxController {
  final authController = Get.find<AuthController>();
  final auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await authController.getCurrentUser();
    print(authController.currentUserName);
    print('sing cont');
    print(authController.getCurrentUser());
  
  }

  @override
  void onReady() {
    super.onReady();
      if (authController.currentUserName == null ||
        authController.currentUserName == '') {
      // Get.toNamed(Routes.SIGNIN);
      print('if condition');
    } else {
      print('in condition else');
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
