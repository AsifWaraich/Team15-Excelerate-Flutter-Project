import 'package:flutter/material.dart';
import 'package:learnhub/feedback_screen.dart';
import 'package:learnhub/models/feedback_item.dart';
import 'package:learnhub/services/feedback_service.dart';

class FeedbackListScreen extends StatefulWidget {
  final String userEmail;

  const FeedbackListScreen({super.key, required this.userEmail});

  @override
  State<FeedbackListScreen> createState() => _FeedbackListScreenState();
}

class _FeedbackListScreenState extends State<FeedbackListScreen> {
  final FeedbackService _service = const FeedbackService();
  late Future<List<FeedbackItem>> _futureItems;

  @override
  void initState() {
    super.initState();
    _futureItems = _service.getAll();
  }

  void _reload() {
    setState(() {
      _futureItems = _service.getAll();
    });
  }

  Future<void> _goToAdd() async {
    final changed = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => FeedbackScreen(userEmail: widget.userEmail),
      ),
    );
    if (changed == true) _reload();
  }

  Future<void> _goToEdit(FeedbackItem item) async {
    final changed = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => FeedbackScreen(
          userEmail: widget.userEmail,
          existing: item,
        ),
      ),
    );
    if (changed == true) _reload();
  }

  Future<void> _confirmDelete(FeedbackItem item) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete feedback?'),
          content: const Text('This will permanently remove the feedback entry.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirm != true) return;

    await _service.delete(item.id);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Feedback deleted')),
    );
    _reload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _reload,
            tooltip: 'Refresh',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToAdd,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<FeedbackItem>>(
        future: _futureItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 40),
                    const SizedBox(height: 12),
                    const Text(
                      'Failed to load feedback.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: _reload,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          final items = snapshot.data ?? <FeedbackItem>[];
          if (items.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.feedback_outlined, size: 48, color: Colors.grey[500]),
                    const SizedBox(height: 12),
                    const Text(
                      'No feedback yet.\nTap + to add your first feedback.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  onTap: () => _goToEdit(item),
                  title: Text(
                    item.message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text('${item.name} • ${item.email}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => _confirmDelete(item),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


