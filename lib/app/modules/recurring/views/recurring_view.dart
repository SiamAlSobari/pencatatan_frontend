import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile/app/modules/recurring/controllers/recurring_controller.dart';
import 'package:mobile/app/data/models/recurring_model.dart';

class RecurringView extends GetView<RecurringController> {
  const RecurringView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('Recurring Transactions', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Color(0xFF1E88E5), size: 28),
            onPressed: () {
              Get.snackbar('Coming Soon', 'Create recurring transaction UI will be available soon.');
            },
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.recurringList.isEmpty) {
          return _buildEmptyState(context);
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.recurringList.length,
          itemBuilder: (context, index) {
            final recurring = controller.recurringList[index];
            return _buildRecurringCard(context, recurring);
          },
        );
      }),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.autorenew, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text('No Recurring Bills', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey.shade700)),
          const SizedBox(height: 8),
          Text('Set up subscriptions or recurring bills.', style: TextStyle(color: Colors.grey.shade500)),
        ],
      ),
    );
  }

  Widget _buildRecurringCard(BuildContext context, RecurringTransaction recurring) {
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    final bool isActive = recurring.isActive ?? false;
    final isExpense = recurring.type == 'EXPENSE';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isActive ? Colors.transparent : Colors.grey.shade300, width: 1.5),
        boxShadow: [
          if (isActive)
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isActive ? (isExpense ? Colors.red.shade50 : Colors.green.shade50) : Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isExpense ? Icons.arrow_upward : Icons.arrow_downward,
                        color: isActive ? (isExpense ? Colors.red : Colors.green) : Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recurring.name ?? 'Unknown',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isActive ? Colors.black87 : Colors.grey,
                            decoration: isActive ? TextDecoration.none : TextDecoration.lineThrough,
                          ),
                        ),
                        Text(
                          '${recurring.frequency} • ${recurring.category?['name'] ?? 'Other'}',
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                  ],
                ),
                Switch(
                  value: isActive,
                  onChanged: (val) {
                    controller.toggleActive(recurring.id!);
                  },
                  activeColor: const Color(0xFF1E88E5),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Amount', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text(
                      currencyFormat.format(recurring.amount ?? 0),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isActive ? Colors.black87 : Colors.grey),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Next Run', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text(
                      recurring.nextRun != null ? DateFormat('dd MMM yyyy').format(recurring.nextRun!) : '-',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: isActive ? const Color(0xFF1E88E5) : Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
