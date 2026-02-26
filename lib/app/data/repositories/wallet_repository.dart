import 'package:get/get.dart';
import 'package:mobile/app/data/providers/wallet_provider.dart';

class WalletRepository {
  final WalletProvider _walletProvider;

  WalletRepository(this._walletProvider);

  Future<Response> fetchWalletSummary() async {
    return await _walletProvider.fetchWalletSummary();
  }

  Future<Response> fetchWallets() async {
    return await _walletProvider.fetchWallets();
  }
}