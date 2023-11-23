import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EasyText extends StatelessWidget {
  const EasyText({
    super.key,
    required this.text,
    required this.fs,
    this.fw = FontWeight.bold,
    this.color = Colors.white,
    required this.h,
  });
  final String text;
  final Color color;
  final double fs;
  final FontWeight fw;
  final double h;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fs,
        fontWeight: fw,
        height: h,
      ),
    );
  }
}
