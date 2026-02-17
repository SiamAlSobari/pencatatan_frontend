import 'package:mobile/app/data/providers/register_provider.dart';

class RegisterRepository {
  final RegisterProvider provider;

  RegisterRepository(this.provider);
  Future register(String name, String email, String password) async {
    final response = await provider.register(name, email, password);
    if (response.statusCode == 409) {
      throw 'Email Sudah Terdaftar';
    }
    if (response.statusCode == 500) {
      throw 'Server Error';
    }
    return response;
  }
}
