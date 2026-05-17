import 'package:get/get.dart';
import 'package:mobile/app/data/models/budget_model.dart';
import 'package:mobile/app/data/providers/base_provider.dart';

class BudgetProvider extends BaseProvider {
  Future<List<Budget>> getBudgets(int month, int year) async {
    final response = await get('/budgets?month=$month&year=$year');
    if (response.status.hasError) {
      return Future.error(response.statusText ?? 'Error');
    } else {
      final data = response.body['data'] as List;
      return data.map((e) => Budget.fromJson(e)).toList();
    }
  }

  Future<Budget> createBudget(Budget budget) async {
    final response = await post('/budgets', budget.toJson());
    if (response.status.hasError) {
      return Future.error(response.statusText ?? 'Error');
    } else {
      return Budget.fromJson(response.body['data']);
    }
  }

  Future<Budget> updateBudget(String id, double amount) async {
    final response = await put('/budgets/$id', {'amount': amount});
    if (response.status.hasError) {
      return Future.error(response.statusText ?? 'Error');
    } else {
      return Budget.fromJson(response.body['data']);
    }
  }

  Future<void> deleteBudget(String id) async {
    final response = await delete('/budgets/$id');
    if (response.status.hasError) {
      return Future.error(response.statusText ?? 'Error');
    }
  }
}
