import 'package:get/get.dart';
import 'package:mobile/app/data/providers/base_provider.dart';

class AnalyticsProvider extends BaseProvider {
  Future<Response> fetchSummary({int? year, int? month}) async {
    final query = <String, dynamic>{};
    if (year != null) query['year'] = year.toString();
    if (month != null) query['month'] = month.toString();
    return await get('/analytics/summary', query: query);
  }

  Future<Response> fetchCategories({int? year, int? month}) async {
    final query = <String, dynamic>{};
    if (year != null) query['year'] = year.toString();
    if (month != null) query['month'] = month.toString();
    return await get('/analytics/categories', query: query);
  }

  Future<Response> fetchChartData({int? year}) async {
    final query = <String, dynamic>{};
    if (year != null) query['year'] = year.toString();
    return await get('/analytics/chart', query: query);
  }
}
