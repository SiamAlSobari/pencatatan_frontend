import 'package:get/get.dart';
import 'package:mobile/app/data/providers/category_provider.dart';
import 'package:mobile/app/data/providers/transaction_provider.dart';
import 'package:mobile/app/data/providers/wallet_provider.dart';
import 'package:mobile/app/data/repositories/category_repositoy.dart';
import 'package:mobile/app/data/repositories/transaction_repository.dart';
import 'package:mobile/app/data/repositories/wallet_repository.dart';

import '../controllers/income_controller.dart';

class IncomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionProvider>(() => TransactionProvider()); //()
    Get.lazyPut<WalletProvider>(() => WalletProvider()); //()
    Get.lazyPut<CategoryProvider>(() => CategoryProvider()); //()
    Get.lazyPut<CategoryRepositoy>(() => CategoryRepositoy(Get.find())); //()
    Get.lazyPut<TransactionRepository>(() => TransactionRepository(Get.find())); //()
    Get.lazyPut<WalletRepository>(() => WalletRepository(Get.find())); //()
    Get.lazyPut<IncomeController>(
      () => IncomeController(Get.find(), Get.find(), Get.find()),
    );
  }
}
