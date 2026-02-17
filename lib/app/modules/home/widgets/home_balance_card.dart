import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';
import 'package:mobile/app/core/utils/currency_format.dart';
import 'package:mobile/app/modules/home/controllers/home_controller.dart';

class HomeBalanceCard extends StatelessWidget {
  HomeBalanceCard({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Container(
            height: 170,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(50),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Saldo Seluruh Dompet',
                    style: GoogleFonts.manrope(
                      color: Colors.white.withAlpha(200),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Obx(
                    () => Text(
                      formatCurrency(
                          controller.walletSummary.value?.totalBalance ?? 0),
                      style: GoogleFonts.manrope(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.white.withAlpha(100))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () {
                          if (controller.walletSummary.value?.trend == 'Up') {
                            return Row(
                              children: [
                                Icon(
                                  Icons.trending_up,
                                  color: Colors.greenAccent,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${controller.walletSummary.value?.presentase}%',
                                  style: GoogleFonts.manrope(
                                    color: Colors.greenAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
                          } else if (controller.walletSummary.value?.trend ==
                              'Down') {
                            return Row(
                              children: [
                                Icon(
                                  Icons.trending_down,
                                  color: Colors.redAccent,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${controller.walletSummary.value?.presentase.toStringAsFixed(2)}%',
                                  style: GoogleFonts.manrope(
                                    color: Colors.redAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            );
                          }
                          return Text(
                            'Stabil',
                            style: TextStyle(
                              color: Colors.white.withAlpha(200),
                              fontSize: 14,
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Obx(
                          () => Text(
                            formatCurrency(
                                controller.walletSummary.value?.totalBalance ??
                                    0),
                            style: GoogleFonts.manrope(
                              color: Colors.white.withAlpha(200),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8), 
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(30),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: Text(
                            'Detail Analisis',
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
