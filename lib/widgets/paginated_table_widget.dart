import 'package:flutter/material.dart';

import '../utils/constants.dart';

class PaginatedTableWidget extends StatelessWidget {
  const PaginatedTableWidget({
    Key? key,
    required this.cols,
    required this.rows,
    required this.getRowFunction,
  }) : super(key: key);

  final List<String> cols;
  final List<dynamic> rows;
  final DataRow? Function(int) getRowFunction;

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      rowsPerPage: AppConstants.rowsPerPageInTable,
      arrowHeadColor: Theme.of(context).brightness == Brightness.light
          ? Theme.of(context).primaryColor
          : Theme.of(context).colorScheme.onPrimary,
      columns: cols
          .map((e) => DataColumn(
                tooltip: e,
                label: Text(
                  e,
                  style: const TextStyle(color: Colors.white),
                ),
              ))
          .toList(),
      source: PaginatedTableSource(data: rows, getRowFunction: getRowFunction),
    );
  }
}

class PaginatedTableSource extends DataTableSource {
  final List<dynamic> data;
  final DataRow? Function(int) getRowFunction;

  PaginatedTableSource({
    required this.data,
    required this.getRowFunction,
  });

  @override
  DataRow? getRow(int index) => getRowFunction(index);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
