import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/repositories/register_repository.dart';

class RegisterController extends GetxController {
  final RegisterRepository repository;
  RegisterController(this.repository);


  final formKey = GlobalKey<FormState>();
  var isPasswordVisible = false.obs;
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

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
}
