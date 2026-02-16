import 'package:get/get.dart';
import 'package:mobile/app/core/services/session_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SessionService(), permanent: true);
  }
}
