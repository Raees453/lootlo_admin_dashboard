import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PaymentsWidget extends StatelessWidget {
  const PaymentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => buildDesktopView(),
      mobile: (_) => buildMobileView(),
    );
  }

  Widget buildDesktopView() {
    return const Center(
      child: Text('Payments Widget Desktop View'),
    );
  }

  Widget buildMobileView() {
    return const Center(
      child: Text('Payments Widget Mobile View'),
    );
  }
}
