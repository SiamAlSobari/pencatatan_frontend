class WalletSummaryModel {
  final double totalBalance;
  final double income;
  final double expense;
  final String trend;
  final double presentase;

  WalletSummaryModel({
    required this.totalBalance,
    required this.income,
    required this.expense,
    required this.trend,
    required this.presentase,
  });

  factory WalletSummaryModel.fromJson(Map<String, dynamic> json) {
    return WalletSummaryModel(
      totalBalance: json['totalBalance']?.toDouble() ?? 0.0,
      income: json['income']?.toDouble() ?? 0.0,
      expense: json['expense']?.toDouble() ?? 0.0,
      trend: json['trend'] ?? '',
      presentase: json['presentase']?.toDouble() ?? 0.0,
    );
  }
}
