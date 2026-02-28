import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/modules/expense/controllers/expense_controller.dart';

class ExpenseDateSelector extends StatelessWidget {
  ExpenseDateSelector({super.key});
  final controller = Get.find<ExpenseController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.calendar_month,
              color: Colors.red,
            ),
            const SizedBox(width: 8),
            Text(
              'Pilih Tanggal',
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Obx(
          () => TextFormField(
            onTap: () => controller.pickDate(Get.context!),
            readOnly: true,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.withAlpha(80),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red.withAlpha(120),
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              suffixIcon: const Icon(Icons.calendar_today_outlined),
            ),
            controller: TextEditingController(
              text: controller.selectedDate.value != null
                  ? '${controller.selectedDate.value!.day}/${controller.selectedDate.value!.month}/${controller.selectedDate.value!.year}'
                  : '',
            ),
            validator: (value) => controller.selectedDate.value == null
                ? 'Tanggal harus dipilih'
                : null,
          ),
        )
      ],
    );
  }
}
