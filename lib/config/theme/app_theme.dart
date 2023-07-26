import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.blue,

      //text theme
      textTheme: TextTheme(
        titleLarge: GoogleFonts.montserratAlternates(),
        titleMedium: GoogleFonts.montserratAlternates(fontSize: 35),

        //for any reason this body fonts are working with the text theme
        bodyLarge: GoogleFonts.montserratAlternates(fontSize: 35),
        bodyMedium: GoogleFonts.montserratAlternates(),
      ));
}
