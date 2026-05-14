class RecurringTransaction {
  String? id;
  String? userId;
  String? walletId;
  String? categoryId;
  String? name;
  double? amount;
  String? type;
  String? frequency;
  DateTime? nextRun;
  bool? isActive;
  Map<String, dynamic>? category;
  Map<String, dynamic>? wallet;

  RecurringTransaction({
    this.id,
    this.userId,
    this.walletId,
    this.categoryId,
    this.name,
    this.amount,
    this.type,
    this.frequency,
    this.nextRun,
    this.isActive,
    this.category,
    this.wallet,
  });

  RecurringTransaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    walletId = json['walletId'];
    categoryId = json['categoryId'];
    name = json['name'];
    amount = (json['amount'] as num?)?.toDouble();
    type = json['type'];
    frequency = json['frequency'];
    nextRun = json['nextRun'] != null ? DateTime.parse(json['nextRun']) : null;
    isActive = json['isActive'];
    category = json['category'];
    wallet = json['wallet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['walletId'] = walletId;
    data['categoryId'] = categoryId;
    data['name'] = name;
    data['amount'] = amount;
    data['type'] = type;
    data['frequency'] = frequency;
    if (nextRun != null) data['nextRun'] = nextRun!.toIso8601String();
    return data;
  }
}
