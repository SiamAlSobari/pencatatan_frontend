import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';
import 'package:mobile/app/core/utils/color_mapper.dart';
import 'package:mobile/app/core/utils/currency_format.dart';
import 'package:mobile/app/core/utils/icon_mapper.dart';
import 'package:mobile/app/data/models/transaction_model.dart';
import 'package:mobile/app/modules/home/controllers/home_controller.dart';

class HomeTransactionHistoryList extends StatelessWidget {
  HomeTransactionHistoryList({super.key});
  final controller = Get.find<HomeController>();
  Widget _buildTransactionHistoryCard(TransactionModel transaction) {
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: mapCategoryColor(transaction.category?.icon ?? 'default')
                    .withAlpha(30),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Icon(
                  mapIconCategory(transaction.category?.icon ?? 'default'),
                  size: 24,
                  color:
                      mapCategoryColor(transaction.category?.icon ?? 'default')
                          .withAlpha(200),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.note,
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: mapCategoryColor(
                                      transaction.category?.icon ?? 'default')
                                  .withAlpha(30),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              transaction.category?.name ?? 'Uncategorized',
                              style: GoogleFonts.manrope(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            transaction.createdAt
                                .toLocal()
                                .toString()
                                .split(' ')[0],
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    child: Text(
                      transaction.type == 'INCOME'
                          ? '+ ${formatCurrency(transaction.amount)}'
                          : '- ${formatCurrency(transaction.amount)}',
                      style: GoogleFonts.manrope(
                          fontSize: 14,
                          color: transaction.type == 'INCOME'
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      textWidthBasis: TextWidthBasis.longestLine,
                      textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: false,
                        applyHeightToLastDescent: false,
                      ),
                    ),
                  ),
                ],
              ),
            )
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
          if (controller.transactionsRecent.isEmpty) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Icon(
                      Icons.history,
                      size: 50,
                      color: AppColor.text.withAlpha(150),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Belum ada transaksi',
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        color: AppColor.text.withAlpha(150),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: controller.transactionsRecent.length,
              (context, index) {
                final transaction = controller.transactionsRecent[index];
                return _buildTransactionHistoryCard(transaction);
              },
            ),
          );
        },
      ),
    );
  }
}
