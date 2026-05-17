class Goal {
  String? id;
  String? userId;
  String? name;
  double? targetAmount;
  double? savedAmount;
  DateTime? deadline;
  String? status;
  String? icon;
  DateTime? createdAt;

  Goal({
    this.id,
    this.userId,
    this.name,
    this.targetAmount,
    this.savedAmount,
    this.deadline,
    this.status,
    this.icon,
    this.createdAt,
  });

  Goal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    targetAmount = (json['targetAmount'] as num?)?.toDouble();
    savedAmount = (json['savedAmount'] as num?)?.toDouble();
    deadline = json['deadline'] != null ? DateTime.parse(json['deadline']) : null;
    status = json['status'];
    icon = json['icon'];
    createdAt = json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['targetAmount'] = targetAmount;
    if (deadline != null) data['deadline'] = deadline!.toIso8601String();
    if (icon != null) data['icon'] = icon;
    return data;
  }
}
