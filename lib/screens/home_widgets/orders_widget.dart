import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../widgets/views/home/orders_desktop_view.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => OrdersDesktopView(),
      mobile: (_) => buildMobileView(),
    );
  }

  Widget buildDesktopView() {
    return const Center(
      child: Text('Orders Widget Desktop View'),
    );
  }

  Widget buildMobileView() {
    return const Center(
      child: Text('Orders Widget Mobile View'),
    );
  }
}
