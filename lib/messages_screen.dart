import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> messages = [
      {"sender": "Admin", "msg": "Welcome to LearnHub!", "time": "Just now"},
      {"sender": "Web Dev Mentor", "msg": "Don't forget to submit your assignment.", "time": "2 hrs ago"},
      {"sender": "System", "msg": "New Python course added.", "time": "Yesterday"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: messages.isEmpty
          ? const Center(child: Text("No messages yet."))
          : ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final item = messages[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFE3F2FD),
                child: Icon(Icons.chat, color: Color(0xFF2962FF)),
              ),
              title: Text(item['sender']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item['msg']!),
              trailing: Text(item['time']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ),
          );
        },
      ),
    );
  }
}