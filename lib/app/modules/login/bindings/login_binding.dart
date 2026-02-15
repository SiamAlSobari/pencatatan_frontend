import 'package:get/get.dart';
import 'package:mobile/app/data/providers/login_provider.dart';
import 'package:mobile/app/data/repositories/login_repository.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginProvider>(() => LoginProvider());
    Get.lazyPut<LoginRepository>(() => LoginRepository(Get.find()));
    Get.lazyPut<LoginController>(
      () => LoginController(Get.find()),
    );
  }
}
