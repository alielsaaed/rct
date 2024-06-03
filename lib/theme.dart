import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rct/constants/constants.dart';

ThemeData theme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      secondary: secondaryColor,
      background: whiteBackGround,
      primary: primaryColor,
    ),
    useMaterial3: true,
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: TextTheme(
      // Title XLarge
      displayLarge: GoogleFonts.inter(
        fontSize: 34,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.21, // Leading point of 41px (41/34)
      ),
      // Title Large
      displayMedium: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.21, // Leading point of 34px (34/28)
      ),
      // Title Medium
      displaySmall: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.25, // Leading point of 30px (30/24)
      ),
      // Title Small
      headlineMedium: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.36, // Leading point of 30px (30/22)
      ),
      // Headline Large
      headlineSmall: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.3, // Leading point of 26px (26/20)
      ),
      // Headline Small
      titleLarge: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.33, // Leading point of 24px (24/18)
      ),
      // Subhead Large
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.25, // Leading point of 20px (20/16)
      ),
      // Subhead Small
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.29, // Leading point of 18px (18/14)
      ),
      // Body Large
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        height: 1.5, // Leading point of 24px (24/16)
      ),
      // Body Medium
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.57, // Leading point of 22px (22/14)
      ),
      // Body Small
      labelLarge: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.5, // Leading point of 18px (18/12)
      ),
      // Label Large
      bodySmall: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.5, // Leading point of 24px (24/16)
      ),
      // Label Medium
      labelMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.29, // Leading point of 18px (18/14)
      ),
      // Label Small
      labelSmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.33, // Leading point of 16px (16/12)
      ),
    ),
  );
}
