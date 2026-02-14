import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile/app/modules/splash/widgets/splash_bottom_badge.dart';
import 'package:mobile/app/modules/splash/widgets/splash_center.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F8),
      body: Column(
        children: [Spacer(), SplashCenter(), Spacer(), SplashBottomBadge()],
      ),
    );
  }
}
