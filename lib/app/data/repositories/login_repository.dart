import 'package:mobile/app/data/providers/login_provider.dart';

class LoginRepository {
  final LoginProvider provider;

  LoginRepository(this.provider);

  Future login(Map data) {
    return provider.login(data);
  }
}
