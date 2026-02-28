import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/models/category_model.dart';
import 'package:mobile/app/data/models/wallet_model.dart';
import 'package:mobile/app/data/repositories/category_repositoy.dart';
import 'package:mobile/app/data/repositories/transaction_repository.dart';
import 'package:mobile/app/data/repositories/wallet_repository.dart';
import 'package:mobile/app/modules/home/controllers/home_controller.dart';

class IncomeController extends GetxController {
  final TransactionRepository _transactionRepository;
  final WalletRepository _walletRepository;
  final CategoryRepositoy _categoryRepositoy;

  IncomeController(this._transactionRepository, this._walletRepository,
      this._categoryRepositoy);
  final TextEditingController amountInput = TextEditingController(
    text: 'Rp 0',
  );
  final RxnString selectedWalletId = RxnString();
  final RxnString selectedCategoryId = RxnString();
  final RxList<CategoryModel> categories = RxList<CategoryModel>();
  final RxList<WalletModel> wallets = RxList<WalletModel>();
  final Rxn<DateTime> selectedDate = Rxn<DateTime>(DateTime.now());
  final TextEditingController noteInput = TextEditingController();
  final RxBool isSubmitting = false.obs;
  final keyForm = GlobalKey<FormState>();

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

  int get amountValue {
    final text = amountInput.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (text.isEmpty) return 0;
    return int.parse(text);
  }

  void submitIncome() async {
    if (!keyForm.currentState!.validate()) {
      return;
    }

    if (selectedWalletId.value == null) {
      Get.snackbar('Error', 'Pilih wallet dulu');
      return;
    }

    if (selectedCategoryId.value == null) {
      Get.snackbar('Error', 'Pilih kategori dulu');
      return;
    }

    if (selectedDate.value == null) {
      Get.snackbar('Error', 'Tanggal belum dipilih');
      return;
    }
    try {
      isSubmitting.value = true;
      final amount = amountValue;
      final response = await _transactionRepository.createTransaction(
        selectedWalletId.value!,
        selectedCategoryId.value!,
        amount,
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
        Get.snackbar(
          'Sukses',
          'Pemasukan berhasil ditambahkan',
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e, s) {
      debugPrint('ERROR: $e');
      debugPrint('STACKTRACE: $s');
      Get.snackbar('Error', 'Gagal menambahkan pemasukan');
    } finally {
      isSubmitting.value = false;
    }
  }

  void fetchCategories() async {
    try {
      final response = await _categoryRepositoy.fetchIncomeCategories();
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
        debugPrint('Fetched ${wallets.length} wallets');
        debugPrint('Wallets: ${wallets.map((w) => w.name).join(', ')}');
      }
    } catch (e) {
      wallets.clear();
    }
  }
}
