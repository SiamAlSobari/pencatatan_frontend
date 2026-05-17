class Budget {
  String? id;
  String? userId;
  String? categoryId;
  double? amount;
  int? month;
  int? year;
  DateTime? createdAt;
  Map<String, dynamic>? category;

  Budget({
    this.id,
    this.userId,
    this.categoryId,
    this.amount,
    this.month,
    this.year,
    this.createdAt,
    this.category,
  });

  Budget.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    categoryId = json['categoryId'];
    amount = (json['amount'] as num?)?.toDouble();
    month = json['month'];
    year = json['year'];
    createdAt = json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null;
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    data['amount'] = amount;
    data['month'] = month;
    data['year'] = year;
    return data;
  }
}
