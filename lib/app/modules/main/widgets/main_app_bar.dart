import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/core/colors/app_color.dart';
import 'package:mobile/app/core/services/session_service.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final session = Get.find<SessionService>();
    return AppBar(
      shadowColor: Colors.black.withAlpha(150),
      backgroundColor: Colors.white,
      elevation: 0.4,
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Finance Tracker',
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.text.withAlpha(200),
                ),
              ),
              Text(
                session.user.value?.name ?? 'User',
                style:
                    GoogleFonts.manrope(fontSize: 12, color: AppColor.primary),
              ),
            ],
          )
        ],
      ),
    );
  }
}
