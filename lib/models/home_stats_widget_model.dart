import 'package:flutter/cupertino.dart';

class HomeStatsWidgetModel {
  final String title;
  final IconData icon;
  final int quantity;
  final Color backgroundColor;
  final bool isLast;

  HomeStatsWidgetModel({
    required this.title,
    required this.icon,
    required this.quantity,
    required this.backgroundColor,
    this.isLast = false,
  });
}
