class Program {
  final String title;
  final String description;
  final String difficulty;
  final String duration;

  Program({
    required this.title,
    required this.description,
    required this.difficulty,
    required this.duration,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      title: json['title'] as String,
      description: json['description'] as String,
      difficulty: json['difficulty'] as String,
      duration: json['duration'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'difficulty': difficulty,
      'duration': duration,
    };
  }
}


