import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/models/order_status.dart';
import 'package:lootlo_app_admin_dash/utils/constants.dart';
import 'package:lootlo_app_admin_dash/utils/hard_coded_data.dart';
import 'package:lootlo_app_admin_dash/widgets/custom/custom_popup_menu_button.dart';
import 'package:lootlo_app_admin_dash/widgets/custom/custome_text_field.dart';
import 'package:lootlo_app_admin_dash/widgets/paginated_table_widget.dart';

import '../../../models/order.dart';
import '../../custom/custom_get_date_button_widget.dart';

class OrdersDesktopView extends StatelessWidget {
  OrdersDesktopView({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();
  final List<Order> orders = allOrders;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppConstants.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Orders',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: AppConstants.screenPaddingValue),
          buildSearchFilterWidget(context),
          const SizedBox(height: AppConstants.screenPaddingValue),
          PaginatedTableWidget(
            cols: Order.columnNames,
            rows: orders,
            getRowFunction: (int index) => orders[index].toDataRow(context),
          )
        ],
      ),
    );
  }

  Widget buildSearchFilterWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      padding: const EdgeInsets.all(AppConstants.screenPaddingValue),
      child: Column(
        children: [
          buildFirstSearchFilterRow(context),
          const SizedBox(height: AppConstants.screenPaddingValue),
          buildSecondSearchFilterRow(context),
          const SizedBox(height: AppConstants.screenPaddingValue / 2),
          buildThirdSearchFilterRow(context),
        ],
      ),
    );
  }

  Widget buildSecondSearchFilterRow(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
        );
    return Row(
      children: [
        Expanded(child: Text('Start Date', style: style)),
        Expanded(child: Text('  End Date', style: style)),
        const Expanded(child: SizedBox()),
      ],
    );
  }

  Widget buildFirstSearchFilterRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: controller,
            hintText: 'Search Orders',
          ),
        ),
        const SizedBox(width: AppConstants.screenPaddingValue),
        Expanded(
          child: CustomDropDownButton(
            title: 'Order Status',
            values: OrderStatus.values.map((e) => e.name).toList(),
          ),
        ),
        const SizedBox(width: AppConstants.screenPaddingValue),
        Expanded(
          child: CustomDropDownButton(
            title: 'Order Status',
            values: OrderStatus.values.map((e) => e.name).toList(),
          ),
        ),
      ],
    );
  }

  Widget buildThirdSearchFilterRow(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: CustomGetDataButtonWidget()),
        const SizedBox(width: AppConstants.screenPaddingValue),
        const Expanded(child: CustomGetDataButtonWidget()),
        const SizedBox(width: AppConstants.screenPaddingValue),
        Expanded(
          child: ElevatedButton.icon(
            label: const Text('Download Orders'),
            icon: const Icon(Icons.download),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
