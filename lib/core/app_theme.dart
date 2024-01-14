import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xff082659);
const secondaryColor = Color(0xff51eec2);

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
  ),
  textTheme: GoogleFonts.montserratTextTheme(),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
  ),
);
