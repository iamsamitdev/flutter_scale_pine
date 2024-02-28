import 'package:flutter/material.dart';
import 'package:flutter_scale/themes/colors.dart';

class AppTheme {
  // Light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    primaryColor: primary,
    primaryColorDark: primaryDark,
    primaryColorLight: primaryLight,
    hoverColor: divider,
    hintColor: primaryDark,
    colorScheme: const ColorScheme.light(primary: primary)
  );
}