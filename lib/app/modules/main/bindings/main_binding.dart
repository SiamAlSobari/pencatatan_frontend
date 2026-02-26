import 'package:get/get.dart';
import 'package:mobile/app/data/providers/transaction_provider.dart';
import 'package:mobile/app/data/providers/wallet_provider.dart';
import 'package:mobile/app/data/repositories/transaction_repository.dart';
import 'package:mobile/app/data/repositories/wallet_repository.dart';
import 'package:mobile/app/modules/home/controllers/home_controller.dart';
import 'package:mobile/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    //Wallet
    Get.lazyPut<WalletProvider>(() => WalletProvider());
    Get.lazyPut<WalletRepository>(() => WalletRepository(Get.find()));

    // Transaction
     Get.lazyPut<TransactionProvider>(() => TransactionProvider());
     Get.lazyPut<TransactionRepository>(() => TransactionRepository(Get.find()));
    
    // Controllers module
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController(Get.find(), Get.find()));
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
