import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => buildDesktopView(),
      mobile: (_) => buildMobileView(),
    );
  }

  Widget buildDesktopView() {
    return const Center(
      child: Text('Account Widget Desktop View'),
    );
  }

  Widget buildMobileView() {
    return const Center(
      child: Text('Account Widget Mobile View'),
    );
  }
}