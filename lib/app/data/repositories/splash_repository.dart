import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/app/core/services/session_service.dart';
import 'package:mobile/app/data/models/session_model.dart';
import 'package:mobile/app/data/providers/splash_provider.dart';
import 'package:mobile/app/routes/app_pages.dart';

class SplashRepository {
  final SplashProvider _provider;
  final SessionService session = Get.find<SessionService>();

  SplashRepository(this._provider);

  Future<Response?> checkAuth() async {
    try {
      final response = await _provider.checkAuth();
      if (response.statusCode == 200) {
        Get.offAllNamed(Routes.MAIN);
      }
      debugPrint('Checking authentication status...');
      final body = response.body['data'];
      debugPrint('Session data: $body');
      final userSession =
          SessionModel(name: body['name'], email: body['email']);
      session.setUser(userSession);

      return response;
    } catch (e) {
      return null;
    }
  }
}
