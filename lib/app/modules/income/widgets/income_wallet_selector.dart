import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';
import 'package:mobile/app/core/utils/color_mapper.dart';
import 'package:mobile/app/core/utils/icon_mapper.dart';
import 'package:mobile/app/modules/income/controllers/income_controller.dart';

class IncomeWalletSelector extends StatelessWidget {
  IncomeWalletSelector({super.key});
  final controller = Get.find<IncomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.account_balance_wallet,
              color: Colors.green,
            ),
            const SizedBox(width: 8),
            Text(
              'Pilih Dompet',
              style: GoogleFonts.manrope(
                fontSize: 16,
                color: AppColor.text,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Obx(
          () => DropdownButtonFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.grey.withAlpha(80),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.green.withAlpha(120),
                  width: 1.2,
                ),
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: const Icon(Icons.keyboard_arrow_down),
            ),
            itemHeight: 70,
            dropdownColor: Colors.white,
            items: controller.wallets.map(
              (wallet) {
                return DropdownMenuItem(
                  alignment: Alignment.centerLeft,
                  value: wallet.id,
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
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
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(wallet.name),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
            onChanged: (value) {
              controller.selectedWalletId.value = value;
            },
          ),
        )
      ],
    );
  }
}
