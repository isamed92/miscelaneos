import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.blue,

      // TextTheme
      textTheme: TextTheme(
        titleSmall: GoogleFonts.montserratAlternates(),
        titleLarge: GoogleFonts.montserratAlternates(),
        titleMedium: GoogleFonts.montserratAlternates(fontSize: 35),
      ),
    );
  }
}
