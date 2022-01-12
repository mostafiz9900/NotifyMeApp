import 'package:get/get.dart';

class HomeController extends GetxController {
  var _chosenValue = ''.obs;
  String get chosenValue => _chosenValue.value;
  var selectedZoneId = "0".obs;
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
  changeDropdownling(String value) {
    _chosenValue.value = value;
  }
   String? validateZone(String value) {
    if (value == "0") {
      return "Select Page";
    }
    return null;
  }
}
