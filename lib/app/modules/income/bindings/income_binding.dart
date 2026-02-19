import 'package:get/get.dart';
import 'package:mobile/app/data/providers/income_provider.dart';
import 'package:mobile/app/data/repositories/income_repository.dart';

import '../controllers/income_controller.dart';

class IncomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IncomeProvider>(() => IncomeProvider()); //()
    Get.lazyPut<IncomeRepository>(() => IncomeRepository(Get.find())); //()
    Get.lazyPut<IncomeController>(
      () => IncomeController(Get.find()),
    );
  }
}
