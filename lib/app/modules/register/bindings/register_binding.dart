import 'package:get/get.dart';
import 'package:mobile/app/data/providers/auth_provider.dart';
import 'package:mobile/app/data/repositories/auth_repository.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(
      () => AuthProvider(),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(Get.find()),
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(Get.find()),
    );
  }
}
