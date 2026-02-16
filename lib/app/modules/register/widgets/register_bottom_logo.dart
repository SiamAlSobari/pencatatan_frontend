import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';

class RegisterBottomLogo extends StatelessWidget {
  const RegisterBottomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.all(5),
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "FINACEFLOW",
          style: GoogleFonts.manrope(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: AppColor.primary,
          ),
        )
      ],
    );
  }
}
