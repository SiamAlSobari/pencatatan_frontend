import 'package:get/get.dart';
import 'package:mobile/app/data/providers/base_provider.dart';

class CategoryProvider extends BaseProvider {
  Future<Response> getCategories() {
    return get('/categories/incomes');
  }
}
