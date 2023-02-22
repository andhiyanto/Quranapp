import 'package:flutter/material.dart';

const appPurple = Color(0XFF863ed5);
const appOrange = Color(0xffF9B091);
const appWhite = Color(0xffFFFFFF);
const appPurpleDark = Color(0xff040C23);
const appPurleIndicator = Color(0xff672CBC);
const appGrey = Color(0xff8789A3);
const appText = Color(0xff240F4F);
const appGreyList = Color(0xff121931);
ThemeData appLight = ThemeData(
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: appPurple,
  ),
  brightness: Brightness.light,
  primaryColor: appPurple,
  // ignore: prefer_const_constructors
  appBarTheme: AppBarTheme(
    backgroundColor: appPurleIndicator,
  ),
);

ThemeData appDark = ThemeData(
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: appWhite,
  ),
  brightness: Brightness.dark,
  primaryColor: appPurple,
  scaffoldBackgroundColor: appPurpleDark,
  // ignore: prefer_const_constructors
  appBarTheme: AppBarTheme(
    backgroundColor: appPurpleDark,
  ),
  // ignore: prefer_const_constructors
  textTheme: TextTheme(),
);
