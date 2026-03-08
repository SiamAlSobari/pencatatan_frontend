import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';
import 'package:mobile/app/core/utils/color_mapper.dart';
import 'package:mobile/app/core/utils/currency_format.dart';
import 'package:mobile/app/core/utils/icon_mapper.dart';
import 'package:mobile/app/data/models/wallet_model.dart';
import 'package:mobile/app/modules/wallet/controllers/wallet_controller.dart';

class WalletList extends StatelessWidget {
  WalletList({super.key});

  final controller = Get.find<WalletController>();

  Widget _buildWalletItem(WalletModel wallet) {
    final color = mapWalletColor(wallet.icon);
    final icon = mapIconWallet(wallet.icon);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: color.withAlpha(30),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wallet.name,
                    style: GoogleFonts.manrope(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF111318),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    formatCurrency(wallet.balance),
                    style: GoogleFonts.manrope(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF111318).withAlpha(150),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: AppColor.primary.withAlpha(80),
                  width: 1.2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Kelola',
                style: GoogleFonts.manrope(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 56,
              color: Colors.grey.withAlpha(120),
            ),
            const SizedBox(height: 12),
            Text(
              'Belum ada dompet',
              style: GoogleFonts.manrope(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Tambahkan dompet pertama Anda',
              style: GoogleFonts.manrope(
                fontSize: 13,
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      sliver: Obx(
        () {
          if (controller.isLoading.value) {
            return const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }

          if (controller.wallets.isEmpty) {
            return SliverToBoxAdapter(child: _buildEmptyState());
          }

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: controller.wallets.length,
              (context, index) {
                final wallet = controller.wallets[index];
                return _buildWalletItem(wallet);
              },
            ),
          );
        },
      ),
    );
  }
}
