import 'package:flutter/material.dart';

import '../../models/order_status.dart';
import '../../utils/helpers/ui_helpers.dart';
import '../formatter.dart';
import '../order_payment.dart';

class RecentOrdersTableSource extends DataTableSource {
  final List<List<dynamic>> rows;
  final BuildContext context;

  RecentOrdersTableSource({required this.rows, required this.context});

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
          UIHelpers.highlightedWidget(context, (rows[index][5] as OrderStatus)),
        )
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => rows.length;

  @override
  int get selectedRowCount => 0;
}
