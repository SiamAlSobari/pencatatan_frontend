import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';

class SplashSubTitle extends StatelessWidget {
  const SplashSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Your Money, Simplified',
      style: GoogleFonts.manrope(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: AppColor.primary.withAlpha(150)),
    );
  }
}
