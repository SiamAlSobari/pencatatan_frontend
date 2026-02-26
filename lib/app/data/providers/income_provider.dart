import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mobile/app/data/providers/base_provider.dart';

class IncomeProvider extends BaseProvider {

  Future<Response> createIncome(String walletId, String categoryId, int amount,
      String note, DateTime date) async {
    return await post(
      '/transactions',
      {
        'wallet_id': walletId,
        'category_id': categoryId,
        'amount': amount,
        'note': note,
        'date': date.toIso8601String(),
      },
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
}
