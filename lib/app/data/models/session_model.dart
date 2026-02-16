class SessionModel {
  final String name;
  final String email;

  SessionModel({
    required this.name,
    required this.email,
  });

  factory SessionModel.formJson(Map<String, dynamic> json) {
    return SessionModel(
      name: json['name'],
      email: json['email'],
    );
  }
}
