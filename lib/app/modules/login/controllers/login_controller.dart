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

  Future<void> login() async {
    try {
      isLoading.value = true;
      final response = await repository.login(email.text, password.text);
      final token = response.body['data']['token'];
      await TokenStorage().saveToken(token);
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
          'Login Failed', 'Please check your credentials and try again.',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
