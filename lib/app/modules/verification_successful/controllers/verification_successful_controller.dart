import 'package:get/get.dart';
import 'package:notify_me_app/app/routes/app_pages.dart';

class VerificationSuccessfulController extends GetxController {
 

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
      
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
