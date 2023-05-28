import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/models/table_sources/customers_table_source.dart';
import 'package:lootlo_app_admin_dash/utils/constants.dart';
import 'package:lootlo_app_admin_dash/widgets/paginated_table_widget.dart';

import '../../models/customer.dart';
import '../../widgets/custome_text_field.dart';

class CustomersDesktopView extends StatefulWidget {
  const CustomersDesktopView({Key? key, required this.customers})
      : super(key: key);

  final List<Customer> customers;

  @override
  State<CustomersDesktopView> createState() => _CustomersDesktopViewState();
}

class _CustomersDesktopViewState extends State<CustomersDesktopView> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppConstants.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Customers',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Container(
            padding: const EdgeInsets.all(
              AppConstants.screenPaddingValue,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              color: Colors.white,
            ),
            child: CustomeTextField(
              controller: _controller,
              hintText: 'Search by name/email/phone',
            ),
          ),
          const SizedBox(height: 20),
          PaginatedTableWidget(
            cols: const ['Image', 'Id', 'Name', 'Email', 'Phone'],
            source: CustomersTableSource(customers: widget.customers),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Divider(thickness: 1.5),
          )
        ],
      ),
    );
  }
}
