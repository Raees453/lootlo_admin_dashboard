import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/utils/constants.dart';

import '/screens/home_widgets/account_widget.dart';
import '/screens/home_widgets/active_orders.dart';
import '/screens/home_widgets/customers_widget.dart';
import '/screens/home_widgets/home_widget.dart';
import '/screens/home_widgets/orders_widget.dart';
import '/screens/home_widgets/payments_widget.dart';
import '/screens/home_widgets/products_widget.dart';
import '/widgets/app_bar.dart';

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

  String _currentWidget = 'orders';

  Widget buildSideBar(BuildContext context) {
    int index = 0;
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(color: theme.primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 90,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                border: Border.all(
              color: theme.colorScheme.primary,
            )),
            child: Text(
              'Lootlo Admin\nDashboard',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: AppConstants.screenPaddingValue),
          ...widgets.entries
              .map((e) => buildSideBarButton(e.key, index++))
              .toList(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.screenPaddingValue / 2,
            ),
            child: ElevatedButton.icon(
              onPressed: () {},
              label: const Text('Logout'),
              icon: const Icon(Icons.logout),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  theme.scaffoldBackgroundColor,
                ),
                foregroundColor: MaterialStatePropertyAll<Color>(
                  theme.brightness == Brightness.light
                      ? theme.primaryColor
                      : theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppConstants.screenPaddingValue),
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
