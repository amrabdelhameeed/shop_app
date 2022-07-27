//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/utils/app_colors.dart';

class AppTheme {
  static Color primary = const Color.fromARGB(255, 189, 45, 105);
  static Color secondary = Colors.blueGrey.shade50;
  static Color white = Colors.white;
  static Color teal400 = Colors.teal.shade400;
  static Color grey400 = Colors.grey.shade400;
  static Color grey600 = Colors.grey.shade600;
  static Color blue = Colors.blue;
  static Color black = Colors.black;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //color primario
    primaryColor: Colors.indigo,

    //Text Theme

    //AppBar Theme
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.black,
      color: Colors.transparent,
      elevation: 0,
      shape: Border(bottom: BorderSide(color: grey400, width: 2)),
    ),
    iconTheme: IconThemeData(color: AppColors.primary),
    primaryIconTheme: IconThemeData(color: AppColors.primary),
    buttonTheme: ButtonThemeData(buttonColor: AppColors.primary),

    scaffoldBackgroundColor: secondary,

    textButtonTheme:
        TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),
    textTheme: ThemeData.light().textTheme.copyWith(
        headline2: ThemeData.light()
            .textTheme
            .headline1!
            .copyWith(fontSize: 80, fontWeight: FontWeight.w300)),
    //Tab Bar
    tabBarTheme: TabBarTheme(
        unselectedLabelColor: Colors.black,
        labelStyle:
            TextStyle(fontSize: 10, color: black, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 10, color: black)),

    //floatingActionButtons
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: blue,
      foregroundColor: white,
      //elevation: 5
    ),

    //elevatedBottons
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            primary: AppTheme.primary,
            // shape: const StadiumBorder(),
            elevation: 0)),

    //Cards
    cardTheme: CardTheme(
      color: white,
      shadowColor: primary,
      elevation: 1,
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    iconTheme: IconThemeData(color: AppColors.primary),
    primaryIconTheme: IconThemeData(color: AppColors.primary),

    //color primario
    primaryColor: white,
    //AppBar Theme
    appBarTheme: AppBarTheme(
      foregroundColor: white,
      color: Colors.transparent,
      elevation: 0,
      // shape: Border(bottom: BorderSide(color: grey400, width: 1)),
    ),
    textTheme: ThemeData.dark().textTheme.copyWith(
        headline2: ThemeData.dark()
            .textTheme
            .headline1!
            .copyWith(fontSize: 80, fontWeight: FontWeight.w300)),
    //Tab Bar
    tabBarTheme: TabBarTheme(
        unselectedLabelColor: white,
        labelStyle:
            TextStyle(fontSize: 10, color: white, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 10, color: white)),

    textButtonTheme:
        TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),
    buttonTheme: ButtonThemeData(buttonColor: AppColors.primary),

    //floatingActionButtons
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: blue,
      foregroundColor: white,
      //elevation: 5
    ),

    //elevatedBottons
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            primary: AppTheme.primary,
            // shape: const StadiumBorder(),
            elevation: 0)),

    //Cards
    cardTheme: CardTheme(
      color: black,
      shadowColor: primary,
      elevation: 1,
    ),
  );
}
