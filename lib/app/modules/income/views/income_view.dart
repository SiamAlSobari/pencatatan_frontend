import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';
import 'package:mobile/app/core/utils/currency_format.dart';

import '../controllers/income_controller.dart';

class IncomeView extends GetView<IncomeController> {
  const IncomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(
            color: Colors.grey.withAlpha(100),
            height: 1,
          ),
        ),
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildTransactionNominalInput(),
              const SizedBox(height: 30),
              _buildCategorySelector(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySelector() {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.category,
              color: Colors.green,
            ),
            const SizedBox(width: 8),
            Text(
              'Pilih Kategori',
              style: GoogleFonts.manrope(
                fontSize: 16,
                color: AppColor.text,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Obx(
          () {
            final selectedId = controller.selectedCategoryId.value;

            return GridView.builder(
              itemCount: 6,
              shrinkWrap: true, // penting untuk GridView dalam Column
              physics:
                  const NeverScrollableScrollPhysics(), // agar tidak bisa di-scroll
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 70 / 90,
              ),
              itemBuilder: (context, index) {
                final isActive = selectedId == index.toString();
                return GestureDetector(
                  onTap: () {
                    controller.selectedCategoryId.value = index.toString();
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: isActive
                              ? Colors.green
                              : Colors.grey.withAlpha(100),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isActive
                                ? Colors.green
                                : Colors.grey.withAlpha(100),
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Kategori ${index + 1}',
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          color: AppColor.text,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2, // biar teks tidak keluar
                        overflow:
                            TextOverflow.ellipsis, // kalau panjang dipotong
                      )
                    ],
                  ),
                );
              },
            );
          },
        )
      ],
    );
  }

  Widget _buildTransactionNominalInput() {
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
          TextField(
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
          )
        ],
      ),
    );
  }
}
