import 'package:flutter/material.dart';

import '../utils/constants.dart';

class PaginatedTableWidget extends StatelessWidget {
  const PaginatedTableWidget({
    Key? key,
    required this.cols,
    required this.source,
  }) : super(key: key);

  final List<String> cols;
  final DataTableSource source;

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
      source: source,
    );
  }
}
