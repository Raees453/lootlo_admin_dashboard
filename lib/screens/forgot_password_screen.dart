import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = '/forgot-password';

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout.builder(
        desktop: (_) => buildDesktopView(),
        tablet: (_) => buildTabletView(),
        mobile: (_) => buildMobileView(),
      ),
    );
  }

  Widget buildDesktopView() {
    return const Center(
      child: Text('Forgot Password Screen Desktop View'),
    );
  }

  Widget buildMobileView() {
    return const Center(
      child: Text('Forgot Password Screen Mobile View'),
    );
  }

  Widget buildTabletView() {
    return const Center(
      child: Text('Forgot Password Screen Tablet View'),
    );
  }
}
