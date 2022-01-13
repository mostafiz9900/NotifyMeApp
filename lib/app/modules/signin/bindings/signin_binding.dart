import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SigninController>(
     SigninController(),
    );
  }
}
