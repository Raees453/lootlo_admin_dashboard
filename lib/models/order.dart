import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/models/formatter.dart';
import 'package:lootlo_app_admin_dash/models/order_payment.dart';
import 'package:lootlo_app_admin_dash/models/order_status.dart';

import '../utils/helpers/ui_helpers.dart';

class Order {
  final String id;
  final int invoiceNo;
  final DateTime orderTime;
  final String customerName;
  final OrderPaymentType paymentType;
  final int amount;
  final OrderStatus orderStatus;

  Order({
    required this.id,
    required this.invoiceNo,
    required this.orderTime,
    required this.customerName,
    required this.paymentType,
    required this.amount,
    required this.orderStatus,
  });

  static List<String> get columnNames => [
        'Invoice No',
        'Order Time',
        'Customer Name',
        'Payment',
        'Amount',
        'Status',
      ];

  DataRow toDataRow(BuildContext context) {
    return DataRow(
      cells: [
        DataCell(Text(invoiceNo.toString())),
        DataCell(Text(Formatter.formatDate(orderTime))),
        DataCell(Text(customerName)),
        DataCell(Text(paymentType.name.toUpperCase())),
        DataCell(Text('Rs. ${amount.toString()}')),
        DataCell(UIHelpers.highlightedWidget(context, orderStatus)),
      ],
    );
  }
}
