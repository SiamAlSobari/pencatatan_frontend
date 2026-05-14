import 'package:get/get.dart';
import 'package:mobile/app/data/models/recurring_model.dart';
import 'package:mobile/app/data/providers/base_provider.dart';

class RecurringProvider extends BaseProvider {
  Future<List<RecurringTransaction>> getRecurring() async {
    final response = await get('/recurring');
    if (response.status.hasError) {
      return Future.error(response.statusText ?? 'Error');
    } else {
      final data = response.body['data'] as List;
      return data.map((e) => RecurringTransaction.fromJson(e)).toList();
    }
  }

  Future<RecurringTransaction> createRecurring(RecurringTransaction recurring) async {
    final response = await post('/recurring', recurring.toJson());
    if (response.status.hasError) {
      return Future.error(response.statusText ?? 'Error');
    } else {
      return RecurringTransaction.fromJson(response.body['data']);
    }
  }

  Future<RecurringTransaction> toggleActive(String id) async {
    final response = await patch('/recurring/$id/toggle', {});
    if (response.status.hasError) {
      return Future.error(response.statusText ?? 'Error');
    } else {
      return RecurringTransaction.fromJson(response.body['data']);
    }
  }

  Future<void> deleteRecurring(String id) async {
    final response = await delete('/recurring/$id');
    if (response.status.hasError) {
      return Future.error(response.statusText ?? 'Error');
    }
  }
}
