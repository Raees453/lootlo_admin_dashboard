import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../utils/hard_coded_data.dart';
import '../../widgets/views/home/customers_dekstop_view.dart';

class CustomersWidget extends StatefulWidget {
  const CustomersWidget({Key? key}) : super(key: key);

  @override
  State<CustomersWidget> createState() => _CustomersWidgetState();
}

class _CustomersWidgetState extends State<CustomersWidget> {
  final _customers = customersList;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => CustomersDesktopView(customers: _customers),
      mobile: (_) => buildMobileView(),
    );
  }

  Widget buildMobileView() {
    return const Center(
      child: Text('Customers Widget'),
    );
  }
}
