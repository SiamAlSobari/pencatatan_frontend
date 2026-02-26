import 'package:get/get.dart';
import 'package:mobile/app/data/providers/auth_provider.dart';
import 'package:mobile/app/data/repositories/auth_repository.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<AuthRepository>(() => AuthRepository(Get.find()));
    Get.lazyPut<LoginController>(
      () => LoginController(Get.find()),
    );
  }
}
