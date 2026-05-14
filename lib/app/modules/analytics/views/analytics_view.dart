import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mobile/app/core/colors/app_color.dart';
import '../controllers/analytics_controller.dart';

class AnalyticsView extends GetView<AnalyticsController> {
  const AnalyticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // If controller is not yet registered via binding, put it here.
    // Since we added it to MainBinding (later), it should be accessible.
    // But to be safe, we use Get.find() or Get.put() if not found.
    if (!Get.isRegistered<AnalyticsController>()) {
      Get.put(AnalyticsController(Get.find()));
    }

    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            controller.fetchData();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildMonthSelector(context),
                const SizedBox(height: 20),
                _buildSummaryCard(currencyFormatter),
                const SizedBox(height: 24),
                Text(
                  'Yearly Overview',
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                _buildChartCard(),
                const SizedBox(height: 24),
                Text(
                  'Spending by Category',
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                _buildCategoriesList(currencyFormatter),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      'Analytics',
      style: GoogleFonts.manrope(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildMonthSelector(BuildContext context) {
    return Obx(() {
      final monthName = DateFormat('MMMM').format(
        DateTime(controller.selectedYear.value, controller.selectedMonth.value),
      );
      
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              var m = controller.selectedMonth.value - 1;
              var y = controller.selectedYear.value;
              if (m < 1) {
                m = 12;
                y -= 1;
              }
              controller.changeDate(y, m);
            },
          ),
          Text(
            '$monthName ${controller.selectedYear.value}',
            style: GoogleFonts.manrope(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              var m = controller.selectedMonth.value + 1;
              var y = controller.selectedYear.value;
              if (m > 12) {
                m = 1;
                y += 1;
              }
              controller.changeDate(y, m);
            },
          ),
        ],
      );
    });
  }

  Widget _buildSummaryCard(NumberFormat formatter) {
    return Obx(() {
      if (controller.isLoadingSummary.value) {
        return const Center(child: CircularProgressIndicator());
      }
      
      final summary = controller.summary;
      final income = summary['income'] ?? 0;
      final expense = summary['expense'] ?? 0;
      final balance = summary['balance'] ?? 0;

      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            _buildSummaryRow('Balance', balance, formatter, AppColor.primary),
            const Divider(height: 30),
            Row(
              children: [
                Expanded(
                  child: _buildSummaryItem(
                    'Income',
                    income,
                    formatter,
                    Colors.green,
                    Icons.arrow_downward,
                  ),
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: Colors.grey.withOpacity(0.2),
                ),
                Expanded(
                  child: _buildSummaryItem(
                    'Expense',
                    expense,
                    formatter,
                    Colors.red,
                    Icons.arrow_upward,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _buildSummaryRow(String title, num amount, NumberFormat formatter, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.manrope(
            fontSize: 16,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          formatter.format(amount),
          style: GoogleFonts.manrope(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryItem(String title, num amount, NumberFormat formatter, Color color, IconData icon) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 4),
            Text(
              title,
              style: GoogleFonts.manrope(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          formatter.format(amount),
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesList(NumberFormat formatter) {
    return Obx(() {
      if (controller.isLoadingCategories.value) {
        return const Center(child: CircularProgressIndicator());
      }
      
      final categories = controller.categories;
      
      if (categories.isEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'No spending data for this month',
              style: GoogleFonts.manrope(
                color: Colors.grey,
              ),
            ),
          ),
        );
      }

      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final cat = categories[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColor.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.category,
                    color: AppColor.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    cat['categoryName'] ?? 'Unknown',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  formatter.format(cat['amount'] ?? 0),
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  Widget _buildChartCard() {
    return Obx(() {
      if (controller.isLoadingChart.value) {
        return const SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        );
      }

      final data = controller.chartDataList;
      if (data.isEmpty) {
        return const SizedBox(
          height: 200,
          child: Center(child: Text('No chart data available')),
        );
      }

      double maxAmount = 0;
      for (var monthData in data) {
        final income = (monthData['income'] ?? 0).toDouble();
        final expense = (monthData['expense'] ?? 0).toDouble();
        if (income > maxAmount) maxAmount = income;
        if (expense > maxAmount) maxAmount = expense;
      }
      
      // Make the max amount a nice rounded number for the y-axis
      if (maxAmount == 0) maxAmount = 1000;
      final maxY = maxAmount * 1.2; 

      return Container(
        height: 250,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: maxY,
            barTouchData: BarTouchData(enabled: false),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    const style = TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    );
                    final months = ['J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D'];
                    int index = value.toInt() - 1;
                    String text = (index >= 0 && index < 12) ? months[index] : '';
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 4,
                      child: Text(text, style: style),
                    );
                  },
                ),
              ),
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: maxY / 4,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.grey.withOpacity(0.2),
                  strokeWidth: 1,
                  dashArray: [5, 5],
                );
              },
            ),
            borderData: FlBorderData(show: false),
            barGroups: data.map((monthData) {
              final month = monthData['month'] as int;
              final income = (monthData['income'] ?? 0).toDouble();
              final expense = (monthData['expense'] ?? 0).toDouble();

              return BarChartGroupData(
                x: month,
                barRods: [
                  BarChartRodData(
                    toY: income,
                    color: Colors.green,
                    width: 6,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  BarChartRodData(
                    toY: expense,
                    color: Colors.red,
                    width: 6,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
