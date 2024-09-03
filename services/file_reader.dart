import 'package:flutter/services.dart' show rootBundle;

class FileReaderService {
  Future<String> readData() async {
    return await rootBundle.loadString('assets/data.txt');
  }
}
