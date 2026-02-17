class WalletModel {
  final String id;
  final String name;
  final String icon;
  final double balance;
  final String userId;
  final String createdAt;
  final String updatedAt;

  WalletModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.balance,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      id: json['id'] ?? '',
      balance: json['balance']?.toDouble() ?? 0.0,
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      userId: json['userId'] ?? '',
    );
  }
}
