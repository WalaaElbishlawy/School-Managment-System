import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Lecture {
  final String subject;
  final String location;
  final DateTime dateTime;
  final int id; // Add ID field

  Lecture({
    required this.id,
    required this.subject,
    required this.location,
    required this.dateTime,
  });
}

final List<Lecture> lectures = [];

class LectureSchedulerPage extends StatefulWidget {
  @override
  _LectureSchedulerPageState createState() => _LectureSchedulerPageState();
}

class _LectureSchedulerPageState extends State<LectureSchedulerPage> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  void _showDateTimePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate)
      setState(() {
        selectedDate = pickedDate;
      });

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime)
      setState(() {
        selectedTime = pickedTime;
      });
  }

  void _scheduleLecture() async {
    final lecture = Lecture(
      id: 0, // Set the ID to 0 for creating a new lecture
      subject: subjectController.text,
      location: locationController.text,
      dateTime: DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      ),
    );

    // Create a JSON representation of the lecture
    final lectureJson = jsonEncode({
      'subject': lecture.subject,
      'location': lecture.location,
      'dateTime': lecture.dateTime.toIso8601String(),
    });

    final response = await http.post(
      Uri.parse(
          'http://localhost:8000/api/lectures'), // Replace with your API endpoint
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: lectureJson,
    );

    if (response.statusCode == 201) {
      // Lecture created successfully
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      final createdLecture = Lecture(
        id: responseData['id'], // Retrieve the ID from the response
        subject: lecture.subject,
        location: lecture.location,
        dateTime: lecture.dateTime,
      );

      setState(() {
        lectures.add(createdLecture);
      });

      subjectController.clear();
      locationController.clear();
    } else {
      // Handle API error, e.g., show an error message
      print('Failed to create lecture. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 208, 231, 244),
        title: Image.asset(
          "images/logo_retina.png",
          width: 160,
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); // Navigate back to the previous screen
            },
          ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Schedule a Lecture',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: subjectController,
              decoration: InputDecoration(labelText: 'Subject'),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            SizedBox(height: 8.0),
            Text(
              'Date & Time:',
              style: TextStyle(fontSize: 16.0),
            ),
            TextButton(
              onPressed: _showDateTimePicker,
              child: Text(
                '${selectedDate.toLocal()} ${selectedTime.format(context)}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 208, 231, 244),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 208, 231,
                    244), // Change this color to your desired color
              ),
              onPressed: _scheduleLecture,
              child: Text('Schedule Lecture'),
            ),
            SizedBox(height: 24.0),
            Text(
              'Scheduled Lectures:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            lectures.isEmpty
                ? Text('No lectures scheduled.')
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: lectures.length,
                    itemBuilder: (ctx, index) {
                      final lecture = lectures[index];
                      return ListTile(
                        title: Text('Subject: ${lecture.subject}'),
                        subtitle: Text('Location: ${lecture.location}\n'
                            'Date & Time: ${lecture.dateTime.toLocal()}'),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
