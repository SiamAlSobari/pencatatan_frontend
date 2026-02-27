import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/modules/expense/widgets/expense_transaction_nominal.dart';
import 'package:mobile/app/modules/expense/widgets/expense_wallet_selector.dart';

import '../controllers/expense_controller.dart';

class ExpenseView extends GetView<ExpenseController> {
  const ExpenseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              ExpenseWalletSelector()
            ],
          ),
        ),
      ),
    );
  }
}
