import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme =  ThemeData(
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.white,
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false, //to control status bar
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.black87,
    elevation: 0.0,
    type: BottomNavigationBarType.fixed,
  ),
  textTheme: TextTheme(
    subtitle1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontStyle: FontStyle.italic,
    ),
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      color: Colors.blue,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
    ),
  ),
);

ThemeData darkTheme =  ThemeData(
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: HexColor('22303c'),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('22303c'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('22303c'),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('22303c'),
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    elevation: 0.0,
    type: BottomNavigationBarType.fixed,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      color: Colors.blue,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontStyle: FontStyle.italic,
    ),
  ),
);