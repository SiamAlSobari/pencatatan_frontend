import 'package:get/get.dart';
import 'package:mobile/app/core/storages/token_storage.dart';
import 'package:mobile/app/data/providers/auth_provider.dart';

class AuthRepository {
  final AuthProvider _authProvider;

  AuthRepository(this._authProvider);

  Future<Response> login(String email, String password) async {
    final response = await _authProvider.login(email, password);
    if (response.statusCode == 404) {
      throw 'Email tidak ditemukan';
    }

    if (response.statusCode == 400) {
      throw 'Password salah';
    }

    if (response.statusCode == 500) {
      throw 'Server error';
    }

    return response;
  }

  Future<Response> register(String name, String email, String password) async {
    final response = await _authProvider.register(name, email, password);
    if (response.statusCode == 409) {
      throw 'Email Sudah Terdaftar';
    }
    if (response.statusCode == 500) {
      throw 'Server Error';
    }
    return response;
  }

  Future<Response> checkAuth() async {
    return await _authProvider.session(await TokenStorage().getToken());
  }
}
