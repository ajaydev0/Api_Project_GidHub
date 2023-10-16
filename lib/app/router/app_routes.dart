part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splashScreen = _Path.splashScreen;
  static const usrInput = _Path.usrInput;
  static const homePage = _Path.homePage;
  static const mainApp = _Path.mainApp;
}

abstract class _Path {
  _Path._();
  static const splashScreen = "/";
  static const usrInput = "/SignInPage";
  static const homePage = '/HomePage';
  static const mainApp = '/MainApp';
}
