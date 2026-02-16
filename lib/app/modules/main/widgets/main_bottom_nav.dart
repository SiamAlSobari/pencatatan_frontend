import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/main/controllers/main_controller.dart';

class MainBottomNav extends GetView<MainController> {
  const MainBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          currentIndex: controller.indexPage.value,
          onTap: (i) => controller.changePage(i),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ));
  }
}
