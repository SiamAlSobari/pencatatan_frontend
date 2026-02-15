import 'package:get/get.dart';
import 'package:mobile/app/data/providers/splash_provider.dart';
import 'package:mobile/app/data/repositories/splash_repository.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashProvider>(() => SplashProvider());

    Get.lazyPut<SplashRepository>(
      () => SplashRepository(Get.find()),
    );

    Get.lazyPut<SplashController>(
      () => SplashController(Get.find()),
    );
  }
}
