import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;

class XmlDataDemo extends StatefulWidget {
  const XmlDataDemo({Key? key}) : super(key: key);

  @override
  State<XmlDataDemo> createState() => _XmlDataDemoState();
}

class _XmlDataDemoState extends State<XmlDataDemo> {
  List _students = [];

  void _xmlData() async {
    final dataList = [];

    const studentXml = '''<?xml version="1.0"?>
    <students>
      <student>
        <studentName>Yash</studentName>
        <attendance>95</attendance>
      </student>
       <student>
        <studentName>Aditya</studentName>
        <attendance>80</attendance>
      </student>
      <student>
        <studentName>Rakhi</studentName>
        <attendance>85</attendance>
      </student>
      <student>
        <studentName>Mohit</studentName>
        <attendance>75</attendance>
      </student>
      <student>
        <studentName>Shaiq</studentName>
        <attendance>70</attendance>
      </student>
      <student>
        <studentName>Pragati</studentName>
        <attendance>65</attendance>
      </student>
    </students>''';

    final document = xml.XmlDocument.parse(studentXml);
    final studentsNode = document.findElements('students').first;
    final students = studentsNode.findElements('student');
    for (final student in students) {
      final studentName = student.findElements('studentName').first.text;
      final attendance = student.findElements('attendance').first.text;
      dataList.add({'studentName': studentName, 'attendance': attendance});
    }

    // Update the UI
    setState(() {
      _students = dataList;
    });
  }

  @override
  void initState() {
    super.initState();
    _xmlData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter XML Data Demo'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView.builder(
          itemBuilder: (context, index) => Card(
            key: ValueKey(_students[index]['studentName']),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            color: Colors.teal.shade100,
            elevation: 5,
            child: ListTile(
              title: Text(_students[index]['studentName']),
              subtitle: Text("Attendance: ${_students[index]['attendance']}%"),
            ),
          ),
          itemCount: _students.length,
        ),
      ),
    );
  }
}
