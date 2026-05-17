import 'package:get/get.dart';
import 'package:mobile/app/data/providers/analytics_provider.dart';
import 'package:mobile/app/data/repositories/analytics_repository.dart';
import '../controllers/analytics_controller.dart';

class AnalyticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnalyticsProvider>(() => AnalyticsProvider());
    Get.lazyPut<AnalyticsRepository>(() => AnalyticsRepository(Get.find()));
    Get.lazyPut<AnalyticsController>(() => AnalyticsController(Get.find()));
  }
}
