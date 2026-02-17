import 'package:get/get.dart';
import 'package:mobile/app/data/providers/home_provider.dart';
import 'package:mobile/app/data/repositories/home_repository.dart';
import 'package:mobile/app/modules/home/controllers/home_controller.dart';
import 'package:mobile/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeProvider>(() => HomeProvider());
    Get.lazyPut<HomeRepository>(() => HomeRepository(Get.find()));
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
