import 'package:flutter/material.dart';

import '../../screens/home_widgets/account_widget.dart';
import '../../screens/home_widgets/active_orders.dart';
import '../../screens/home_widgets/customers_widget.dart';
import '../../screens/home_widgets/home_widget.dart';
import '../../screens/home_widgets/orders_widget.dart';
import '../../screens/home_widgets/payments_widget.dart';
import '../../screens/home_widgets/products_widget.dart';
import '../../widgets/app_bar.dart';

class HomeDesktopView extends StatefulWidget {
  const HomeDesktopView({super.key});

  @override
  State<HomeDesktopView> createState() => _HomeDesktopViewState();
}

class _HomeDesktopViewState extends State<HomeDesktopView> {
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

  Widget buildSideBar(BuildContext context) {
    int index = 0;
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 90,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                )),
            child: Text(
              'Lootlo Admin\nDashboard',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 30),
          ...widgets.entries
              .map((e) => buildSideBarButton(e.key, index++))
              .toList(),
        ],
      ),
    );
  }

  Widget buildSideBarButton(String title, int index) {
    final theme = Theme.of(context);

    bool isSelected = _currentWidget == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentWidget = title;
        });
      },
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.onPrimary : null,
        ),
        padding: const EdgeInsets.only(left: 16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title.toUpperCase(),
            style: theme.textTheme.labelLarge?.copyWith(
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onPrimary,
              fontWeight: _currentWidget == title ? FontWeight.bold : null,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 2, child: buildSideBar(context)),
          Expanded(
            flex: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarBuilder(),
                Expanded(child: widgets[_currentWidget]!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
