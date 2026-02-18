import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/models/transaction_model.dart';
import 'package:mobile/app/data/models/wallet_model.dart';
import 'package:mobile/app/data/models/wallet_summary_model.dart';
import 'package:mobile/app/data/repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController(this.repository);
  final walletSummary = Rxn<WalletSummaryModel>();
  final wallets = RxList<WalletModel>();
  final transactionsRecent = RxList<TransactionModel>();

  @override
  void onInit() {
    fetchWalletSummary();
    fetchTransactions();
    fetchWallets();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchWalletSummary() async {
    try {
      final response = await repository.fetchWalletSummary();
      if (response.statusCode == 200) {
        final data = response.body['data'];
        walletSummary.value = WalletSummaryModel.fromJson(data);
      }
    } catch (e) {
      walletSummary.value = null;
    }
  }

  void fetchWallets() async {
    try {
      final response = await repository.fetchWallets();
      if (response.statusCode == 200) {
        final data = response.body['data'] as List;
        wallets.value =
            data.take(5).map((json) => WalletModel.fromJson(json)).toList();
        // debugPrint('Fetched ${wallets.length} wallets');
        //debugPrint('Wallets: ${wallets.map((w) => w.name).join(', ')}');
      }
    } catch (e) {
      wallets.clear();
    }
  }

  void fetchTransactions() async {
    try {
      final response = await repository.fetchTransactions();
      if (response.statusCode == 200) {
        final data = response.body['data'] as List;
        transactionsRecent.value =
            data.map((json) => TransactionModel.fromJson(json)).toList();
        debugPrint('Fetched ${transactionsRecent.length} transactions');
        debugPrint(
            'Transactions: ${transactionsRecent.map((t) => t.note).join(', ')}');
      }
    } catch (e) {
      transactionsRecent.clear();
    }
  }
}
