import 'package:get/get.dart';

class RegisterProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://10.0.2.2:3000';
    super.onInit();
  }

  Future<Response> register(String name, String email, String password) {
    return post('/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });
  }
}
