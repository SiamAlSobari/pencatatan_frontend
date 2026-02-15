import 'package:get/get.dart';
import 'package:mobile/app/data/repositories/splash_repository.dart';

class SplashController extends GetxController {
  final SplashRepository repository;

  SplashController(this.repository);
  @override
  void onInit() {
    checkSession();
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future<void> checkSession() async {
    await Future.delayed(Duration(seconds: 2));
    final res = await repository.checkAuth();
    if (res != null) {
      Get.offAllNamed('/home');
    }
  }
}
