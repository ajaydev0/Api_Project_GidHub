import 'package:get/get.dart';

import '../modules/MainApp/bindings/main_app_binding.dart';
import '../modules/MainApp/views/main_app_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash_screen/binding/splash_binding.dart';
import '../modules/splash_screen/view/splash_view.dart';
import '../modules/user_input/binding/user_input_binding.dart';
import '../modules/user_input/view/user_input_view.dart';

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
      name: _Path.usrInput,
      page: () => const UserInputView(),
      binding: UserInputBinding(),
    ),
    GetPage(
      name: Routes.homePage,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.mainApp,
      page: () => const MainAppView(),
      binding: MainAppBinding(),
    ),
  ];
}
