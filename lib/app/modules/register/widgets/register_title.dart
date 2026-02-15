import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';

class RegisterTitle extends StatelessWidget {
  const RegisterTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Buat Akun Baru",
      style: GoogleFonts.manrope(
        fontSize: 24,
        fontWeight: FontWeight.w900,
        color: AppColor.text,
      ),
    );
  }
}
