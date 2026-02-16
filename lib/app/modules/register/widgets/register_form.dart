import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';
import 'package:mobile/app/core/utils/app_input_border.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nama",
            style: GoogleFonts.manrope(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.text,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              hintText: "Masukkan nama lengkap",
              prefixIcon: Icon(
                Icons.person_outline,
                color: AppColor.text,
              ),
              focusedBorder: AppInputBorder.custom(Colors.grey.shade400, 1),
              enabledBorder: AppInputBorder.custom(Colors.grey.shade400, 1),
              focusedErrorBorder: AppInputBorder.custom(Colors.red.shade400, 1),
              errorBorder: AppInputBorder.custom(Colors.red.shade400, 1),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Email",
            style: GoogleFonts.manrope(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.text,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              hintText: "Masukkan email",
              prefixIcon: Icon(
                Icons.email_outlined,
                color: AppColor.text,
              ),
              focusedBorder: AppInputBorder.custom(Colors.grey.shade400, 1),
              enabledBorder: AppInputBorder.custom(Colors.grey.shade400, 1),
              focusedErrorBorder: AppInputBorder.custom(Colors.red.shade400, 1),
              errorBorder: AppInputBorder.custom(Colors.red.shade400, 1),
            ),
          ),
          const SizedBox(height: 16),
          Text("Password",
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.text,
              )),
          const SizedBox(height: 8),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_outline,
                color: AppColor.text.withAlpha(150),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              hintText: "Masukkan password",
              focusedBorder: AppInputBorder.custom(Colors.grey.shade400, 1),
              enabledBorder: AppInputBorder.custom(Colors.grey.shade400, 1),
              focusedErrorBorder: AppInputBorder.custom(Colors.red.shade400, 1),
              errorBorder: AppInputBorder.custom(Colors.red.shade400, 1),
            ),
          ),
        ],
      ),
    );
  }
}
