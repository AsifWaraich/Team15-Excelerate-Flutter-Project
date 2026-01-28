class FeedbackItem {
  final String id;
  final String name;
  final String email;
  final String message;
  final DateTime createdAt;

  FeedbackItem({
    required this.id,
    required this.name,
    required this.email,
    required this.message,
    required this.createdAt,
  });

  factory FeedbackItem.fromJson(Map<String, dynamic> json) {
    return FeedbackItem(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      message: json['message'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'message': message,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  FeedbackItem copyWith({
    String? id,
    String? name,
    String? email,
    String? message,
    DateTime? createdAt,
  }) {
    return FeedbackItem(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}


