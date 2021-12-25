import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = _lightTheme;
  static ThemeData darkTheme = _darkTheme;
}

ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: GoogleFonts.robotoTextTheme(),
  scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,
  // appBarTheme: const AppBarTheme(color: AppColor.transparent),
);
//robotoTextTheme
//indieFlowerTextTheme
ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: GoogleFonts.robotoTextTheme(),
  //appBarTheme: const AppBarTheme(color: AppColor.transparent),
);
