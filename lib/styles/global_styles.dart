import 'package:flutter/material.dart';

// Styles used constantly all over application

// Theme colors
const primary = Color.fromRGBO(0x62, 0xA0, 0xA0, 1);
const primaryFaded = Color.fromRGBO(0xC7, 0xE4, 0xDF, 1);
const primaryBlue = Color.fromRGBO(0x38, 0xa8, 0xc0, 1);
const primaryFadedLight = Color.fromRGBO(0xE0, 0xF0, 0xED, 1);
const primaryAccent = Color.fromRGBO(0x3B, 0x84, 0x82, 1);
const primaryListTile = Color.fromRGBO(0x27, 0xA3, 0x9E, 1);
const greyCard = Color.fromRGBO(0xF5, 0xF5, 0xF5, 1);
const grey = Color.fromRGBO(0x81, 0x81, 0x81, 1);
const lightGrey = Color.fromRGBO(0xF2, 0xF2, 0xF2, 1);
const backgroundWhite = Colors.white;
const primaryDark = Color.fromRGBO(0x16, 0x73, 0x6F, 1);
const transparentGrey = Color.fromRGBO(0x00, 0x00, 0x00, 0.33);
const backgroundGrey = Color.fromRGBO(0xEF, 0xEE, 0xEE, 1);
const lightGradientFirstColor = Color.fromRGBO(0x27, 0xA3, 0x9E, 1);
const lightGradientSecondColor = Color.fromRGBO(0x3A, 0xC1, 0xC1, 1);
const blueishGreen = Color.fromRGBO(0x38, 0xA8, 0xC0, 1);
const washedRed = Color.fromRGBO(0xCE, 0x6B, 0x7D, 1.0);
const greyHeadLine = Color.fromRGBO(0x7D, 0x7D, 0x7D, 1.0);

const darkWashedRed = Color.fromRGBO(0x9C, 0x36, 0x49, 1.0);
const darkBlueishGreen = Color.fromRGBO(0x1D, 0x58, 0x65, 1.0);

const lightPrimary = Color.fromRGBO(0x61, 0x9f, 0x9f, 1);
const DarkPrimary = Color.fromRGBO(0x39, 0x63, 0x63, 1);

const lightPrimaryBlue = Color.fromRGBO(0xC7, 0xF0, 0xf9, 1);

const lighterGrey = Color.fromRGBO(0xbf, 0xbf, 0xbf, 1);

const darkestGreen = Color.fromRGBO(0x3A, 0x69, 0x69, 1);
const darkGreen = Color.fromRGBO(0x47, 0x8B, 0x8A, 1);

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
