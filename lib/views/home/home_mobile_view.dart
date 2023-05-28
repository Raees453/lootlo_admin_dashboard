import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/utils/constants.dart';

import '../../screens/home_widgets/account_widget.dart';
import '../../screens/home_widgets/active_orders.dart';
import '../../screens/home_widgets/customers_widget.dart';
import '../../screens/home_widgets/home_widget.dart';
import '../../screens/home_widgets/orders_widget.dart';
import '../../screens/home_widgets/payments_widget.dart';
import '../../screens/home_widgets/products_widget.dart';

class HomeMobileView extends StatefulWidget {
  const HomeMobileView({Key? key}) : super(key: key);

  @override
  State<HomeMobileView> createState() => _HomeMobileViewState();
}

class _HomeMobileViewState extends State<HomeMobileView> {
  final widgets = {
    'home': HomeWidget(),
    'customers': CustomersWidget(),
    'products': ProductsWidget(),
    'orders': OrdersWidget(),
    'active orders': ActiveOrdersWidget(),
    'payment': PaymentsWidget(),
    'account': AccountWidget(),
  };

  String _currentWidget = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Lootlo Admin Dashboard'),
        centerTitle: true,
      ),
      drawer: buildDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.screenPaddingValue / 2),
        child: widgets[_currentWidget],
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          ...widgets.entries.map((e) => buildDrawerButton(e.key)).toList(),
          const Spacer(),
          buildDrawerButton('Logout')
        ],
      ),
    );
  }

  Widget buildDrawerButton(String title) {
    return GestureDetector(
      onTap: () => setState(() {
        _currentWidget = title;
        Navigator.of(context).pop();
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppConstants.screenPaddingValue / 5,
          horizontal: AppConstants.screenPaddingValue / 2,
        ),
        child: Column(
          children: [
            Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            const SizedBox(height: AppConstants.screenPaddingValue / 2),
          ],
        ),
      ),
    );
  }
}
