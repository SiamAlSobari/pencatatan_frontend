import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile/app/core/colors/app_color.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Image.asset('assets/images/icon.png',
                      height: 60,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                            Icons.error,
                            color: Colors.white,
                          )),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Finance',
                    style: Goo(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary),
                  ),
                  Text(
                    'Flow',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary.withAlpha(150),
                    ),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
