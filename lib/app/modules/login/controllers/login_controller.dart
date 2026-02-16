import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/storages/token_storage.dart';
import 'package:mobile/app/data/repositories/login_repository.dart';

class LoginController extends GetxController {
  final LoginRepository repository;

  LoginController(this.repository);

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      isLoading.value = true;
      final response = await repository.login(email.text, password.text);
      final token = response.body['data']['token'].toString();
      await TokenStorage().saveToken(token);

      Get.snackbar(
        'Login Berhasil',
        'Selamat datang kembali!',
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.snackbar(
        'Login Gagal',
        'Silakan periksa kredensial Anda dan coba lagi.',
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
