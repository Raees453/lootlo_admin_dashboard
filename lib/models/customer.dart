import 'package:flutter/material.dart';

class Customer {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String imageUrl;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.imageUrl,
  });

  DataRow toDataRow() {
    return DataRow(
      cells: [
        DataCell(
          CircleAvatar(
            backgroundImage: AssetImage(imageUrl),
          ),
        ),
        DataCell(Text(id)),
        DataCell(Text(name)),
        DataCell(Text(phone)),
        DataCell(Text(email)),
      ],
    );
  }
}
