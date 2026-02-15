import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile/app/modules/login/widgets/login_form.dart';
import 'package:mobile/app/modules/login/widgets/login_logo.dart';
import 'package:mobile/app/modules/login/widgets/login_register_redirect.dart';
import 'package:mobile/app/modules/login/widgets/login_sub_title.dart';
import 'package:mobile/app/modules/login/widgets/login_title.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const LoginLogo(),
                const SizedBox(height: 20),
                const LoginTitle(),
                const LoginSubTitle(),
                const SizedBox(height: 40),
                const LoginForm(),
                const SizedBox(height: 20),
                const LoginRegisterRedirect()
              ],
            ),
          ),
        ));
  }
}
