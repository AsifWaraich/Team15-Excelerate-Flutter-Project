import 'package:flutter/material.dart';
import 'package:learnhub/main.dart';
import 'package:learnhub/program_details.dart';

class ProgramListingScreen extends StatefulWidget {
  const ProgramListingScreen({super.key});

  @override
  State<ProgramListingScreen> createState() => _ProgramListingScreenState();
}

class _ProgramListingScreenState extends State<ProgramListingScreen> {
  // Data Source
  final List<Program> programs = [
    Program(
        title: "Flutter Mobile App Development",
        description: "Build beautiful, natively compiled applications for mobile, "
            "web, and desktop from a single codebase.",
        difficulty: "Beginner",
        duration: "12 Weeks"
    ),
    Program(
        title: "Full-Stack Web Development (MERN)",
        description: "Master the MERN stack (MongoDB, Express, React, Node.js) "
            "to build dynamic web applications.",
        difficulty: "Intermediate",
        duration: "16 Weeks"
    ),
    Program(
        title: "Data Science With Python",
        description: "Learn to analyze data, create visualizations, and build "
            "machine learning models using Python.",
        difficulty: "Intermediate",
        duration: "14 Weeks"
    ),
    Program(
        title: "Cybersecurity & Ethical Hacking",
        description: "Understand network security, penetration testing, and how "
            "to defend against cyber threats.",
        difficulty: "Advanced",
        duration: "10 Weeks"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore Programs"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: programs.length,
        itemBuilder: (context, index) {
          final program = programs[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 16.0),
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: InkWell(
              // NAVIGATION: List Item -> Details
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProgramDetailsScreen(program: program),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(12.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            program.title,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(program.difficulty, style: const TextStyle(color: Colors.blue, fontSize: 12)),
                        )
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      program.description,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      "Tap to view details ->",
                      style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}