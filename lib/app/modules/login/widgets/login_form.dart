import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';
import 'package:mobile/app/modules/login/controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColor.text,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller.email,
            decoration: InputDecoration(
              hintText: "Masukkan email",
              prefixIcon: Icon(
                Icons.email_outlined,
                color: AppColor.text.withAlpha(150),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.grey.shade400,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.grey.shade400,
                  width: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Password',
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColor.text,
            ),
          ),
          const SizedBox(height: 8),
          Obx(
            () => TextFormField(
              controller: controller.password,
              obscureText: !controller.isPasswordVisible.value,
              decoration: InputDecoration(
                hintText: "Masukkan password",
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: AppColor.text.withAlpha(150),
                ),
                suffixIcon: IconButton(
                  onPressed: controller.togglePasswordVisibility,
                  icon: Obx(
                    () => Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            onPressed: () => controller.login(),
            child: Obx(
              () => controller.isLoading.value
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Masuk Sekarang',
                          style: GoogleFonts.manrope(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          size: 18,
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
