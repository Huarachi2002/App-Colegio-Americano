import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SccsColors.dart';

class SccsTheme {
  SccsTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: false,

      // Colores principales
      primaryColor: SccsColors.navyBlue,
      primaryColorDark: SccsColors.navyBlue,
      scaffoldBackgroundColor: SccsColors.background,

      // Esquema de colores
      colorScheme: const ColorScheme.light(
        primary: SccsColors.navyBlue,
        onPrimary: SccsColors.white,
        secondary: SccsColors.yellow,
        onSecondary: SccsColors.navyBlue,
        error: SccsColors.red,
        onError: SccsColors.white,
        surface: SccsColors.white,
        onSurface: SccsColors.darkGrey,
      ),

      fontFamily: GoogleFonts.questrial().fontFamily,

      appBarTheme: const AppBarTheme(
        backgroundColor: SccsColors.navyBlue,
        foregroundColor: SccsColors.white,
        elevation: 2,
        centerTitle: true,
        iconTheme: IconThemeData(color: SccsColors.white),
        titleTextStyle: TextStyle(
          color: SccsColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      drawerTheme: const DrawerThemeData(
        backgroundColor: SccsColors.white,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: SccsColors.navyBlue,
          foregroundColor: SccsColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: SccsColors.navyBlue,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: SccsColors.navyBlue,
          side: const BorderSide(color: SccsColors.navyBlue),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: SccsColors.navyBlue, width: 2),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: SccsColors.grey.withOpacity(0.5)),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: SccsColors.red),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: SccsColors.red, width: 2),
        ),
        labelStyle: const TextStyle(color: SccsColors.grey),
        hintStyle: TextStyle(color: SccsColors.grey.withOpacity(0.7)),
        errorStyle: const TextStyle(color: SccsColors.red),
        prefixIconColor: SccsColors.grey,
        suffixIconColor: SccsColors.grey,
      ),

      cardTheme: CardTheme(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      iconTheme: const IconThemeData(
        color: SccsColors.navyBlue,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: SccsColors.navyBlue,
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return SccsColors.navyBlue;
          }
          return null;
        }),
      ),

      // Radio buttons
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return SccsColors.navyBlue;
          }
          return null;
        }),
      ),

      // Floating Action Button
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: SccsColors.navyBlue,
        foregroundColor: SccsColors.white,
      ),

      // SnackBar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: SccsColors.darkGrey,
        contentTextStyle: const TextStyle(color: SccsColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // Progress Indicator
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: SccsColors.navyBlue,
      ),

      // Divider
      dividerTheme: const DividerThemeData(
        color: SccsColors.lightGrey,
        thickness: 1,
      ),
    );
  }
}
