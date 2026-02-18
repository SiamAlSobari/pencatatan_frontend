import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/income_controller.dart';

class IncomeView extends GetView<IncomeController> {
  const IncomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Tambah Pemasukan",
          style: GoogleFonts.manrope(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'IncomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
