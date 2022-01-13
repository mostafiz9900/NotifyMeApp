import 'package:get/get.dart';

import '../controllers/verification_successful_controller.dart';

class VerificationSuccessfulBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationSuccessfulController>(
      () => VerificationSuccessfulController(),
    );
  }
}
