import 'package:get/get.dart';
import 'package:mobile/app/data/providers/base_provider.dart';

class HomeProvider extends BaseProvider {
  Future<Response> fetchWalletSummary() async {
    return await get('/wallets/summary');
  }

  Future<Response> fetchWallets() async {
    return await get('/wallets');
  }
}
