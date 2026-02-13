import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://api.example.com';
  }

  Future<Response> login(Map data) {
    return post('/login', data);
  }
}
