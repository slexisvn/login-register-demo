// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    foregroundColor: Colors.black,
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 19),
    maximumSize: const Size(double.infinity, 56),
    minimumSize: const Size(double.infinity, 56),
    side: const BorderSide(
      color: Colors.black,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  )),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 19),
      maximumSize: const Size(double.infinity, 56),
      minimumSize: const Size(double.infinity, 56),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    focusColor: Color(0xffF7F8F9),
    fillColor: Color(0xffF7F8F9),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: Color(0xffff4d4f),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: Color(0xffff4d4f),
      ),
    ),
    iconColor: Color(0xff6A707C),
    hintStyle: TextStyle(color: Color(0xff8391A1)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: Color(0xffE8ECF4),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: Color(0xffE8ECF4),
      ),
    ),
  ),
);
