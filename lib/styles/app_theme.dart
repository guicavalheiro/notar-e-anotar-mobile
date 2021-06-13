import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

final appTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: primary,
  accentColor: primaryAccent,
  backgroundColor: Colors.white,
  shadowColor: shadowColor,
  appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.white,
      foregroundColor: primary,
      iconTheme: IconThemeData(color: primary)),

  // Define the default font family.
  fontFamily: 'Baloo 2',

  //MEXER AQUI PRA ALTERAR A BOSTA DO SLIDER
  //sliderTheme: SliderThemeData(color: Colors.red),

  visualDensity: VisualDensity.standard,
  cardTheme: CardTheme(
      clipBehavior: Clip.none,
      elevation: 3.0,
      shadowColor: transparentGrey,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
  bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      elevation: 3.0,
      modalElevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      )),

  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    visualDensity: VisualDensity.standard,
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return primaryFaded;
      } else {
        return primary;
      }
    }),
    foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return primaryDark;
      } else {
        return Colors.white;
      }
    }),
    overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.5)),
    textStyle: MaterialStateProperty.all(TextStyle(
        fontFamily: 'Baloo 2',
        letterSpacing: 1.25,
        fontWeight: FontWeight.w500,
        fontSize: 18.0)),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    visualDensity: VisualDensity.standard,
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
    backgroundColor: MaterialStateProperty.all(Colors.white),
    overlayColor: MaterialStateProperty.all(primaryAccent.withOpacity(0.5)),
    foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return Colors.white;
      } else {
        return primaryDark;
      }
    }),
    side: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return BorderSide(color: Colors.white);
      } else {
        return BorderSide(color: primaryDark);
      }
    }),
    textStyle: MaterialStateProperty.all(TextStyle(
        fontFamily: 'Baloo 2',
        letterSpacing: 1.25,
        fontWeight: FontWeight.w500,
        fontSize: 18.0)),
  )),

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline3: TextStyle(
        fontSize: 20.0,
        height: 1.4,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'Roboto',
        letterSpacing: 1.25),
    headline4: TextStyle(fontSize: 36.0, fontStyle: FontStyle.normal),
    headline5: TextStyle(
        color: primaryDark, fontWeight: FontWeight.w500, fontSize: 20),
    headline6:
        TextStyle(color: primary, fontWeight: FontWeight.w300, fontSize: 20),
    bodyText1: TextStyle(color: Colors.white, fontSize: 20.0),
    bodyText2: TextStyle(color: Colors.white, fontSize: 14.0),
    subtitle1: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
        fontFamily: 'Roboto'),
    subtitle2: TextStyle(color: Colors.grey, fontSize: 13.0),
  ),
);

// Custom app theme
