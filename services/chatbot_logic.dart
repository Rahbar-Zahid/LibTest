import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

class ChatbotLogic {
  late String data;

  ChatbotLogic() {
    _loadData();
  }

  // Load the data from the text file
  Future<void> _loadData() async {
    data = await rootBundle.loadString('assets/data.txt');
  }

  Future<String> getResponse(String query) async {
    // Ensure data is loaded before processing the query
    if (data.isEmpty) await _loadData();

    return extractRelevantData(query);
  }

  String extractRelevantData(String query) {
    final lowerCaseData = data.toLowerCase();
    final lowerCaseQuery = query.toLowerCase();

    // Find the relevant section in the data
    final startIndex = lowerCaseData.indexOf(lowerCaseQuery);
    if (startIndex == -1) {
      return 'Sorry, I couldn\'t find the relevant information. Could you please ask in a different way?';
    }

    // Extract the sentence or paragraph containing the query
    final endIndex = lowerCaseData.indexOf('.', startIndex);
    final extract = data.substring(startIndex, endIndex + 1);

    return extract.isNotEmpty ? extract : 'No relevant information found.';
  }
}
