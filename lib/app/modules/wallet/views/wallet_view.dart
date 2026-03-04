import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';

import '../controllers/wallet_controller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "INI WALLET",
        style: GoogleFonts.manrope(
          fontSize: 16,
          color: AppColor.primary,
        ),
      ),
    );
  }
}
