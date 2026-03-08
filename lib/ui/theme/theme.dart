// @dart=3.11
import 'package:flutter/material.dart';

const primaryColor = Color(0xffc45691);
final themeData = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Color(0xfff1f3ef),
  colorScheme: .fromSeed(seedColor: primaryColor),
  textTheme: TextTheme(
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  ),
  dividerTheme: DividerThemeData(color: Colors.grey.withAlpha(50)),
);
