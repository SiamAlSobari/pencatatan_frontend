import 'package:get/get.dart';
import 'package:mobile/app/data/providers/base_provider.dart';

class TransactionProvider extends BaseProvider {
  Future<Response> fetchRecentTransactions() async {
    return await get('/transactions/recent');
  }
}