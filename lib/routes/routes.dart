import 'package:new_clocare_delivery_boy/routes/routes_page.dart';
import 'package:new_clocare_delivery_boy/screen/auth/registration_screen.dart';
import 'package:new_clocare_delivery_boy/screen/auth/forgot_password_screen.dart';
import 'package:new_clocare_delivery_boy/screen/auth/splash_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/buttom_navigation.dart';
import 'package:get/get.dart';
import '../screen/auth/intro_screen.dart';

class RouteHelper {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.inital,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.intro,
      page: () => const IntroScreen(),
    ),
    // GetPage(
    //   name: Routes.login,
    //   page: () => const AuthPage(),
    // ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: Routes.bottomNavigation,
      page: () => const BottomNavigation(),
    ),
  ];
}
