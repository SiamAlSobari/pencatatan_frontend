import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile/app/modules/budget/controllers/budget_controller.dart';
import 'package:mobile/app/data/models/budget_model.dart';

class BudgetView extends GetView<BudgetController> {
  const BudgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('Monthly Budgets', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Color(0xFF1E88E5), size: 28),
            onPressed: () {
              Get.snackbar('Coming Soon', 'Create budget functionality will be available soon.');
            },
          )
        ],
      ),
      body: Column(
        children: [
          _buildMonthSelector(),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.budgets.isEmpty) {
                return _buildEmptyState(context);
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.budgets.length,
                itemBuilder: (context, index) {
                  final budget = controller.budgets[index];
                  return _buildBudgetCard(context, budget);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthSelector() {
    return Obx(() {
      final monthName = DateFormat('MMMM yyyy').format(DateTime(controller.selectedYear.value, controller.selectedMonth.value));
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 16),
              onPressed: () {
                var m = controller.selectedMonth.value - 1;
                var y = controller.selectedYear.value;
                if (m < 1) {
                  m = 12;
                  y--;
                }
                controller.changeDate(y, m);
              },
            ),
            Text(monthName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 16),
              onPressed: () {
                var m = controller.selectedMonth.value + 1;
                var y = controller.selectedYear.value;
                if (m > 12) {
                  m = 1;
                  y++;
                }
                controller.changeDate(y, m);
              },
            ),
          ],
        ),
      );
    });
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_balance_wallet_outlined, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text('No Budgets Yet', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey.shade700)),
          const SizedBox(height: 8),
          Text('Set a spending limit for this month.', style: TextStyle(color: Colors.grey.shade500)),
        ],
      ),
    );
  }

  Widget _buildBudgetCard(BuildContext context, Budget budget) {
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    final double amount = budget.amount ?? 1;
    final double spent = controller.categorySpendings[budget.categoryId] ?? 0;
    final double progress = (spent / amount).clamp(0.0, 1.0);
    final bool isExceeded = spent > amount;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
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
                        color: Colors.orange.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.pie_chart,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      budget.category?['name'] ?? 'Unknown Category',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  currencyFormat.format(amount),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Spent: ${currencyFormat.format(spent)}',
                  style: TextStyle(fontSize: 14, color: isExceeded ? Colors.red : Colors.grey.shade700),
                ),
                Text(
                  'Left: ${currencyFormat.format((amount - spent).clamp(0, double.infinity))}',
                  style: TextStyle(fontSize: 14, color: isExceeded ? Colors.red : Colors.green.shade700, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 10,
                backgroundColor: Colors.grey.shade200,
                color: isExceeded ? Colors.red : (progress > 0.8 ? Colors.orange : Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
