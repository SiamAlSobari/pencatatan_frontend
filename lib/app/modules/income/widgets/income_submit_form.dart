import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/income/controllers/income_controller.dart';

class IncomeSubmitForm extends StatelessWidget {
  IncomeSubmitForm({super.key});

  final controller = Get.find<IncomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // bikin tombol full-width
      child: ElevatedButton(
        onPressed: () => controller.submitIncome(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF10B981),
          padding: const EdgeInsets.symmetric(
              vertical: 15), // horizontal diatur full-width
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.save, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              'Simpan Pemasukan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
