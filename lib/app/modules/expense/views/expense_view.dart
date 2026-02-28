import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/modules/expense/widgets/expense_category_selector.dart';
import 'package:mobile/app/modules/expense/widgets/expense_date_selector.dart';
import 'package:mobile/app/modules/expense/widgets/expense_note_input.dart';
import 'package:mobile/app/modules/expense/widgets/expense_transaction_nominal.dart';
import 'package:mobile/app/modules/expense/widgets/expense_wallet_selector.dart';

import '../controllers/expense_controller.dart';

class ExpenseView extends GetView<ExpenseController> {
  const ExpenseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // hilangkan bayangan
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent, // TAMBAHKAN INI
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.withAlpha(30),
          ),
        ),
        shadowColor: Colors.transparent, // jaga-jaga
        title: Text(
          "Tambah Pengeluaran",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              ExpenseTransactionNominal(),
              const SizedBox(height: 30),
              ExpenseCategorySelector(),
              const SizedBox(height: 30),
              ExpenseWalletSelector(),
              const SizedBox(height: 30),
              ExpenseDateSelector(),
              const SizedBox(height: 30),
              ExpenseNoteInput(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
