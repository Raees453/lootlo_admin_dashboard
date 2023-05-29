import 'package:flutter/cupertino.dart';

class HomeMiniStatsWidgetModel {
  final String title;
  final IconData icon;
  final int value;
  final Color backgroundColor;

  HomeMiniStatsWidgetModel({
    required this.title,
    required this.icon,
    required this.value,
    required this.backgroundColor,
  });
}
