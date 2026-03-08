import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';
import 'package:mobile/app/modules/wallet/controllers/wallet_controller.dart';

class WalletListHeader extends StatelessWidget {
  WalletListHeader({super.key});

  final controller = Get.find<WalletController>();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Daftar Dompet',
              style: GoogleFonts.manrope(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF111318),
              ),
            ),
            // Obx(
            //   () => GestureDetector(
            //     onTap: controller.toggleActiveFilter,
            //     child: AnimatedContainer(
            //       duration: const Duration(milliseconds: 200),
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 14,
            //         vertical: 6,
            //       ),
            //       decoration: BoxDecoration(
            //         color: controller.showActiveOnly.value
            //             ? AppColor.primary.withAlpha(15)
            //             : Colors.grey.withAlpha(20),
            //         borderRadius: BorderRadius.circular(20),
            //         border: Border.all(
            //           color: controller.showActiveOnly.value
            //               ? AppColor.primary.withAlpha(80)
            //               : Colors.grey.withAlpha(60),
            //           width: 1.2,
            //         ),
            //       ),
            //       child: Text(
            //         controller.showActiveOnly.value ? 'Aktif' : 'Semua',
            //         style: GoogleFonts.manrope(
            //           fontSize: 13,
            //           fontWeight: FontWeight.w600,
            //           color: controller.showActiveOnly.value
            //               ? AppColor.primary
            //               : Colors.grey.shade600,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              child: Text(
                "Aktif",
                style:
                    GoogleFonts.manrope(fontSize: 13, color: AppColor.primary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
