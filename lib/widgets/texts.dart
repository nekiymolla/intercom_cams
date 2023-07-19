import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget mainText(String text, Color textColor) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: GoogleFonts.roboto(
      color: textColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget simpleText(String text, Color textColor) {
  return Text(
    text,
    style: GoogleFonts.roboto(
      color: textColor,
      fontSize: 16,
    ),
  );
}
