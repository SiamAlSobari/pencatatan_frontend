import 'package:flutter/material.dart';
import 'package:mobile/app/modules/splash/widgets/splash_logo.dart';
import 'package:mobile/app/modules/splash/widgets/splash_sub_title.dart';
import 'package:mobile/app/modules/splash/widgets/splash_title.dart';

class SplashCenter extends StatelessWidget {
  const SplashCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SplashLogo(),
          SizedBox(height: 20),
          SplashTitle(),
          SizedBox(height: 10),
          SplashSubTitle(),
        ],
      ),
    );
  }
}
