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
    debugPrint('Submitting income with:');
    debugPrint('Wallet ID: ${selectedWalletId.value}');
    debugPrint('Category ID: ${selectedCategoryId.value}');
    try {
      isSubmitting.value = true;
      final amount = amountValue;
      final response = await repository.submitIncome(
        selectedWalletId.value!,
        selectedCategoryId.value!,
        amount,
        noteInput.text,
        selectedDate.value!,
      );
      if (response.statusCode == 201) {
        Get.snackbar('Sukses', 'Pemasukan berhasil ditambahkan');
        // Reset form
        selectedWalletId.value;
        selectedCategoryId.value;
        amountInput.text = 'Rp 0';
        noteInput.clear();
        selectedDate.value;
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal menambahkan pemasukan');
    } finally {
      isSubmitting.value = false;
    }
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
