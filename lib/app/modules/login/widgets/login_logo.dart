import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/app/core/colors/app_color.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(
          'assets/images/logo.png',
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.error,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
