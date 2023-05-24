import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// import 'package:goole_fonts/google_fonts.dart';
class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.lightGreen,
      // fontFamily:
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        // textTheme: Theme.of(context).textTheme,
      ));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        // fontFamily:
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray800;
  static Color darkColor = Color.fromARGB(255, 3, 102, 168);
  static Color darkbluishColor = Vx.purple400;
}
