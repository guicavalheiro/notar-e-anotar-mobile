import 'package:flutter/material.dart';

// Styles used constantly all over application

// Theme colors
const primary = Color.fromRGBO(0x62, 0xA0, 0xA0, 1);
const primaryFaded = Color.fromRGBO(0xC7, 0xE4, 0xDF, 1);
const primaryAccent = Color.fromRGBO(0x3B, 0x84, 0x82, 1);
const primaryListTile = Color.fromRGBO(0x27, 0xA3, 0x9E, 1);
const grey = Color.fromRGBO(0x94, 0x90, 0x90, 1);
const backgroundWhite = Colors.white;
const primaryDark = Color.fromRGBO(0x16, 0x73, 0x6F, 1);
const transparentGrey = Color.fromRGBO(0x00, 0x00, 0x00, 0.33);
const backgroundGrey = Color.fromRGBO(0xEF, 0xEE, 0xEE, 1);
const lightGradientFirstColor = Color.fromRGBO(0x27, 0xA3, 0x9E, 1);
const lightGradientSecondColor = Color.fromRGBO(0x3A, 0xC1, 0xC1, 1);

const darkestGreen = Color.fromRGBO(0x3A, 0x69, 0x69, 1);

// Complex visual elements
const shadowColor = Color.fromRGBO(0x00, 0x00, 0x00, 0.15);
const cardShadowColor = Color.fromRGBO(0x00, 0x00, 0x00, 0.04);
const innerShadowColor = Color.fromRGBO(0x00, 0x00, 0x00, 0.05);

final mainBoxShadow = [
  const BoxShadow(color: shadowColor, blurRadius: 4, offset: Offset(1, 2))
];

final cardBoxShadow = [
  const BoxShadow(color: cardShadowColor, blurRadius: 18, offset: Offset(0, 4))
];

final listBoxShadow = [
  BoxShadow(
      color: Colors.black.withOpacity(0.12),
      blurRadius: 50,
      spreadRadius: 4,
      offset: Offset(3, 3)),
];

final bottomSheetShadow = [
  const BoxShadow(color: cardShadowColor, blurRadius: 5, offset: Offset(-2, -4))
];

final inwardBoxShadow = [
  const BoxShadow(color: innerShadowColor),
  const BoxShadow(
    color: Colors.white,
    spreadRadius: -2.0,
    blurRadius: 6.0,
  ),
];

const lightGradient = LinearGradient(
  colors: [lightGradientFirstColor, lightGradientSecondColor],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const mainGreenGradient = LinearGradient(
  colors: [primaryAccent, lightGradientFirstColor],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

// Spacing constants
const double kBottomSheetHeight = 78.0;
const double kTitleTopPadding = 16.0;
