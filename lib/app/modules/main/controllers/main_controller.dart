import 'package:get/get.dart';
import 'package:mobile/app/modules/home/views/home_view.dart';
import 'package:mobile/app/modules/profile/views/profile_view.dart';

class MainController extends GetxController {
  //TODO: Implement MainController
  final indexPage = 0.obs;

  final pages = [
    HomeView(),
    ProfileView()
  ];

  void changePage(int i) {
    indexPage .value = i;
  }
}
