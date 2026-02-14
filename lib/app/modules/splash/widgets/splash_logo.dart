import 'package:flutter/material.dart';
import 'package:mobile/app/core/colors/app_color.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 60,
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.error,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
