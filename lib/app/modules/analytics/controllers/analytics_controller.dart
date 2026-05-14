import 'package:get/get.dart';
import 'package:mobile/app/data/repositories/analytics_repository.dart';

class AnalyticsController extends GetxController {
  final AnalyticsRepository _analyticsRepository;

  AnalyticsController(this._analyticsRepository);

  final isLoadingSummary = false.obs;
  final isLoadingCategories = false.obs;
  final isLoadingChart = false.obs;

  final summary = RxMap<String, dynamic>({});
  final categories = RxList<Map<String, dynamic>>([]);
  final chartDataList = RxList<Map<String, dynamic>>([]);

  final selectedYear = DateTime.now().year.obs;
  final selectedMonth = DateTime.now().month.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    fetchSummary();
    fetchCategories();
    fetchChartData();
  }

  void changeDate(int year, int month) {
    bool yearChanged = selectedYear.value != year;
    selectedYear.value = year;
    selectedMonth.value = month;
    fetchSummary();
    fetchCategories();
    if (yearChanged) {
      fetchChartData();
    }
  }

  Future<void> fetchSummary() async {
    isLoadingSummary.value = true;
    try {
      final response = await _analyticsRepository.fetchSummary(
        year: selectedYear.value,
        month: selectedMonth.value,
      );
      if (response.statusCode == 200) {
        summary.value = Map<String, dynamic>.from(response.body['data']);
      }
    } catch (e) {
      print('Error fetching summary: $e');
    } finally {
      isLoadingSummary.value = false;
    }
  }

  Future<void> fetchCategories() async {
    isLoadingCategories.value = true;
    try {
      final response = await _analyticsRepository.fetchCategories(
        year: selectedYear.value,
        month: selectedMonth.value,
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.body['data'];
        categories.value = data.map((e) => Map<String, dynamic>.from(e)).toList();
      }
    } catch (e) {
      print('Error fetching categories: $e');
    } finally {
      isLoadingCategories.value = false;
    }
  }

  Future<void> fetchChartData() async {
    isLoadingChart.value = true;
    try {
      final response = await _analyticsRepository.fetchChartData(
        year: selectedYear.value,
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.body['data'];
        chartDataList.value = data.map((e) => Map<String, dynamic>.from(e)).toList();
      }
    } catch (e) {
      print('Error fetching chart data: $e');
    } finally {
      isLoadingChart.value = false;
    }
  }
}
