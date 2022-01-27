import 'package:get/get.dart';

import 'package:notify_me_app/app/modules/home/bindings/home_binding.dart';
import 'package:notify_me_app/app/modules/home/views/home_view.dart';
import 'package:notify_me_app/app/modules/notification_details/bindings/notification_details_binding.dart';
import 'package:notify_me_app/app/modules/notification_details/views/notification_details_view.dart';
import 'package:notify_me_app/app/modules/phone_signin/bindings/phone_signin_binding.dart';
import 'package:notify_me_app/app/modules/phone_signin/views/phone_signin_view.dart';
import 'package:notify_me_app/app/modules/phone_signup/bindings/phone_signup_binding.dart';
import 'package:notify_me_app/app/modules/phone_signup/views/phone_signup_view.dart';
import 'package:notify_me_app/app/modules/signin/bindings/signin_binding.dart';
import 'package:notify_me_app/app/modules/signin/views/signin_view.dart';
import 'package:notify_me_app/app/modules/signup/bindings/signup_binding.dart';
import 'package:notify_me_app/app/modules/signup/views/signup_view.dart';
import 'package:notify_me_app/app/modules/verification/bindings/verification_binding.dart';
import 'package:notify_me_app/app/modules/verification/views/verification_view.dart';
import 'package:notify_me_app/app/modules/verification_successful/bindings/verification_successful_binding.dart';
import 'package:notify_me_app/app/modules/verification_successful/views/verification_successful_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION,
      page: () => VerificationView(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_DETAILS,
      page: () => NotificationDetailsView(),
      binding: NotificationDetailsBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION_SUCCESSFUL,
      page: () => VerificationSuccessfulView(),
      binding: VerificationSuccessfulBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_SIGNIN,
      page: () => PhoneSigninView(),
      binding: PhoneSigninBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_SIGNUP,
      page: () => PhoneSignupView(),
      binding: PhoneSignupBinding(),
    ),
  ];
}
