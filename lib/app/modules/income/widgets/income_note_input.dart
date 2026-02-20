import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/modules/income/controllers/income_controller.dart';

class IncomeNoteInput extends StatelessWidget {
  IncomeNoteInput({super.key});
  final controller = Get.find<IncomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.note_alt_outlined,
              color: Colors.green,
            ),
            const SizedBox(width: 8),
            Text(
              'Catatan',
              style: GoogleFonts.manrope(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Masukkan catatan (opsional)",
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
          maxLines: 3,
        )
      ],
    );
  }
}
