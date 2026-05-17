import 'package:get/get.dart';
import 'package:mobile/app/data/providers/recurring_provider.dart';
import 'package:mobile/app/data/repositories/recurring_repository.dart';
import '../controllers/recurring_controller.dart';

class RecurringBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecurringProvider>(() => RecurringProvider());
    Get.lazyPut<RecurringRepository>(() => RecurringRepository(Get.find()));
    Get.lazyPut<RecurringController>(() => RecurringController(Get.find()));
  }
}
