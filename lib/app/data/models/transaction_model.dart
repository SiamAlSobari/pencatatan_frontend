import 'package:mobile/app/data/models/category_model.dart';

class TransactionModel {
  final String id;
  final String userId;
  final String walletId;
  final String categoryId;
  final int amount;
  final String? name;
  final String note;
  final DateTime date;
  final String type;
  final DateTime createdAt;
  final CategoryModel? category;

  TransactionModel({
    required this.id,
    required this.name,
    required this.userId,
    required this.walletId,
    required this.categoryId,
    required this.amount,
    required this.note,
    required this.date,
    required this.type,
    required this.createdAt,
    required this.category,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      walletId: json['walletId'] ?? '',
      categoryId: json['categoryId'] ?? '',
      amount: json['amount'] ?? 0,
      note: json['note'] ?? '',
      date: DateTime.parse(json['date'] ?? DateTime.now().toIso8601String()),
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      createdAt:
          DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      category: CategoryModel.fromJson(json['category'] ?? {}),
    );
  }
}
