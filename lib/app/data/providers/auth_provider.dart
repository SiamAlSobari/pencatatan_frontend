import 'package:get/get.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://10.0.2.2:3000';
    super.onInit();
  }

  Future<Response> login(String email, String password) {
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

  Future<Response> register(String name, String email, String password) {
    return post(
      '/auth/register',
      {
        'name': name,
        'email': email,
        'password': password,
      },
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  Future<Response> session(String? token) {
    return get(
      '/auth/session',
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }
}
