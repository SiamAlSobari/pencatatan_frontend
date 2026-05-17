import 'package:get/get.dart';
import 'package:mobile/app/data/providers/analytics_provider.dart';

class AnalyticsRepository {
  final AnalyticsProvider _analyticsProvider;

  AnalyticsRepository(this._analyticsProvider);

  Future<Response> fetchSummary({int? year, int? month}) async {
    return await _analyticsProvider.fetchSummary(year: year, month: month);
  }

  Future<Response> fetchCategories({int? year, int? month}) async {
    return await _analyticsProvider.fetchCategories(year: year, month: month);
  }

  Future<Response> fetchChartData({int? year}) async {
    return await _analyticsProvider.fetchChartData(year: year);
  }
}
