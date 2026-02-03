import 'package:flutter/material.dart';
import 'package:learnhub/models/program.dart';

class QuizScreen extends StatefulWidget {
  final QuizLesson quiz;

  const QuizScreen({super.key, required this.quiz});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;
  bool _isAnswered = false;
  @override
  Widget build(BuildContext context) {
    final question = widget.quiz.questions[_currentQuestionIndex];
    final isLastQuestion = _currentQuestionIndex == widget.quiz.questions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Progress Bar
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / widget.quiz.questions.length,
              backgroundColor: Colors.grey[200],
              color: const Color(0xFF2962FF),
            ),
            const SizedBox(height: 20),
            Text(
              "Question ${_currentQuestionIndex + 1}/${widget.quiz.questions.length}",
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
            const SizedBox(height: 10),

            Text(
              question.questionText,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ...List.generate(question.options.length, (index) {
              return _buildOption(index, question.options[index], question.correctAnswerIndex);
            }),

            const Spacer(),

            if (_isAnswered)
              ElevatedButton(
                onPressed: () {
                  if (isLastQuestion) {
                    _showResultDialog();
                  } else {
                    setState(() {
                      _currentQuestionIndex++;
                      _selectedAnswerIndex = null;
                      _isAnswered = false;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2962FF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(isLastQuestion ? "Finish Quiz" : "Next Question"),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(int index, String text, int correctIndex) {
    Color backgroundColor = Colors.white;
    Color borderColor = Colors.grey.shade300;

    if (_isAnswered) {
      if (index == correctIndex) {
        backgroundColor = Colors.green.shade100;
        borderColor = Colors.green;
      } else if (index == _selectedAnswerIndex && index != correctIndex) {
        backgroundColor = Colors.red.shade100;
        borderColor = Colors.red;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: _isAnswered ? null : () {
          setState(() {
            _selectedAnswerIndex = index;
            _isAnswered = true;
            if (index == correctIndex) {
              _score++;
            }
          });
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Text(
                "${String.fromCharCode(65 + index)}.",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
              // Show icons for feedback
              if (_isAnswered && index == correctIndex)
                const Icon(Icons.check_circle, color: Colors.green),
              if (_isAnswered && index == _selectedAnswerIndex && index != correctIndex)
                const Icon(Icons.cancel, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Quiz Completed!"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.emoji_events, size: 60, color: Colors.orange),
            const SizedBox(height: 16),
            Text(
              "Your Score: $_score / ${widget.quiz.questions.length}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(_score > (widget.quiz.questions.length / 2) ? "Great Job!" : "Keep Studying!"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("Done"),
          ),
        ],
      ),
    );
  }
}