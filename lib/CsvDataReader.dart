import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

class CsvDataReader {
  Future<List<List<dynamic>>> readCsvData(String path) async {
    final String rawCsv = await rootBundle.loadString(path);
    final List<List<dynamic>> csvTable = CsvToListConverter().convert(rawCsv);
    return csvTable;
  }
}
