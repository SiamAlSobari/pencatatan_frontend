import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/models/category_model.dart';
import 'package:mobile/app/data/models/wallet_model.dart';
import 'package:mobile/app/data/repositories/category_repositoy.dart';
import 'package:mobile/app/data/repositories/wallet_repository.dart';

class ExpenseController extends GetxController {
  final WalletRepository _walletRepository;
  final CategoryRepositoy _categoryRepositoy;
  ExpenseController(this._walletRepository, this._categoryRepositoy);

  final RxList<CategoryModel> categories = RxList<CategoryModel>();
  final RxList<WalletModel> wallets = RxList<WalletModel>();
  final RxnString selectedWalletId = RxnString();
  final RxnString selectedCategoryId = RxnString();
  final Rxn<DateTime> selectedDate = Rxn<DateTime>(DateTime.now());
  final TextEditingController noteInput = TextEditingController();
  final RxBool isSubmitting = false.obs;
  final keyForm = GlobalKey<FormState>();
  final TextEditingController amountInput = TextEditingController(text: 'Rp 0');


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
    noteInput.dispose();
    super.onClose();
  }

  int get amountValue {
    final text = amountInput.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (text.isEmpty) return 0;
    return int.tryParse(text) ?? 0;
  }

  void pickDate(BuildContext context) async {
    final initialDate = selectedDate.value ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  void fetchCategories() async {
    try {
      final response = await _categoryRepositoy.fetchExpenseCategories();
      if (response.statusCode == 200) {
        final data = response.body['data'] as List;
        categories.value = data.map((json) => CategoryModel.fromJson(json)).toList();
      }
    } catch (e) {
      categories.clear();
    }
  }

  void fetchWallets() async {
    try {
      final response = await _walletRepository.fetchWallets();
      if (response.statusCode == 200) {
        final data = response.body['data'] as List;
        wallets.value = data.map((json) => WalletModel.fromJson(json)).toList();
      }
    } catch (e) {
      wallets.clear();
    }
  }

  void submitExpense() {
    // Implementasi logika untuk menyimpan data pengeluaran
    // Misalnya, panggil API untuk menyimpan data ke backend
    // Setelah berhasil, reset form atau navigasi kembali ke halaman sebelumnya
  }
}
