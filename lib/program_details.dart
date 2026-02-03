import 'package:flutter/material.dart';
import 'package:learnhub/note_reader_screen.dart';
import 'package:learnhub/models/program.dart';
import 'package:learnhub/quiz_screen.dart';
import 'package:learnhub/video_player_screen.dart';
// You will likely need to import your video player package here later
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProgramDetailsScreen extends StatelessWidget {
  final Program program;

  const ProgramDetailsScreen({super.key, required this.program});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(program.title),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          // 2. The TabBar goes here
          bottom: const TabBar(
            labelColor: Color(0xFF2962FF), // Active color
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFF2962FF),
            tabs: [
              Tab(icon: Icon(Icons.play_circle_outline), text: "Videos"),
              Tab(icon: Icon(Icons.library_books), text: "Notes"),
              Tab(icon: Icon(Icons.quiz), text: "Quiz"),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            _buildVideoTab(context),
            _buildNotesTab(),
            _buildQuizTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoTab(BuildContext context) {
    final videos = program.videos;

    if (videos.isEmpty) {
      return const Center(child: Text("No videos available yet."));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Container(
              width: 50, height: 50,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.play_arrow, color: Colors.white),
            ),
            title: Text(video.title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("${video.duration} • Online Only"),
            trailing: const Icon(Icons.wifi, size: 16, color: Colors.blue),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      VideoPlayerScreen(
                        videoUrl: video.videoUrl,
                        title: video.title,
                      ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildNotesTab() {
    final notes = program.notes;

    if (notes.isEmpty) return const Center(child: Text("No notes uploaded."));

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: const Icon(Icons.menu_book, color: Colors.orange),
            title: Text(note.title,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text("${note.content.length > 50
                ? note.content.substring(0, 50)
                : note.content}...", maxLines: 1),
            trailing: const Icon(
                Icons.arrow_forward_ios, size: 14, color: Colors.grey),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NoteReaderScreen(
                        title: note.title,
                        content: note.content,
                      ),
                ),
              );
            },
          ),
        );
      },
    );
  }
  Widget _buildQuizTab() {
    // 1. Get the real data from the program model
    final quizzes = program.quizzes;

    // 2. Handle empty state
    if (quizzes.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.quiz_outlined, size: 60, color: Colors.grey),
            SizedBox(height: 16),
            Text("No quizzes available yet.",
                style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    // 3. Build the list
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: quizzes.length,
      itemBuilder: (context, index) {
        final quiz = quizzes[index]; // Access the specific quiz data

        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      quiz.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Offline Ready",
                          style: TextStyle(color: Colors.green, fontSize: 12)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.list_alt, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text("${quiz.questions.length} Questions"),
                    const SizedBox(width: 16),
                    const Icon(
                        Icons.timer_outlined, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text("${(quiz.questions.length * 1.5).round()} Mins"),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(quiz: quiz),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                    ),
                    child: const Text("Start Quiz"),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}