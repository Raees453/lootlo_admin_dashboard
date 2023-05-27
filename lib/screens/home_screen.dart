import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/utils/constants.dart';
import 'package:lootlo_app_admin_dash/views/home/home_mobile_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../views/home/home_desktop_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => const HomeDesktopView(),
      tablet: (_) => buildTabletView(),
      mobile: (_) => const HomeMobileView(),
    );
  }

  Widget buildTabletView() {
    return const Scaffold(
      body: Center(
        child: Text('Tablet View'),
      ),
    );
  }
}


