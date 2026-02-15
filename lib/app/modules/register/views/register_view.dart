import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile/app/modules/register/widgets/register_form.dart';
import 'package:mobile/app/modules/register/widgets/register_sub_title.dart';
import 'package:mobile/app/modules/register/widgets/register_title.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const RegisterTitle(),
            const RegisterSubTitle(),
            const SizedBox(height: 40),
            const RegisterForm(),
            const SizedBox(height: 20),
          ],
        )),
      ),
    );
  }
}
