import 'package:get/get.dart';
import 'package:mobile/app/data/providers/income_provider.dart';

class IncomeRepository {
  final IncomeProvider provider;

  IncomeRepository(this.provider);

  Future<Response> createIncome(String walletId, String categoryId,
      int amount, String note, DateTime date) async {
    return await provider.createIncome(walletId, categoryId, amount, note, date);
  }
}
