import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';

class SplashTitle extends StatefulWidget {
  const SplashTitle({super.key});

  @override
  State<SplashTitle> createState() => _SplashTitleState();
}

class _SplashTitleState extends State<SplashTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Finance',
          style: GoogleFonts.manrope(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: AppColor.primary),
        ),
        Text(
          'Flow',
          style: GoogleFonts.manrope(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: AppColor.primary.withAlpha(150),
          ),
        ),
      ],
    );
  }
}
