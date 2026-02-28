import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/models/category_model.dart';
import 'package:mobile/app/data/models/wallet_model.dart';
import 'package:mobile/app/data/repositories/category_repositoy.dart';
import 'package:mobile/app/data/repositories/transaction_repository.dart';
import 'package:mobile/app/data/repositories/wallet_repository.dart';
import 'package:mobile/app/modules/home/controllers/home_controller.dart';

class ExpenseController extends GetxController {
  final WalletRepository _walletRepository;
  final TransactionRepository _transactionRepository;
  final CategoryRepositoy _categoryRepositoy;
  ExpenseController(this._walletRepository, this._transactionRepository,
      this._categoryRepositoy);

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
        categories.value =
            data.map((json) => CategoryModel.fromJson(json)).toList();
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

  void submitExpense() async {
    if (!keyForm.currentState!.validate()) {
      return;
    }
    if (selectedWalletId.value == null) {
      Get.snackbar('Error', 'Silakan pilih dompet');
      return;
    }
    if (selectedCategoryId.value == null) {
      Get.snackbar('Error', 'Silakan pilih kategori');
      return;
    }
    if (selectedDate.value == null) {
      Get.snackbar('Error', 'Silakan pilih tanggal');
      return;
    }
    // Lanjutkan dengan logika submit pengeluaran
    try {
      final response = await _transactionRepository.createTransaction(
        selectedWalletId.value!,
        selectedCategoryId.value!,
        -amountValue,
        noteInput.text,
        selectedDate.value!,
      );
      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      if (response.statusCode == 201) {
        if (Get.isRegistered<HomeController>()) {
          Get.find<HomeController>().fetchTransactions();
          Get.find<HomeController>().fetchWalletSummary();
        }
        Get.back();
        Get.snackbar('Sukses', 'Pengeluaran berhasil ditambahkan');
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Error', 'Gagal menambahkan pengeluaran');
    }
  }
}
