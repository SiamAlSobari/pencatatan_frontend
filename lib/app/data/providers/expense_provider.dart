import 'package:get/get.dart';
import 'package:mobile/app/data/providers/base_provider.dart';

class ExpenseProvider extends BaseProvider {
  Future<Response> getExpenses() {
    return get('/expenses');
  }
}
