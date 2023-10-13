import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<dynamic>> csvData = [];

  @override
  void initState() {
    super.initState();
    loadCSVData();
  }

  Future<void> loadCSVData() async {
    try {
      final String csvString = await rootBundle.loadString('data.csv');
      final List<List<dynamic>> parsedCSV = CsvToListConverter().convert(csvString);
      setState(() {
        csvData = parsedCSV;
      });
    } catch (e) {
      print("Error loading CSV data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DynamoDB Data from CSV"),
      ),
      body: ListView.builder(
        itemCount: csvData.length,
        itemBuilder: (BuildContext context, int index) {
          final List<dynamic> row = csvData[index];
          if (index == 0) {
            // Display section names in the first row
            return ListTile(
              title: Text("Section Names: ${row.join(' | ')}"),
              subtitle: Text("Click to view full data"),
            );
          } else {
            final String request = row[0].toString();
            final String config = row[2].toString();
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullDataPage(data: row, sectionNames: csvData[0]),
                  ),
                );
              },
              child: ListTile(
                title: Text("Request: $request"),
                subtitle: Text("Config: $config"),
              ),
            );
          }
        },
      ),
    );
  }
}

class FullDataPage extends StatelessWidget {
  final List<dynamic> data;
  final List<dynamic> sectionNames;

  FullDataPage({required this.data, required this.sectionNames});

  @override
  Widget build(BuildContext context) {
    // Extract and format the full data
    Map<String, dynamic> fullData = {};
    for (int i = 0; i < sectionNames.length; i++) {
      final String key = sectionNames[i].toString().trim();
      final String value = data[i].toString().trim();
      fullData[key] = value;
    }

    // Create a list of Text widgets for each section with padding and line breaks
    List<Widget> sectionWidgets = [];
    fullData.forEach((key, value) {
      sectionWidgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16), // Add padding between sections
            Text(
              key,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(value),
          ],
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Full Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: sectionWidgets,
        ),
      ),
    );
  }
}
