import 'package:get/get.dart';
import 'package:mobile/app/data/providers/income_provider.dart';

class IncomeRepository {
  final IncomeProvider provider;

  IncomeRepository(this.provider);

  Future<Response> fetchWallets() async {
    return await provider.fetchWallets();
  }

  Future<Response> fetchCategories() async {
    return await provider.fetchCategories();
  }
}
