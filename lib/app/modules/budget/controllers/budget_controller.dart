import 'package:get/get.dart';
import 'package:mobile/app/data/models/budget_model.dart';
import 'package:mobile/app/data/repositories/budget_repository.dart';
import 'package:mobile/app/data/repositories/analytics_repository.dart';

class BudgetController extends GetxController {
  final BudgetRepository repository;
  final AnalyticsRepository analyticsRepository;

  BudgetController(this.repository, this.analyticsRepository);

  final RxList<Budget> budgets = <Budget>[].obs;
  final RxMap<String, double> categorySpendings = <String, double>{}.obs;
  final RxBool isLoading = true.obs;

  final selectedYear = DateTime.now().year.obs;
  final selectedMonth = DateTime.now().month.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void changeDate(int year, int month) {
    selectedYear.value = year;
    selectedMonth.value = month;
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);
      // Fetch Budgets
      final fetchedBudgets = await repository.getBudgets(selectedMonth.value, selectedYear.value);
      budgets.assignAll(fetchedBudgets);

      // Fetch Spendings to calculate remaining budget
      final spendingResponse = await analyticsRepository.fetchCategories(year: selectedYear.value, month: selectedMonth.value);
      if (spendingResponse.statusCode == 200) {
        final List<dynamic> spendingData = spendingResponse.body['data'];
        final Map<String, double> spendings = {};
        for (var item in spendingData) {
          spendings[item['categoryId']] = (item['amount'] as num).toDouble();
        }
        categorySpendings.value = spendings;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch data: $e');
    } finally {
      isLoading(false);
    }
  }
}
