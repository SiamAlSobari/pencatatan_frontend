import 'package:get/get.dart';
import 'package:mobile/app/data/providers/transaction_provider.dart';

class TransactionRepository {
  final TransactionProvider _transactionProvider;
  TransactionRepository(this._transactionProvider);

  Future<Response> fetchRecentTransactions() async {
    return await _transactionProvider.fetchRecentTransactions();
  }

  Future<Response> createTransaction(String walletId, String categoryId, int amount,
      String note, DateTime date) async {
    return await _transactionProvider.createTransaction(
        walletId, categoryId, amount, note, date);
  }
}
