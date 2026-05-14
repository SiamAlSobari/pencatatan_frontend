import 'package:get/get.dart';
import 'package:mobile/app/data/providers/budget_provider.dart';
import 'package:mobile/app/data/repositories/budget_repository.dart';
import 'package:mobile/app/data/providers/analytics_provider.dart';
import 'package:mobile/app/data/repositories/analytics_repository.dart';
import '../controllers/budget_controller.dart';

class BudgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BudgetProvider>(() => BudgetProvider());
    Get.lazyPut<BudgetRepository>(() => BudgetRepository(Get.find()));
    Get.lazyPut<AnalyticsProvider>(() => AnalyticsProvider());
    Get.lazyPut<AnalyticsRepository>(() => AnalyticsRepository(Get.find()));
    Get.lazyPut<BudgetController>(() => BudgetController(Get.find(), Get.find()));
  }
}
