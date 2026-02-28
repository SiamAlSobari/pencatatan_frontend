import 'package:get/get.dart';
import 'package:mobile/app/data/providers/base_provider.dart';

class CategoryProvider extends BaseProvider {
  Future<Response> getIncomeCategories() {
    return get('/categories/incomes');
  }

  Future<Response> getExpenseCategories() {
    return get('/categories/expenses');
  }
}
