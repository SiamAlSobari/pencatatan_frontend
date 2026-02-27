import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/models/category_model.dart';
import 'package:mobile/app/data/models/wallet_model.dart';
import 'package:mobile/app/data/repositories/wallet_repository.dart';

class ExpenseController extends GetxController {
  final WalletRepository _walletRepository;
  ExpenseController(this._walletRepository);

  final RxList<CategoryModel> categories = RxList<CategoryModel>();
  final RxList<WalletModel> wallets = RxList<WalletModel>();
  final TextEditingController amountInput = TextEditingController(text: 'Rp 0');
  @override
  void onInit() {
    debugPrint('ExpenseController initialized');
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
    return int.tryParse(text) ?? 0;
  }

  void fetchCategories() {
    // Implementasi logika untuk mengambil data kategori dari repository
    // Misalnya, panggil API untuk mendapatkan daftar kategori dan simpan ke dalam variabel categories
  }

  void fetchWallets() async {
    try {
      final response = await _walletRepository.fetchWallets();
      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
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
