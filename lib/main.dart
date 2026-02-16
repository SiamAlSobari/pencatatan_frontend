import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile/app/core/bindings/initial_binding.dart';

import 'app/routes/app_pages.dart';

void main() async {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
    ),
  );
}
