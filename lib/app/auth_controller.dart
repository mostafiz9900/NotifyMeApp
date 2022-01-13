import 'package:get/get.dart';
import 'package:notify_me_app/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  // final authController = Get.find<AuthController>();

  final count = 0.obs;
  final _userName = ''.obs;
  String get currentUserName => _userName.value;
  @override
  void onInit() async {
    super.onInit();
    await getCurrentUser();
    print(getCurrentUser());
    print('auth oninit');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  Future<String> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String currentUserName = prefs.getString('current_user_name').toString();
    print(currentUserName);
    print('current user auth');
    if (currentUserName != null) {
      _userName.value = currentUserName;

      // _userName.value.auth = true;
      // _currentUser.value=currentUser.value;
    } else {
      _userName.value = '';
    }
    return _userName.value;
  }

  void setCurrentUser({String? userName}) async {
    try {
      if (userName != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('current_user_name', '$userName');
      }
    } catch (e) {
      throw new Exception(e);
    }
  }

  void signOutUser() async {
    try {
      // await _authService.signOutUser();
      // _currentUser.value = new UserDb();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('current_user_name');
      // setdbUser(new Userdb());
      getCurrentUser();
      Get.toNamed(Routes.SIGNIN);
    } catch (e) {
      print(e);
      Get.snackbar('Error', '${e.hashCode}');
    }
  }
}
