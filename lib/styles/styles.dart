// ignore_for_file: public_member_api_docs, constant_identifier_names

import 'package:flutter/material.dart';

///
/// A class that contains static constants for spacing values using a grid of 8.
class Insets {
  /// A small amount of spacing, equivalent to 3/8 of a grid unit.
  static const double xsmall = 3;

  /// A standard amount of spacing, equivalent to 4/8 or 1/2 of a grid unit.
  static const double small = 4;

  /// A medium amount of spacing, equivalent to 5/8 of a grid unit.
  static const double medium = 5;

  /// A large amount of spacing, equivalent to 10/8 or 1 and 1/4 grid units.
  static const double large = 10;

  /// An extra large amount of spacing, equivalent to 20/8 or 2 and 1/2 grid units.
  static const double extraLarge = 20;
}

///
class Fonts {
  static const String raleway = 'Raleway';
  static const String quicksand = 'Quicksand';
  static const String roboto = 'Roboto';
  static const String montserrat = 'Montserrat';
  static const String lato = 'Lato';
  static const String playfairDisplay = 'Playfair Display';
  static const String merriweather = 'Merriweather';
  static const String openSans = 'Open Sans';
  static const String sourceSansPro = 'Source Sans Pro';
  static const String alegreya = 'Alegreya';
}

///
class TextStyles {
  /// [raleway]
  static const TextStyle raleway = TextStyle(fontFamily: Fonts.raleway);

  /// buttonText1
  static TextStyle buttonText1 =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 14);

  /// buttonText2
  static TextStyle buttonText2 =
      const TextStyle(fontWeight: FontWeight.normal, fontSize: 11);

  /// h1
  static TextStyle h1 =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 22);

  /// h2
  static TextStyle h2 =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  /// body1
  static TextStyle body1 = raleway.copyWith(color: const Color(0xFF42A5F5));
}

enum ScreenSize { Small, Normal, Large, ExtraLarge }

ScreenSize getSize(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.shortestSide;
  if (deviceWidth > 900) return ScreenSize.ExtraLarge;
  if (deviceWidth > 600) return ScreenSize.Large;
  if (deviceWidth > 300) return ScreenSize.Normal;
  return ScreenSize.Small;
}
