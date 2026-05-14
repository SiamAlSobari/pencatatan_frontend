import 'package:get/get.dart';
import 'package:mobile/app/data/models/recurring_model.dart';
import 'package:mobile/app/data/repositories/recurring_repository.dart';

class RecurringController extends GetxController {
  final RecurringRepository repository;

  RecurringController(this.repository);

  final RxList<RecurringTransaction> recurringList = <RecurringTransaction>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRecurring();
  }

  Future<void> fetchRecurring() async {
    try {
      isLoading(true);
      final fetchedData = await repository.getRecurring();
      recurringList.assignAll(fetchedData);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch recurring transactions: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> toggleActive(String id) async {
    try {
      final updated = await repository.toggleActive(id);
      final index = recurringList.indexWhere((r) => r.id == id);
      if (index != -1) {
        recurringList[index] = updated;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to toggle status: $e');
    }
  }

  Future<void> deleteRecurring(String id) async {
    try {
      await repository.deleteRecurring(id);
      recurringList.removeWhere((r) => r.id == id);
      Get.snackbar('Success', 'Recurring transaction deleted');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete: $e');
    }
  }
}
