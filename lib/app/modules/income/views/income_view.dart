import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/modules/income/widgets/income_category_selector.dart';
import 'package:mobile/app/modules/income/widgets/income_date_selector.dart';
import 'package:mobile/app/modules/income/widgets/income_note_input.dart';
import 'package:mobile/app/modules/income/widgets/income_submit_form.dart';
import 'package:mobile/app/modules/income/widgets/income_transaction_nominal.dart';
import 'package:mobile/app/modules/income/widgets/income_wallet_selector.dart';

import '../controllers/income_controller.dart';

class IncomeView extends GetView<IncomeController> {
  const IncomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // hilangkan bayangan
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent, // TAMBAHKAN INI

        shadowColor: Colors.transparent, // jaga-jaga
        title: Text(
          "Tambah Pemasukan",
          style: GoogleFonts.manrope(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Form(
            key: controller.keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                IncomeTransactionNominal(),
                const SizedBox(height: 30),
                IncomeCategorySelector(),
                const SizedBox(height: 30),
                IncomeWalletSelector(),
                const SizedBox(height: 30),
                IncomeDateSelector(),
                const SizedBox(height: 30),
                IncomeNoteInput(),
                const SizedBox(height: 30),
                IncomeSubmitForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
