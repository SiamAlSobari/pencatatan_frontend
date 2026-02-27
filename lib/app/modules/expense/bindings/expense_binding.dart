import 'package:get/get.dart';
import 'package:mobile/app/data/providers/wallet_provider.dart';
import 'package:mobile/app/data/repositories/wallet_repository.dart';

import '../controllers/expense_controller.dart';

class ExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletProvider>(() => WalletProvider()); //()
    Get.lazyPut<WalletRepository>(() => WalletRepository(Get.find())); //()
    Get.lazyPut<ExpenseController>(
      () => ExpenseController(Get.find()),
    );
  }
}
