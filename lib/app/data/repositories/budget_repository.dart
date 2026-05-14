import 'package:mobile/app/data/models/budget_model.dart';
import 'package:mobile/app/data/providers/budget_provider.dart';

class BudgetRepository {
  final BudgetProvider provider;

  BudgetRepository(this.provider);

  Future<List<Budget>> getBudgets(int month, int year) => provider.getBudgets(month, year);
  Future<Budget> createBudget(Budget budget) => provider.createBudget(budget);
  Future<Budget> updateBudget(String id, double amount) => provider.updateBudget(id, amount);
  Future<void> deleteBudget(String id) => provider.deleteBudget(id);
}
