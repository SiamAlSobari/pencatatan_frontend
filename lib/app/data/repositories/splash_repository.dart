import 'package:get/get.dart';
import 'package:mobile/app/data/providers/splash_provider.dart';

class SplashRepository {
  final SplashProvider _provider;

  SplashRepository(this._provider);

  Future<Response?> checkAuth() async {
    try {
      final response = await _provider.checkAuth();
      return response;
    } catch (e) {
      return null;
    }
  }
}
