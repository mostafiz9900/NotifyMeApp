import 'package:get/get.dart';

import '../controllers/phone_signup_controller.dart';

class PhoneSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneSignupController>(
      () => PhoneSignupController(),
    );
  }
}
