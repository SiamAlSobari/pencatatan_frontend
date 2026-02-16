import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile/app/core/services/session_service.dart';
import 'package:mobile/app/modules/main/widgets/bottom_nav.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    final sessionService = Get.find<SessionService>();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
            title: Text(sessionService.user.value?.name ?? 'User'),
            centerTitle: true),
        body: controller.pages[controller.indexPage.value],
        bottomNavigationBar: const BottomNav(),
      ),
    );
  }
}
