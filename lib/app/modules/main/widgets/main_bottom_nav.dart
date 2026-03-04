import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';
import 'package:mobile/app/modules/main/controllers/main_controller.dart';

class MainBottomNav extends GetView<MainController> {
  const MainBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Theme(
        data: ThemeData(splashFactory: NoSplash.splashFactory),
        child: BottomNavigationBar(
          currentIndex: controller.indexPage.value,
          onTap: (i) => controller.changePage(i),
          backgroundColor: Colors.white,
          selectedItemColor: AppColor.primary,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.normal),
          unselectedLabelStyle: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.normal),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet, size: 30),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
