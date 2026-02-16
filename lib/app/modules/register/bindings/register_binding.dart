import 'package:get/get.dart';
import 'package:mobile/app/data/providers/register_provider.dart';
import 'package:mobile/app/data/repositories/register_repository.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterProvider>(
      () => RegisterProvider(),
    );
    Get.lazyPut<RegisterRepository>(
      () => RegisterRepository(Get.find()),
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(Get.find()),
    );
  }
}
