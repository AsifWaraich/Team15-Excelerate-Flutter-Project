import 'package:flutter/material.dart';

class NoteReaderScreen extends StatefulWidget {
  final String title;
  final String content;

  const NoteReaderScreen({
    super.key,
    required this.title,
    required this.content
  });

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {

  double _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(Icons.text_fields),
            onPressed: () {
              _showFontSizeDialog();
            },
          ),
        ],
      ),
      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2962FF),
                ),
              ),
              const Divider(height: 30, thickness: 1.5),

              Text(
                widget.content,
                style: TextStyle(
                  fontSize: _fontSize,
                  height: 1.6,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 40),
            ]
          ),
        ),
      ),
    );
  }

  void _showFontSizeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Adjust Text Size"),
          content: StatefulBuilder(
            builder: (context, setDialogState) {
              return Slider(
                value: _fontSize,
                min: 12.0,
                max: 24.0,
                divisions: 6,
                label: _fontSize.round().toString(),
                onChanged: (newValue) {
                  setDialogState(() => _fontSize = newValue);
                  setState(() => _fontSize = newValue);
                },
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Done"),
            )
          ],
        );
      },
    );
  }
}