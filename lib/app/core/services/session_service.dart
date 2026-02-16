import 'package:get/get.dart';
import 'package:mobile/app/data/models/session_model.dart';

class SessionService extends GetxService {
  final user = Rxn<SessionModel>();

  void setUser(SessionModel session) {
    user.value = session;
  }
}