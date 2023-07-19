import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget inputCode(String hint, bool obscure, TextEditingController controller) {
  return Container(
    height: 40,
    padding: const EdgeInsets.only(left: 20, right: 20),
    alignment: Alignment.center,
    child: TextField(
      controller: controller,
      cursorColor: Colors.white,
      obscureText: obscure,
      style: GoogleFonts.montserrat(
          textStyle: const TextStyle(fontSize: 14, color: Colors.white)),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFF11171e),
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFF11171e),
            )),
        filled: true,
        fillColor: const Color(0xFF11171e),
        hintStyle: GoogleFonts.montserrat(
            textStyle: const TextStyle(fontSize: 14, color: Colors.white)),
        hintText: hint,
      ),
    ),
  );
}
