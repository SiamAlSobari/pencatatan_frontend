import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/utils/currency_format.dart';
import 'package:mobile/app/modules/expense/controllers/expense_controller.dart';

class ExpenseTransactionNominal extends StatelessWidget {
  ExpenseTransactionNominal({super.key});
  final controller = Get.find<ExpenseController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Nominal Pengeluaran',
            style: GoogleFonts.manrope(
              fontSize: 14,
              color: const Color(0xFF64748B),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller.amountInput,
            decoration:  InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.withAlpha(80),
                  width: 1,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red.withAlpha(120),
                  width: 1.2,
                ),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red.withAlpha(120),
                  width: 1.2,
                ),
              ),
            ),
            inputFormatters: [CurrencyInputFormatter()],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              fontSize: 36,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nominal tidak boleh kosong';
              }
              // Lakukan validasi tambahan jika diperlukan, misalnya memastikan nilai lebih besar dari 0
              final numericValue =
                  int.tryParse(value.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
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
