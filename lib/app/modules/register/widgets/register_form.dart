import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration:
                const InputDecoration(hintText: "Masukkan nama lengkap"),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(hintText: "Masukkan email"),
          ),
          const SizedBox(height: 16),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(hintText: "Masukkan password"),
          ),
        ],
      ),
    );
  }
}
