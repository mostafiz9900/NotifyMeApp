import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:notify_me_app/app/auth_controller.dart';
import 'package:notify_me_app/app/routes/app_pages.dart';

class VerificationController extends GetxController {
  final auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  final authController = Get.find<AuthController>();
  User? user;
  Timer? timer;
  @override
  void onInit() {
    super.onInit();
    user = auth.currentUser;
    user!.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      checkEmailVarification();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    timer!.cancel();
  }

  Future<void> checkEmailVarification() async {
    user = auth.currentUser;
    await user!.reload();
    if (user!.emailVerified) {
      print(user!.email);
      print(user!.uid);
      print(user!.displayName);
      print(auth.currentUser);
      var str = "${user!.email}";
      var parts = str.split('@');
      var prefix = parts[0].trim();
      print(prefix);
      print('ekhanae asi');
      firestoreInstance.collection("users").add({
        "user_id": user!.uid,
        "user_email": user!.email,
        "user_name": prefix

        // "address": {"street": "street 24", "city": "new york"}
      }).then((value) {
        print(value.id);
        //  var firebaseUser =  FirebaseAuth.instance.currentUser;
        try {
          firestoreInstance
              .collection("users")
              .doc(value.id)
              .get()
              .then((value) {
            print(value.data());
            print(value.data()!["user_id"]);
            // Get.toNamed(Routes.VERIFICATION_SUCCESSFUL);
             authController
                .setCurrentUser(userName: value.data()!["user_name"]);
            Get.offAllNamed(Routes.HOME, arguments: {
              'user_id': value.data()!["user_id"],
              'user_email': value.data()!["user_email"],
              'user_name': value.data()!["user_name"],
            });
          });
        } catch (e) {
          print(e);
        }
      });
      timer!.cancel();
    }
  }
}
