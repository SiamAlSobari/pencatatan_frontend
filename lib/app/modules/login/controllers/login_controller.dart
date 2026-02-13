import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/providers/login_provider.dart';
import 'package:mobile/app/data/repositories/login_repository.dart';

class LoginController extends GetxController {
  late LoginRepository repository;
  final count = 0.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  var isLoading = false.obs;

  @override
  void onInit() {
     repository = LoginRepository(LoginProvider());
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

  void increment() => count.value++;

  Future<void> login() async {
    try {
      isLoading.value = true;
      final response = await repository.login({'email': email.text, 'password': password.text});
      if (response.statusCode == 200) {
        debugPrint("Login successful: ${response.body['data']['token']}");
        Get.snackbar("Success", "Login successful!");
        Get.offAllNamed('/main');
      } else {
        Get.snackbar("Error", "Login failed: ${response.statusText}");
      }
    } catch (e) {
      Get.snackbar("Error", "Login failed: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
