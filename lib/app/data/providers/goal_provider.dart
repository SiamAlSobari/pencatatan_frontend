import 'package:get/get.dart';
import 'package:mobile/app/data/models/goal_model.dart';
import 'package:mobile/app/data/providers/base_provider.dart';

class GoalProvider extends BaseProvider {
  Future<List<Goal>> getGoals() async {
    final response = await get('/goals');
    if (response.status.hasError) {
      return Future.error(response.statusText ?? 'Error');
    } else {
      final data = response.body['data'] as List;
      return data.map((e) => Goal.fromJson(e)).toList();
    }
  }

  Future<Goal> createGoal(Goal goal) async {
    final response = await post('/goals', goal.toJson());
    if (response.status.hasError) {
      return Future.error(response.statusText ?? 'Error');
    } else {
      return Goal.fromJson(response.body['data']);
    }
  }

  Future<Goal> addSaving(String id, double amount) async {
    final response = await post('/goals/$id/add-saving', {'amount': amount});
    if (response.status.hasError) {
      return Future.error(response.statusText ?? 'Error');
    } else {
      return Goal.fromJson(response.body['data']);
    }
  }

  Future<void> deleteGoal(String id) async {
    final response = await delete('/goals/$id');
    if (response.status.hasError) {
      return Future.error(response.statusText ?? 'Error');
    }
  }
}
