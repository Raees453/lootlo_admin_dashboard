import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/hard_coded_data.dart';
import 'package:lootlo_app_admin_dash/models/order_payment.dart';
import 'package:lootlo_app_admin_dash/models/order_status.dart';
import 'package:lootlo_app_admin_dash/utils/constants.dart';

import '../models/formatter.dart';

class HomeRecentOrdersTableWidget extends StatelessWidget {
  HomeRecentOrdersTableWidget({Key? key}) : super(key: key);

  final cols = tableCols;
  final rows = tableRows;

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      source: MyDataTableSource(rows: rows, context: context),
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

class MyDataTableSource extends DataTableSource {
  final List<List<dynamic>> rows;
  final BuildContext context;

  MyDataTableSource({required this.rows, required this.context});

  final _colorsMap = {
    OrderStatus.Pending: Colors.amber,
    OrderStatus.Processing: Colors.teal,
    OrderStatus.Cancel: Colors.red,
    OrderStatus.Delivered: Colors.green,
  };

  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: [
        DataCell(Text(rows[index][0].toString())),
        DataCell(
          Text(
            Formatter.formatDate(rows[index][1] as DateTime),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        DataCell(Text(rows[index][2].toString())),
        DataCell(
          Text(
            (rows[index][3] as OrderPaymentType).name.toUpperCase(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        DataCell(Text(rows[index][4].toString())),
        DataCell(
          _highlightedWidget(
            context,
            (rows[index][5] as OrderStatus),
            _colorsMap,
          ),
        )
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => rows.length;

  @override
  int get selectedRowCount => 10;

  Widget _highlightedWidget(
      BuildContext context, OrderStatus title, Map colorsMap) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: (colorsMap[title] as Color).withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppConstants.screenPadding / 2),
      ),
      child: Text(
        title.name,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: (colorsMap[title] as Color),
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}