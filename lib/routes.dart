import 'package:get/get.dart';
import 'package:shibank/screens/logged.dart';
import 'package:shibank/screens/login.dart';
import 'package:shibank/screens/splash.dart';

class Routes {
  static get routes => [splashPage, loginPage, loggedPage];

  static const String splash = '/';
  static GetPage splashPage = GetPage(
    name: splash,
    page: () => SplashPage(),
  );

  static const String login = '/login';
  static GetPage loginPage = GetPage(
    name: login,
    page: () => LoginPage(),
    transition: Transition.downToUp,
    transitionDuration: Duration(seconds: 1),
  );

  static const String logged = '/logged';
  static GetPage loggedPage = GetPage(
    name: logged,
    page: () => LoggedPage(),
    transition: Transition.rightToLeftWithFade,
  );
}
