import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/repositories/auth_repository.dart';

class RegisterController extends GetxController {
  final AuthRepository _authRepository;
  RegisterController(this._authRepository);

  final formKey = GlobalKey<FormState>();
  var isPasswordVisible = false.obs;
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

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
    name.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }

  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      isLoading.value = true;
      await _authRepository.register(name.text, email.text, password.text);
      Get.snackbar(
        'Register Berhasil',
        'Anda berhasil mendaftar, silakan login.',
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.snackbar(
        'Register Gagal',
        e.toString().replaceAll('Exception: ', ''),
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
