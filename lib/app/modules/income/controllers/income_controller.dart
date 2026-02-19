import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/models/category_model.dart';
import 'package:mobile/app/data/models/wallet_model.dart';
import 'package:mobile/app/data/repositories/income_repository.dart';

class IncomeController extends GetxController {
  final IncomeRepository repository;

  IncomeController(this.repository);
  final TextEditingController amountInput = TextEditingController(
    text: 'Rp 0',
  );
  final RxnString selectedWalletId = RxnString();
  final RxnString selectedCategoryId = RxnString();
  final RxList<CategoryModel> categories = RxList<CategoryModel>();
  final RxList<WalletModel> wallets = RxList<WalletModel>();

  @override
  void onInit() {
    fetchCategories();
    fetchWallets();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    amountInput.dispose();
    super.onClose();
  }

  int get amountValue {
    final text = amountInput.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (text.isEmpty) return 0;
    return int.parse(text);
  }

  void submitIncome() {
    final amount = amountValue;
    debugPrint('Submitted income: $amount');
  }

  void fetchCategories() async {
    try {
      final response = await repository.fetchCategories();
      if (response.statusCode == 200) {
        final data = response.body['data'] as List;
        categories.value =
            data.map((json) => CategoryModel.fromJson(json)).toList();
      }
    } catch (e) {
      categories.clear();
    }
  }

  void fetchWallets() async {
    try {
      final response = await repository.fetchWallets();
      if (response.statusCode == 200) {
        final data = response.body['data'] as List;
        wallets.value = data.map((json) => WalletModel.fromJson(json)).toList();
        debugPrint('Fetched ${wallets.length} wallets');
        debugPrint('Wallets: ${wallets.map((w) => w.name).join(', ')}');
      }
    } catch (e) {
      wallets.clear();
    }
  }
}
