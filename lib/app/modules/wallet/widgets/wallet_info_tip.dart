import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';

class WalletInfoTip extends StatelessWidget {
  const WalletInfoTip({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 4, 15, 24),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.primary.withAlpha(12),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColor.primary.withAlpha(40),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_outline_rounded,
                size: 20,
                color: AppColor.primary.withAlpha(180),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Anda dapat menghubungkan lebih banyak rekening bank atau e-wallet untuk mendapatkan ringkasan keuangan yang lebih akurat.',
                  style: GoogleFonts.manrope(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primary.withAlpha(200),
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
