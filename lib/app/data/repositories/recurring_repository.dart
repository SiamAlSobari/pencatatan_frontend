import 'package:mobile/app/data/models/recurring_model.dart';
import 'package:mobile/app/data/providers/recurring_provider.dart';

class RecurringRepository {
  final RecurringProvider provider;

  RecurringRepository(this.provider);

  Future<List<RecurringTransaction>> getRecurring() => provider.getRecurring();
  Future<RecurringTransaction> createRecurring(RecurringTransaction recurring) => provider.createRecurring(recurring);
  Future<RecurringTransaction> toggleActive(String id) => provider.toggleActive(id);
  Future<void> deleteRecurring(String id) => provider.deleteRecurring(id);
}
