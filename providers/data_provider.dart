import 'package:flutter/material.dart';
import '../services/file_reader.dart';

class DataProvider with ChangeNotifier {
  String _data = '';
  String get data => _data;

  final FileReaderService _fileReaderService = FileReaderService();

  Future<void> loadData() async {
    _data = await _fileReaderService.readData();
    notifyListeners();
  }
}
