import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';

class LoginSubTitle extends StatelessWidget {
  const LoginSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Prediki keuanganmu dengan lebih',
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColor.text.withAlpha(150),
          ),
        ),
        Text(
          'mudah dan cepat',
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColor.text.withAlpha(150),
          ),
        )
      ],
    );
  }
}
