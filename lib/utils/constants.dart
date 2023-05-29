import 'package:flutter/material.dart';

class AppConstants {
  static const Color primaryColor = Colors.deepOrange;
  static const Color secondaryColor = Colors.deepOrangeAccent;

  static const Color onPrimaryColor = Colors.white;
  static const Color onSecondaryColor = onPrimaryColor;

  static const double borderRadius = 8.0;

  static const double screenPaddingValue = 24.0;

  static const int rowsPerPageInTable = 15;

  static const double widgetHeight = 50;

  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: AppConstants.screenPaddingValue * 3,
    vertical: AppConstants.screenPaddingValue,
  );
}
