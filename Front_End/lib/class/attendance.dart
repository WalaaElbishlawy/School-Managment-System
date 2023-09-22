import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Class {
  final String id;
  final String className;
  final List<Student> students;

  Class({required this.id, required this.className, required this.students});
}

class Student {
  final String id;
  final String name;
  bool isPresent;

  Student({required this.id, required this.name, this.isPresent = false});
}

class ManualAttendanceScreen extends StatefulWidget {
  final Class classData;

  ManualAttendanceScreen({required this.classData});

  @override
  _ManualAttendanceScreenState createState() => _ManualAttendanceScreenState();
}

class _ManualAttendanceScreenState extends State<ManualAttendanceScreen> {
  List<Student> students = [];
  List<String> selectedStudents = [];
  String selectedClassName = '';

  @override
  void initState() {
    super.initState();
    students = widget.classData.students;
    selectedClassName = widget.classData.className;
  }

  void toggleStudentAttendance(String studentId) {
    setState(() {
      if (selectedStudents.contains(studentId)) {
        selectedStudents.remove(studentId);
      } else {
        selectedStudents.add(studentId);
      }
    });
  }

  Future<void> markAttendance() async {
    final List<String> presentStudentIds = students
        .where((student) => selectedStudents.contains(student.id))
        .map((student) => student.id)
        .toList();

    final apiUrl =
        'http://yourbackend/api/mark-attendance'; // Replace with your API endpoint
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'class_id': widget.classData.id,
        'present_student_ids': presentStudentIds,
      }),
    );

    if (response.statusCode == 200) {
      final updatedStudents = students.map((student) {
        return Student(
          id: student.id,
          name: student.name,
          isPresent: selectedStudents.contains(student.id),
        );
      }).toList();

      setState(() {
        students = updatedStudents;
        selectedStudents.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Attendance marked successfully!',
            style: TextStyle(color: Colors.black),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Color.fromARGB(255, 208, 231, 244),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to mark attendance. Status code: ${response.statusCode}',
            style: TextStyle(color: Colors.black),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 208, 231, 244),
        title: Image.asset(
          "images/logo.jpeg",
          width: 160,
        ),
      ),
      body: Column(
        children: [
          Container(
            width:300,
            height:300,
            child: 
            Image.asset("images/attendance3.jpg"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                Student student = students[index];
                bool isPresent = selectedStudents.contains(student.id);

                return ListTile(
                  title: Text(student.name),
                  leading: Checkbox(
                    value: isPresent,
                    onChanged: (value) => toggleStudentAttendance(student.id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: markAttendance,
        child: Icon(
          Icons.check,
          color: Colors.black,
        ),
        backgroundColor: Color.fromARGB(255, 208, 231, 244),
      ),
    );
  }
}

class Attendance extends StatelessWidget {
  final List<Class> classes = [
    Class(
      id: '1',
      className: 'Class A',
      students: [
        Student(id: '1', name: 'Student 1'),
        Student(id: '2', name: 'Student 2'),
        Student(id: '3', name: 'Student 3'),
        Student(id: '4', name: 'Student 4'),
        Student(id: '5', name: 'Student 5'),
        Student(id: '6', name: 'Student 6'),
        Student(id: '7', name: 'Student 7'),
        Student(id: '8', name: 'Student 8'),
      ],
    ),
    Class(
      id: '2',
      className: 'Class B',
      students: [
        Student(id: '1', name: 'Student 1'),
        Student(id: '2', name: 'Student 2'),
      ],
    ),
    Class(
      id: '3',
      className: 'Class C',
      students: [
        Student(id: '1', name: 'Student 1'),
        Student(id: '2', name: 'Student 2'),
      ],
    ),
    Class(
      id: '4',
      className: 'Class D',
      students: [
        Student(id: '1', name: 'Student 1'),
        Student(id: '2', name: 'Student 2'),
      ],
    ),
    // Add more classes here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 208, 231, 244),
        title: Image.asset(
          "images/logo.jpeg",
          width: 160,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width:300,
            height:300,
              child:
            Image(image: AssetImage("images/attendance1.jpg")),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      final selectedClass = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            title: Text('Select a Class'),
                            children: classes.map((Class classData) {
                              return SimpleDialogOption(
                                onPressed: () {
                                  Navigator.pop(context, classData);
                                },
                                child: Text(classData.className),
                              );
                            }).toList(),
                          );
                        },
                      );

                      if (selectedClass != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ManualAttendanceScreen(
                                classData: selectedClass),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 208, 231,
                          244), // Change the background color of the button
                    ),
                    child: Text(
                      'Record Manual Attendance',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
