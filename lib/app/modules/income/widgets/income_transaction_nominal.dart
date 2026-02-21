import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/utils/currency_format.dart';
import 'package:mobile/app/modules/income/controllers/income_controller.dart';

class IncomeTransactionNominal extends StatelessWidget {
  IncomeTransactionNominal({super.key});
  final controller = Get.find<IncomeController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Nominal Pemasukan',
            style: GoogleFonts.manrope(
              fontSize: 14,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller.amountInput,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.withAlpha(80),
                  width: 1,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green.withAlpha(120),
                  width: 1.2,
                ),
              ),
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [CurrencyInputFormatter()],
            style: GoogleFonts.manrope(
              fontSize: 36,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nominal tidak boleh kosong';
              }
              final numericValue = controller.amountValue;
              if (numericValue <= 0) {
                return 'Nominal harus lebih besar dari 0';
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}
