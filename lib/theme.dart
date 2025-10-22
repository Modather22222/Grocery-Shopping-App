
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Custom Colors based on the user-provided palette
const Color primaryBlue = Color(0xFF2A4BA0);
const Color darkBlue = Color(0xFF153075);
const Color primaryYellow = Color(0xFFF9B023);
const Color lightYellow = Color(0xFFFFC83A);

const Color black100 = Color(0xFF1B262E);
const Color black90 = Color(0xFF354349);
const Color black60 = Color(0xFF606D76);
const Color black45 = Color(0xFFA9B4BC);
const Color black20 = Color(0xFFC5CDD2);
const Color black1 = Color(0xFFF8F9FB);

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setSystemTheme() {
    _themeMode = ThemeMode.system;
    notifyListeners();
  }
}

// Define a common TextTheme using Manrope font
final TextTheme appTextTheme = TextTheme(
  displayLarge: GoogleFonts.manrope(fontSize: 30, fontWeight: FontWeight.bold, color: black100),
  displayMedium: GoogleFonts.manrope(fontSize: 26, fontWeight: FontWeight.bold, color: black100),
  displaySmall: GoogleFonts.manrope(fontSize: 20, fontWeight: FontWeight.bold, color: black100),
  headlineLarge: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.bold, color: black100),
  headlineMedium: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w600, color: black100),
  headlineSmall: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w500, color: black100),
  titleLarge: GoogleFonts.manrope(fontSize: 30, fontWeight: FontWeight.w600, color: black100),
  titleMedium: GoogleFonts.manrope(fontSize: 26, fontWeight: FontWeight.w600, color: black100),
  titleSmall: GoogleFonts.manrope(fontSize: 20, fontWeight: FontWeight.w600, color: black100),
  bodyLarge: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w600, color: black90),
  bodyMedium: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.normal, color: black90),
  bodySmall: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.normal, color: black60),
  labelLarge: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w600, color: black100),
  labelMedium: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w500, color: black90),
  labelSmall: GoogleFonts.manrope(fontSize: 11, fontWeight: FontWeight.normal, color: black60),
);

// Light Theme
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryBlue,
    brightness: Brightness.light,
    secondary: primaryYellow,
  ),
  scaffoldBackgroundColor: black1,
  textTheme: appTextTheme,
  appBarTheme: AppBarTheme(
    backgroundColor: primaryBlue,
    foregroundColor: Colors.white,
    titleTextStyle: GoogleFonts.manrope(fontSize: 22, fontWeight: FontWeight.bold),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: primaryBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ),
);

// Dark Theme
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryBlue,
    brightness: Brightness.dark,
    secondary: lightYellow,
  ),
  scaffoldBackgroundColor: black100,
  textTheme: appTextTheme.apply(bodyColor: black1, displayColor: black1),
  appBarTheme: AppBarTheme(
    backgroundColor: black90,
    foregroundColor: Colors.white,
    titleTextStyle: GoogleFonts.manrope(fontSize: 22, fontWeight: FontWeight.bold),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: black100,
      backgroundColor: primaryYellow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ),
);
