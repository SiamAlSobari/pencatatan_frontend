import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile/app/modules/main/widgets/main_app_bar.dart';
import 'package:mobile/app/modules/main/widgets/main_bottom_nav.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xFFF6F6F8),
        appBar: MainAppBar(),
        body: controller.pages[controller.indexPage.value],
        bottomNavigationBar: const MainBottomNav(),
      ),
    );
  }
}
