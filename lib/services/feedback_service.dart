import 'dart:convert';

import 'package:learnhub/models/feedback_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedbackService {
  static const String _keyFeedbackItems = 'feedback_items';

  const FeedbackService();

  Future<List<FeedbackItem>> getAll() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_keyFeedbackItems);
    if (raw == null || raw.isEmpty) return <FeedbackItem>[];

    final decoded = jsonDecode(raw) as List<dynamic>;
    final items = decoded
        .map((e) => FeedbackItem.fromJson(e as Map<String, dynamic>))
        .toList();
    items.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return items;
  }

  Future<void> add(FeedbackItem item) async {
    final items = await getAll();
    items.insert(0, item);
    await _save(items);
  }

  Future<void> update(FeedbackItem updated) async {
    final items = await getAll();
    final idx = items.indexWhere((i) => i.id == updated.id);
    if (idx == -1) return;
    items[idx] = updated;
    await _save(items);
  }

  Future<void> delete(String id) async {
    final items = await getAll();
    items.removeWhere((i) => i.id == id);
    await _save(items);
  }

  Future<void> _save(List<FeedbackItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(items.map((e) => e.toJson()).toList());
    await prefs.setString(_keyFeedbackItems, raw);
  }
}


