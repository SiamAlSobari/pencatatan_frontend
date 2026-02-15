import 'package:get/get.dart';
import 'package:mobile/app/data/providers/base_provider.dart';

class LoginProvider extends BaseProvider {
  Future<Response> login(
    String email,
    String password,
  ) {
    return post('/auth/login', {
      'email': email,
      'password': password,
    });
  }
}
