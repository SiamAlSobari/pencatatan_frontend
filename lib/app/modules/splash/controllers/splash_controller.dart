import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/services/session_service.dart';
import 'package:mobile/app/data/models/session_model.dart';
import 'package:mobile/app/data/repositories/auth_repository.dart';
import 'package:mobile/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final AuthRepository _authRepository;
  SplashController(this._authRepository);

  final SessionService session = Get.find<SessionService>();

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
    final response = await _authRepository.checkAuth();
    if (response.statusCode == 200) {
      debugPrint('Checking authentication status...');
      final body = response.body['data'];
      debugPrint('Session data: $body');
      final userSession = SessionModel(name: body['name'], email: body['email']);
      session.setUser(userSession);
      Get.offAllNamed(Routes.MAIN);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
