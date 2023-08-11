import 'dart:ui';

import 'package:flutter/material.dart';

const primarycolor=Color(0xFF9775FA);
const Color kDarkBackgroundColor = Color(0xff1B262C);
const Color kDarkNormalTextColor = Color(0xffF5F8FB);
const Color kDarkTextFieldHintColor = Color(0xffF5F8FB);
const Color accentColor = Color(0xFF9775F6);

final darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: kDarkBackgroundColor,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: kDarkNormalTextColor),
    bodyMedium: TextStyle(color: kDarkNormalTextColor),
    bodySmall: TextStyle(color: kDarkNormalTextColor),
    headlineMedium: TextStyle(color: kDarkNormalTextColor),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(color: kDarkTextFieldHintColor),

  ),
);
