import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/expense/controllers/expense_controller.dart';

class ExpenseSubmitForm extends StatelessWidget {
  ExpenseSubmitForm({super.key});

  final controller = Get.find<ExpenseController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // bikin tombol full-width
      child: ElevatedButton(
        onPressed: () => controller.submitExpense(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFEF4444),
          padding: const EdgeInsets.symmetric(
              vertical: 15), // horizontal diatur full-width
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Obx(
          () => controller.isSubmitting.value
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.save, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(
                      'Simpan Pengeluaran',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
