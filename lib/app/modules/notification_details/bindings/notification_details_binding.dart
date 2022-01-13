import 'package:get/get.dart';

import '../controllers/notification_details_controller.dart';

class NotificationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationDetailsController>(
      () => NotificationDetailsController(),
    );
  }
}
