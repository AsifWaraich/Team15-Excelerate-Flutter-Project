
class Program {
  final String id;
  final String title;
  final String description;
  final String difficulty;
  final String duration;

  final List<VideoLesson> videos;
  final List<NoteLesson> notes;
  final List<QuizLesson> quizzes;

  const Program({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.duration,
    required this.videos,
    required this.notes,
    required this.quizzes,
  });
}

class VideoLesson {
  final String title;
  final String videoUrl;
  final String duration;

  const VideoLesson({
    required this.title,
    required this.videoUrl,
    required this.duration,
  });
}
class NoteLesson {
  final String title;
  final String content;

  const NoteLesson({
    required this.title,
    required this.content,
  });
}

class QuizLesson {
  final String title;
  final List<Question> questions;

  const QuizLesson({
    required this.title,
    required this.questions,
  });
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  const Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}
