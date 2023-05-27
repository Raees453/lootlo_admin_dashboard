import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/hard_coded_data.dart';
import 'package:lootlo_app_admin_dash/widgets/customer_tile_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
      desktop: (_) => buildDesktopView(),
      mobile: (_) => buildMobileView(),
    );
  }

  Widget buildMobileView() {
    return Center(
      child: Text('Customers Widget'),
    );
  }

  Widget buildDesktopView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'All Customers',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          ..._customers.map((e) => CustomerTileWidget(customer: e)).toList(),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Divider(thickness: 1.5),
          )
        ],
      ),
    );
  }
}
