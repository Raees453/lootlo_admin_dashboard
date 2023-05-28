import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lootlo_app_admin_dash/utils/constants.dart';

ThemeData lightTheme() {
  const textColor = Colors.black87;

  const primaryColor = Color.fromRGBO(72, 157, 154, 1);
  const scaffoldBackgroundColor = Color.fromRGBO(249, 250, 251, 1);

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: _getPoppinsTextTheme(textColor),
    fontFamily: GoogleFonts.poppins().fontFamily,
    primaryColor: primaryColor,
    primaryColorLight: primaryColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    iconTheme: const IconThemeData(color: Colors.white),
    dataTableTheme: const DataTableThemeData(
      dividerThickness: 2.0,
      headingRowColor: MaterialStatePropertyAll<Color>(primaryColor),
      dataRowColor: MaterialStatePropertyAll<Color>(Colors.white),
      horizontalMargin: 200,
    ),
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      primary: primaryColor,
      onPrimary: Colors.white,
    ),
  );
}

ThemeData darkTheme() {
  const textColor = Colors.white;

  const primaryColor = Color.fromRGBO(26, 28, 34, 1);
  const scaffoldBackgroundColor = Color.fromRGBO(18, 19, 23, 1);
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: _getPoppinsTextTheme(textColor),
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    iconTheme: const IconThemeData(color: Colors.white),
    dataTableTheme: DataTableThemeData(
      dividerThickness: 2.0,
      headingRowColor: const MaterialStatePropertyAll<Color>(primaryColor),
      dataRowColor:
          const MaterialStatePropertyAll<Color>(scaffoldBackgroundColor),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      dataTextStyle: TextStyle(
        color: Colors.grey,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      onPrimary: Colors.white,
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
