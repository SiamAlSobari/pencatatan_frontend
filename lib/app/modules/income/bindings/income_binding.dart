import 'package:get/get.dart';
import 'package:mobile/app/data/providers/category_provider.dart';
import 'package:mobile/app/data/providers/income_provider.dart';
import 'package:mobile/app/data/providers/wallet_provider.dart';
import 'package:mobile/app/data/repositories/category_repositoy.dart';
import 'package:mobile/app/data/repositories/income_repository.dart';
import 'package:mobile/app/data/repositories/wallet_repository.dart';

import '../controllers/income_controller.dart';

class IncomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IncomeProvider>(() => IncomeProvider()); //()
    Get.lazyPut<WalletProvider>(() => WalletProvider()); //()
    Get.lazyPut<CategoryProvider>(() => CategoryProvider()); //()
    Get.lazyPut<CategoryRepositoy>(() => CategoryRepositoy(Get.find())); //()
    Get.lazyPut<IncomeRepository>(() => IncomeRepository(Get.find())); //()
    Get.lazyPut<WalletRepository>(() => WalletRepository(Get.find())); //()
    Get.lazyPut<IncomeController>(
      () => IncomeController(Get.find(), Get.find(), Get.find()),
    );
  }
}
