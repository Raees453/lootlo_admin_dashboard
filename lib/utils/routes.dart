import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/screens/forgot_password_screen.dart';
import 'package:lootlo_app_admin_dash/screens/home_screen.dart';
import 'package:lootlo_app_admin_dash/screens/login_screen.dart';
import 'package:lootlo_app_admin_dash/screens/page_not_found_screen.dart';

class Routes {
  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => const PageNotFoundScreen(),
    );
  }

  static get initialRoute => LoginScreen.routeName;

  static get routes => {
        HomeScreen.routeName: (_) => HomeScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        ForgotPasswordScreen.routeName: (_) => ForgotPasswordScreen(),
      };
}
