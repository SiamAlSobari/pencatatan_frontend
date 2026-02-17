import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/services/session_service.dart';
import 'package:mobile/app/core/storages/token_storage.dart';
import 'package:mobile/app/data/models/session_model.dart';
import 'package:mobile/app/data/repositories/login_repository.dart';
import 'package:mobile/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final LoginRepository repository;

  LoginController(this.repository);

  final session = Get.find<SessionService>();
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
      final userSession = SessionModel(
        name: response.body['data']['user']['name'],
        email: response.body['data']['user']['email'],
      );
      session.setUser(userSession);
      Get.snackbar(
        'Login Berhasil',
        'Selamat datang kembali!',
        snackPosition: SnackPosition.TOP,
      );
      Get.offAllNamed(Routes.MAIN);
    } catch (e) {
      Get.snackbar(
        'Login Gagal',
        e.toString(),
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
