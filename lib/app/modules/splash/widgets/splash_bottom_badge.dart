import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';

class SplashBottomBadge extends StatelessWidget {
  const SplashBottomBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(20),
                blurRadius: 1,
                offset: const Offset(0, 1),
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.lock,
                size: 20,
                color: AppColor.primary,
              ),
              const SizedBox(width: 10),
              Text(
                'Secure & Private',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primary.withAlpha(170),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
