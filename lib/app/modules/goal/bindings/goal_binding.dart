import 'package:get/get.dart';
import 'package:mobile/app/data/providers/goal_provider.dart';
import 'package:mobile/app/data/repositories/goal_repository.dart';
import '../controllers/goal_controller.dart';

class GoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoalProvider>(() => GoalProvider());
    Get.lazyPut<GoalRepository>(() => GoalRepository(Get.find()));
    Get.lazyPut<GoalController>(() => GoalController(Get.find()));
  }
}
