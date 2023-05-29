import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

final fontFamily = GoogleFonts.poppins().fontFamily;
const useMaterial3 = true;

ThemeData lightTheme() {
  const textColor = Colors.black87;
  const primaryColor = Color.fromRGBO(72, 157, 154, 1);
  const scaffoldBackgroundColor = Color.fromRGBO(249, 250, 251, 1);

  return ThemeData(
    useMaterial3: useMaterial3,
    brightness: Brightness.light,
    fontFamily: fontFamily,
    primaryColor: primaryColor,
    primaryColorLight: primaryColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    iconTheme: const IconThemeData(color: Colors.white),
    popupMenuTheme: const PopupMenuThemeData(position: PopupMenuPosition.under),
    textTheme: _getPoppinsTextTheme(textColor),
    dataTableTheme: _getTableDataThemeData(
      primaryColor,
      scaffoldBackgroundColor,
      textColor,
    ),
    elevatedButtonTheme:
        _getElevatedButtonThemeData(primaryColor, primaryColor, primaryColor),
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      primary: primaryColor,
      onPrimary: Colors.white,
      outline: Colors.black,
      onBackground: Color.fromRGBO(244, 245, 247, 1),
    ),
  );
}

ThemeData darkTheme() {
  const textColor = Colors.white70;
  const primaryColor = Color.fromRGBO(26, 28, 34, 1);
  const scaffoldBackgroundColor = Color.fromRGBO(18, 19, 23, 1);

  return ThemeData(
    useMaterial3: useMaterial3,
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    fontFamily: fontFamily,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: _getPoppinsTextTheme(textColor),
    dataTableTheme: _getTableDataThemeData(
      primaryColor,
      scaffoldBackgroundColor,
      textColor,
    ),
    elevatedButtonTheme: _getElevatedButtonThemeData(
      primaryColor,
      Colors.white,
      Colors.white38,
    ),
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      onPrimary: Colors.white,
      outline: Colors.white38,
      onBackground: Color.fromRGBO(36, 38, 44, 1),
    ),
  );
}

_getPoppinsTextTheme(Color textColor) {
  final poppinsTextTheme = GoogleFonts.poppinsTextTheme();
  return poppinsTextTheme.copyWith(
    titleLarge: poppinsTextTheme.titleLarge?.copyWith(color: textColor),
    titleMedium: poppinsTextTheme.titleMedium?.copyWith(color: textColor),
    titleSmall: poppinsTextTheme.titleSmall?.copyWith(color: textColor),
    bodyLarge: poppinsTextTheme.bodyLarge?.copyWith(color: textColor),
    bodyMedium: poppinsTextTheme.bodyMedium?.copyWith(color: textColor),
    bodySmall: poppinsTextTheme.bodySmall?.copyWith(color: textColor),
    headlineLarge: poppinsTextTheme.headlineLarge?.copyWith(color: textColor),
    headlineMedium: poppinsTextTheme.headlineMedium?.copyWith(color: textColor),
    headlineSmall: poppinsTextTheme.headlineSmall?.copyWith(color: textColor),
  );
}

ElevatedButtonThemeData _getElevatedButtonThemeData(
    Color primaryColor, Color foregroundColor, Color borderColor) {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: const MaterialStatePropertyAll<EdgeInsets>(
        EdgeInsets.all(AppConstants.screenPaddingValue / 1.5),
      ),
      side:
          MaterialStatePropertyAll<BorderSide>(BorderSide(color: borderColor)),
      shape: MaterialStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
      ),
      fixedSize: const MaterialStatePropertyAll<Size>(
        Size.fromHeight(AppConstants.widgetHeight),
      ),
      backgroundColor: MaterialStatePropertyAll<Color>(primaryColor),
      foregroundColor: MaterialStatePropertyAll<Color>(foregroundColor),
    ),
  );
}

DataTableThemeData _getTableDataThemeData(
  Color primaryColor,
  Color scaffoldBackgroundColor,
  Color textColor,
) {
  return DataTableThemeData(
    dividerThickness: 2.0,
    headingRowColor: MaterialStatePropertyAll<Color>(primaryColor),
    dataRowColor: MaterialStatePropertyAll<Color>(scaffoldBackgroundColor),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
    ),
    dataTextStyle: TextStyle(
      color: textColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}
