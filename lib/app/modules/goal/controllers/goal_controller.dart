import 'package:get/get.dart';
import 'package:mobile/app/data/models/goal_model.dart';
import 'package:mobile/app/data/repositories/goal_repository.dart';

class GoalController extends GetxController {
  final GoalRepository repository;

  GoalController(this.repository);

  final RxList<Goal> goals = <Goal>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchGoals();
  }

  Future<void> fetchGoals() async {
    try {
      isLoading(true);
      final fetchedGoals = await repository.getGoals();
      goals.assignAll(fetchedGoals);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch goals: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> addSaving(String id, double amount) async {
    try {
      final updatedGoal = await repository.addSaving(id, amount);
      final index = goals.indexWhere((g) => g.id == id);
      if (index != -1) {
        goals[index] = updatedGoal;
      }
      Get.snackbar('Success', 'Saving added successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add saving: $e');
    }
  }
}
