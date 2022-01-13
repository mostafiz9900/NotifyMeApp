import 'package:get/get.dart';

class NotificationDetailsController extends GetxController {
  final count = 0.obs;
  final _title = ''.obs;
  final _message = ''.obs;
  final _item = ''.obs;
  String? get title => _title.value;
   String? get message => _message.value;
    String? get item => _item.value;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments.length > 0) {
      _title.value = Get.arguments['title'];
      _message.value = Get.arguments['message'];
      _item.value = Get.arguments['item'];
      print("${title.toString()}");
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
