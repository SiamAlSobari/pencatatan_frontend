import 'package:get/get.dart';
import 'package:mobile/app/data/providers/base_provider.dart';

class SplashProvider extends BaseProvider {

  Future<Response> checkAuth() {
    return get('/auth/session');
  }
}
