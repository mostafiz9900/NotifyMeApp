import 'package:get/get.dart';
import 'package:notify_me_app/app/auth_controller.dart';

class GlobalBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(),permanent: true);   
  }

}
