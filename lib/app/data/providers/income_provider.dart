import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mobile/app/data/providers/base_provider.dart';

class IncomeProvider extends BaseProvider {
  Future<Response> fetchWallets() async {
    return await get('/wallets');
  }

    Future<Response> fetchCategories() async {
    return await get('/categories');
  }
}
