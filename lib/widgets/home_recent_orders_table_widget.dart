import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/hard_coded_data.dart';
import 'package:lootlo_app_admin_dash/models/order_payment.dart';
import 'package:lootlo_app_admin_dash/models/order_status.dart';
import 'package:lootlo_app_admin_dash/utils/constants.dart';

import '../models/formatter.dart';
import '../models/table_sources/recent_orders_table_source.dart';

class HomeRecentOrdersTableWidget extends StatelessWidget {
  HomeRecentOrdersTableWidget({Key? key}) : super(key: key);

  final cols = tableCols;
  final rows = tableRows;

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      source: RecentOrdersTableSource(rows: rows, context: context),
      arrowHeadColor: Theme.of(context).brightness == Brightness.light
          ? Theme.of(context).primaryColor
          : Theme.of(context).colorScheme.onPrimary,
      rowsPerPage: AppConstants.rowsPerPageInTable,
      columns: cols
          .map(
            (e) => DataColumn(
              label: Text(
                e,
                style: const TextStyle(color: Colors.white),
              ),
              tooltip: e,
            ),
          )
          .toList(),
    );
  }
}
