import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UploadAssigmentAndQuizes extends StatefulWidget {
  @override
  _UploadAssigmentAndQuizesState createState() =>
      _UploadAssigmentAndQuizesState();
}

class _UploadAssigmentAndQuizesState extends State<UploadAssigmentAndQuizes> {
  final TextEditingController assignmentTitleController =
      TextEditingController();
  final TextEditingController assignmentDescriptionController =
      TextEditingController();

  final TextEditingController quizTitleController = TextEditingController();
  final TextEditingController quizQuestionController = TextEditingController();

  Future<void> uploadAssignment() async {
    final title = assignmentTitleController.text;
    final description = assignmentDescriptionController.text;

    final filePickerResult = await FilePicker.platform.pickFiles();
    if (filePickerResult != null) {
      final file = filePickerResult.files.single;
      // Send the assignment data and file to the Laravel backend
      final response = await http.post(
        Uri.parse(
            'http://127.0.0.1:8000/api/assignments'), // Replace with your Laravel API URL
        body: {
          'title': title,
          'description': description,
          // You may need to adjust the file field name according to your Laravel API expectations
          'file': base64Encode(
              file.bytes as List<int>), // Send file as base64 encoded string
        },
      );

      if (response.statusCode == 200) {
        // Assignment creation successful
        print('Assignment created successfully');
      } else {
        // Handle errors
        print('Failed to create assignment: ${response.body}');
      }
    }
  }

  Future<void> uploadQuiz() async {
    final title = quizTitleController.text;
    final question = quizQuestionController.text;

    final filePickerResult = await FilePicker.platform.pickFiles();
    if (filePickerResult != null) {
      final file = filePickerResult.files.single;
      // Send the quiz data and file to the Laravel backend
      final response = await http.post(
        Uri.parse(
            'http://127.0.0.1:8000/api/quizzes'), // Replace with your Laravel API URL
        body: {
          'title': title,
          'question': question,
          // You may need to adjust the file field name according to your Laravel API expectations
          'file': base64Encode(
              file.bytes as List<int>), // Send file as base64 encoded string
        },
      );

      if (response.statusCode == 200) {
        // Quiz creation successful
        print('Quiz created successfully');
      } else {
        // Handle errors
        print('Failed to create quiz: ${response.body}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 208, 231, 244),
          iconTheme: IconThemeData(color: Colors.black),
          title: Image.asset(
            "images/logo.jpeg",
            width: 160,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); // Navigate back to the previous screen
            },
          ),
        ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width:300,
                height:300,
                child:Image.asset("images/assig.jpg"),
              ),
              
              Text(
                'Add Assignment',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              AssignmentForm(
                assignmentTitleController: assignmentTitleController,
                assignmentDescriptionController:
                    assignmentDescriptionController,
                onAssignmentUpload: uploadAssignment,
              ),
              SizedBox(height: 16.0),
              Text(
                'Add Quiz',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              QuizForm(
                quizTitleController: quizTitleController,
                quizQuestionController: quizQuestionController,
                onQuizUpload: uploadQuiz,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AssignmentForm extends StatelessWidget {
  final TextEditingController assignmentTitleController;
  final TextEditingController assignmentDescriptionController;
  final Function onAssignmentUpload;

  AssignmentForm({
    required this.assignmentTitleController,
    required this.assignmentDescriptionController,
    required this.onAssignmentUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: assignmentTitleController,
          decoration: InputDecoration(labelText: 'Assignment Title'),
        ),
        TextField(
          controller: assignmentDescriptionController,
          decoration: InputDecoration(labelText: 'Assignment Description'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 208, 231, 244),
          ),
          onPressed: () {
            onAssignmentUpload(); // Call the function to upload the assignment
          },
          child: Text(
            'Create Assignment',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class QuizForm extends StatelessWidget {
  final TextEditingController quizTitleController;
  final TextEditingController quizQuestionController;
  final Function onQuizUpload;

  QuizForm({
    required this.quizTitleController,
    required this.quizQuestionController,
    required this.onQuizUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: quizTitleController,
          decoration: InputDecoration(labelText: 'Quiz Title'),
        ),
        TextField(
          controller: quizQuestionController,
          decoration: InputDecoration(labelText: 'Quiz Question'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 208, 231, 244),
          ),
          onPressed: () {
            onQuizUpload(); // Call the function to upload the quiz
          },
          child: Text(
            'Create Quiz',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
