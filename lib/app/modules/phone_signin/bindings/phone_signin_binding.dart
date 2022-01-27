import 'package:get/get.dart';

import '../controllers/phone_signin_controller.dart';

class PhoneSigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneSigninController>(
      () => PhoneSigninController(),
    );
  }
}
