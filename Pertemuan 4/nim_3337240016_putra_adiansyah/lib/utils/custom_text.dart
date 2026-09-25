import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;

  const CustomText({
    super.key,
    required this.text,
    this.size = 14,
    this.weight = FontWeight.normal,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
