import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://10.0.2.2:3000';
    super.onInit();
  }

  Future<Response> login(
    String email,
    String password,
  ) {
    return post(
      '/auth/login',
      {
        'email': email,
        'password': password,
      },
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
}
