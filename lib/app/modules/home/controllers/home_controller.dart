import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:notify_me_app/app/auth_controller.dart';

class HomeController extends GetxController {
  final authController = Get.find<AuthController>();
  final firestoreInstance = FirebaseFirestore.instance;
  var selectedRole = '1'.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  void onSelected(String value) {
    selectedRole.value = value;
  }

  final count = 0.obs;
  final _userName = ''.obs;
  final _userId = ''.obs;
  final _userEmail = ''.obs;
  String? get userName => _userName.value;
  String? get userId => _userId.value;
  String? get userEmail => _userEmail.value;
  @override
  void onInit()async {
    super.onInit();
   await authController.getCurrentUser();
    if (Get.arguments != null && Get.arguments.length > 0) {
      _userId.value = Get.arguments['user_id'];
      _userEmail.value = Get.arguments['user_email'];
      _userName.value = Get.arguments['user_name'];
      print("${userName.toString()}");
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
