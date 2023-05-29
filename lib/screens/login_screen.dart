import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/widgets/views/login/login_desktop_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout.builder(
        desktop: (_) => LoginDesktopView(),
      ),
    );
  }
}
