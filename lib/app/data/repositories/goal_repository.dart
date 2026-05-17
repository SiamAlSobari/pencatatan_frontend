import 'package:mobile/app/data/models/goal_model.dart';
import 'package:mobile/app/data/providers/goal_provider.dart';

class GoalRepository {
  final GoalProvider provider;

  GoalRepository(this.provider);

  Future<List<Goal>> getGoals() => provider.getGoals();
  Future<Goal> createGoal(Goal goal) => provider.createGoal(goal);
  Future<Goal> addSaving(String id, double amount) => provider.addSaving(id, amount);
  Future<void> deleteGoal(String id) => provider.deleteGoal(id);
}
