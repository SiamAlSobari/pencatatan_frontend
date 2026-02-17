import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';
import 'package:mobile/app/core/utils/app_input_border.dart';
import 'package:mobile/app/modules/register/controllers/register_controller.dart';

class RegisterForm extends StatelessWidget {
   RegisterForm({super.key});

    final controller = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nama",
            style: GoogleFonts.manrope(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.text,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              hintText: "Masukkan nama lengkap",
              prefixIcon: Icon(
                Icons.person_outline,
                color: AppColor.text.withAlpha(150),
              ),
              focusedBorder: AppInputBorder.custom(Colors.grey.shade400, 1),
              enabledBorder: AppInputBorder.custom(Colors.grey.shade400, 1),
              focusedErrorBorder: AppInputBorder.custom(Colors.red.shade400, 1),
              errorBorder: AppInputBorder.custom(Colors.red.shade400, 1),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Email",
            style: GoogleFonts.manrope(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.text,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              hintText: "Masukkan email",
              prefixIcon: Icon(
                Icons.email_outlined,
                color: AppColor.text.withAlpha(150),
              ),
              focusedBorder: AppInputBorder.custom(Colors.grey.shade400, 1),
              enabledBorder: AppInputBorder.custom(Colors.grey.shade400, 1),
              focusedErrorBorder: AppInputBorder.custom(Colors.red.shade400, 1),
              errorBorder: AppInputBorder.custom(Colors.red.shade400, 1),
            ),
          ),
          const SizedBox(height: 16),
          Text("Password",
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.text,
              )),
          const SizedBox(height: 8),
          Obx(
            () => TextFormField(
              obscureText: !controller.isPasswordVisible.value,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: controller.togglePasswordVisibility,
                    icon: Obx(
                      () => Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColor.text.withAlpha(150),
                      ),
                    )),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: AppColor.text.withAlpha(150),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                hintText: "Masukkan password",
                focusedBorder: AppInputBorder.custom(Colors.grey.shade400, 1),
                enabledBorder: AppInputBorder.custom(Colors.grey.shade400, 1),
                focusedErrorBorder:
                    AppInputBorder.custom(Colors.red.shade400, 1),
                errorBorder: AppInputBorder.custom(Colors.red.shade400, 1),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              controller.register();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            child: Obx(
              () => controller.isLoading.value
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Daftar Sekarang",
                          style: GoogleFonts.manrope(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
