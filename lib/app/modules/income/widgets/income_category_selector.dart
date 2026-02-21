import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';
import 'package:mobile/app/core/utils/icon_mapper.dart';
import 'package:mobile/app/modules/income/controllers/income_controller.dart';

class IncomeCategorySelector extends StatelessWidget {
  IncomeCategorySelector({super.key});
  final controller = Get.find<IncomeController>();

  @override
  Widget build(BuildContext context) {
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
              itemCount: controller.categories.length,
              shrinkWrap: true, // penting untuk GridView dalam Column
              physics:
                  const NeverScrollableScrollPhysics(), // agar tidak bisa di-scroll
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 2,
                childAspectRatio: 70 / 90,
              ),
              itemBuilder: (context, index) {
                final isActive = selectedId == controller.categories[index].id;
                final category = controller.categories[index];
                return GestureDetector(
                  onTap: () {
                    controller.selectedCategoryId.value = category.id;
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          width: 70,
                          height: 70,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: isActive
                                ? Colors.green.withAlpha(40)
                                : Colors.grey.withAlpha(40),
                            borderRadius: BorderRadius.circular(20),
                            border: isActive
                                ? Border.all(
                                    color: isActive
                                        ? Colors.green
                                        : Colors.grey.withAlpha(100),
                                    width: 2,
                                  )
                                : null,
                          ),
                          child: Icon(
                            mapIconCategory(category.icon),
                            color: isActive ? Colors.green : Colors.grey,
                            size: 30,
                          )),
                      const SizedBox(height: 4),
                      Text(
                        category.name,
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          color: isActive ? Colors.green : Colors.grey,
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
        ),
        const SizedBox(height: 10),
        Obx(
          () => controller.categories.isEmpty
              ? Text(
                  'Tidak ada kategori tersedia',
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                )
              : const SizedBox.shrink(),
        )
      ],
    );
  }
}
