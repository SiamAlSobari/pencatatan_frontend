import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/routes/app_pages.dart';

class LoginRegisterRedirect extends StatelessWidget {
  const LoginRegisterRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Belum punya akun? ',
          style: TextStyle(
              fontSize: 14, color: const Color(0xFF111318).withAlpha(150)),
        ),
        InkWell(
          onTap: () {
            Get.offAllNamed(Routes.REGISTER);
          },
          child: Text(
            'Daftar sekarang',
            style: TextStyle(fontSize: 14, color: const Color(0xFF1142D4)),
          ),
        )
      ],
    );
  }
}
