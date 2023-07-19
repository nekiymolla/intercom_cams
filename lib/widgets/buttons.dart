import 'dart:io';

import 'package:cams/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';

import '../data/token.dart';

//button to open door

class UniversalButton extends StatelessWidget {
  UniversalButton({
    super.key,
    this.onPressed,
    required this.fillColor,
    required this.label,
    required this.fontColor,
  });

  Function()? onPressed;
  String label;
  Color fontColor;
  Color fillColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(fillColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ))),
      child: Text(
        label,
        style: GoogleFonts.roboto(color: fontColor),
      ),
    );
  }
}
