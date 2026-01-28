import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:learnhub/models/program.dart';

class ProgramRepository {
  const ProgramRepository();

  Future<List<Program>> fetchPrograms() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    try {
      final jsonString = await rootBundle.loadString('assets/data/programs.json');
      final List<dynamic> decoded = jsonDecode(jsonString) as List<dynamic>;

      return decoded
          .map((item) => Program.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // In a real API call you would log or rethrow a specific exception
      throw Exception('Failed to load programs');
    }
  }
}


