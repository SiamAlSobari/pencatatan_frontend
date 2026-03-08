import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';
import 'package:mobile/app/core/utils/currency_format.dart';
import 'package:mobile/app/modules/wallet/controllers/wallet_controller.dart';

class WalletTotalBalanceCard extends StatelessWidget {
  WalletTotalBalanceCard({super.key});

  final controller = Get.find<WalletController>();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.primary,
                AppColor.primary.withBlue(220).withRed(30),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColor.primary.withAlpha(80),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Saldo Gabungan',
                  style: GoogleFonts.manrope(
                    color: Colors.white.withAlpha(210),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => Text(
                    formatCurrency(controller.totalBalance),
                    style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(height: 14),
                Obx(
                  () => Row(
                    children: [
                      //  _buildToggle(),
                      const SizedBox(width: 10),
                      Text(
                        'Tersebar di ${controller.walletCount} Dompet',
                        style: GoogleFonts.manrope(
                          color: Colors.white.withAlpha(220),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildToggle() {
  //   return Obx(
  //     () => GestureDetector(
  //       onTap: controller.toggleActiveFilter,
  //       child: AnimatedContainer(
  //         duration: const Duration(milliseconds: 250),
  //         width: 44,
  //         height: 24,
  //         decoration: BoxDecoration(
  //           color: controller.showActiveOnly.value
  //               ? Colors.white.withAlpha(80)
  //               : Colors.white.withAlpha(30),
  //           borderRadius: BorderRadius.circular(12),
  //           border: Border.all(
  //             color: Colors.white.withAlpha(150),
  //             width: 1.5,
  //           ),
  //         ),
  //         child: Stack(
  //           alignment: Alignment.center,
  //           children: [
  //             AnimatedAlign(
  //               duration: const Duration(milliseconds: 250),
  //               curve: Curves.easeInOut,
  //               alignment: controller.showActiveOnly.value
  //                   ? Alignment.centerRight
  //                   : Alignment.centerLeft,
  //               child: Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 3),
  //                 child: Container(
  //                   width: 18,
  //                   height: 18,
  //                   decoration: const BoxDecoration(
  //                     color: Colors.white,
  //                     shape: BoxShape.circle,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
