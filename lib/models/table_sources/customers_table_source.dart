import 'package:flutter/material.dart';

import '../customer.dart';

class CustomersTableSource extends DataTableSource {
  final List<Customer> customers;

  CustomersTableSource({required this.customers});

  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: [
        DataCell(
          CircleAvatar(
            backgroundImage: AssetImage(customers[index].imageUrl),
          ),
        ),
        DataCell(Text(customers[index].id)),
        DataCell(Text(customers[index].name)),
        DataCell(Text(customers[index].phone)),
        DataCell(Text(customers[index].email)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => customers.length;

  @override
  int get selectedRowCount => 0;
}
