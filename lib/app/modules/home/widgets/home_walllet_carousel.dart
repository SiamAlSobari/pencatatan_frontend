import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';
import 'package:mobile/app/core/utils/color_mapper.dart';
import 'package:mobile/app/core/utils/currency_format.dart';
import 'package:mobile/app/core/utils/icon_mapper.dart';
import 'package:mobile/app/data/models/wallet_model.dart';
import 'package:mobile/app/modules/home/controllers/home_controller.dart';

class HomeWallletCarousel extends StatelessWidget {
  HomeWallletCarousel({super.key});

  final controller = Get.find<HomeController>();

  Widget _buildWalletCard(WalletModel wallet) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 200,
        height: 130,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: mapWalletColor(wallet.icon).withAlpha(30),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    mapIconWallet(wallet.icon),
                    color: mapWalletColor(wallet.icon),
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                wallet.name,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.text.withAlpha(170),
                ),
              ),
              Expanded(
                  child: Row(
                children: [
                  Text(
                    'Saldo: ',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      color: AppColor.text.withAlpha(150),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      formatCurrency(wallet.balance),
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColor.text,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dompet Saya',
                  style: GoogleFonts.manrope(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Lihat Semua',
                    style: GoogleFonts.manrope(
                        fontSize: 12,
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: Obx(
                () {
                  if (controller.wallets.isEmpty) {
                    return Center(
                      child: Text(
                        'Tidak ada dompet tersedia',
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.wallets.length,
                    itemBuilder: (context, index) {
                      final wallet = controller.wallets[index];
                      return Align(
                        alignment: Alignment.topCenter,
                        child: _buildWalletCard(wallet),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
