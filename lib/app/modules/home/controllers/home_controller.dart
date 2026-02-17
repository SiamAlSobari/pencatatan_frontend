import 'package:get/get.dart';
import 'package:mobile/app/data/models/wallet_summary_model.dart';
import 'package:mobile/app/data/repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController(this.repository);
  final walletSummary = Rxn<WalletSummaryModel>();

  @override
  void onInit() {
    fetchWalletSummary();
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
}
