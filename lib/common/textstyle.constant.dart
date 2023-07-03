import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

FontWeight light = FontWeight.w300;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

class TextStyleConstant {
  static TextStyle h1 = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: bold,
  );
  static TextStyle h2 = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: bold,
  );
  static TextStyle h3 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: bold,
  );
  static TextStyle h4 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: bold,
  );
  static TextStyle p1 = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: medium,
  );
}
