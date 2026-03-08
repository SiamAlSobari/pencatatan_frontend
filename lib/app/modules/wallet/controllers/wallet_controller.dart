import 'package:get/get.dart';
import 'package:mobile/app/data/models/wallet_model.dart';
import 'package:mobile/app/data/models/wallet_summary_model.dart';
import 'package:mobile/app/data/repositories/wallet_repository.dart';

class WalletController extends GetxController {
  final WalletRepository _walletRepository = Get.find();

  final wallets = RxList<WalletModel>();
  final walletSummary = Rxn<WalletSummaryModel>();
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchWallets();
    fetchWalletSummary();
    super.onInit();
  }

  void fetchWalletSummary() async {
    try {
      final response = await _walletRepository.fetchWalletSummary();
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
      isLoading.value = true;
      final response = await _walletRepository.fetchWallets();
      if (response.statusCode == 200) {
        final data = response.body['data'] as List;
        wallets.value = data.map((json) => WalletModel.fromJson(json)).toList();
      }
    } catch (e) {
      wallets.clear();
    } finally {
      isLoading.value = false;
    }
  }

  int get walletCount => wallets.length;

  double get totalBalance =>
      walletSummary.value?.totalBalance ??
      wallets.fold(0.0, (sum, w) => sum + w.balance); // fallback ke total balance dari wallet list jika summary gagal dimuat


}
