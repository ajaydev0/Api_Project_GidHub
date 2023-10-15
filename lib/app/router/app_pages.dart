import 'package:get/get.dart';
import '../modules/auth/sign_in/binding/sign_in_binding.dart';
import '../modules/auth/sign_in/view/sign_in_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash_screen/binding/splash_binding.dart';
import '../modules/splash_screen/view/splash_view.dart';
part 'app_routes.dart';

class AppPages {
  static const initialPage = Routes.splashScreen;
  static final pages = [
    GetPage(
      name: _Path.splashScreen,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Path.signInPage,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.homePage,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
