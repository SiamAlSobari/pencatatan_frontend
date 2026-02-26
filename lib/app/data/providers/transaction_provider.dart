import 'package:get/get.dart';
import 'package:mobile/app/data/providers/base_provider.dart';

class TransactionProvider extends BaseProvider {
  Future<Response> fetchRecentTransactions() async {
    return await get('/transactions/recent');
  }

    Future<Response> createTransaction(String walletId, String categoryId, int amount,
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