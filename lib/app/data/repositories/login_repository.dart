import 'package:mobile/app/data/providers/login_provider.dart';

class LoginRepository {
  final LoginProvider provider;

  LoginRepository(this.provider);

  Future login(String email, String password) async {
    final response = await provider.login(email, password);
    if (response.statusCode == 404) {
      throw Exception('Email Tidak Ditemukan');
    } else if (response.statusCode == 400) {
      throw Exception('Password Salah');
    }
    if (response.statusCode == 500) {
      throw Exception('Server Error');
    }
    
    return response;
  }
}
