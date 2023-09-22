import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class TeacherDashboard extends StatelessWidget {
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
      body: ListView(padding: EdgeInsets.all(16.0), children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("images/material.jpg"),
            ),
            Text(
              'Add Matrial',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            AssignmentForm(),
          ],
        ),
      ]),
    );
  }
}

class AssignmentForm extends StatelessWidget {
  final TextEditingController assignmentTitleController =
      TextEditingController();
  final TextEditingController assignmentDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: assignmentTitleController,
          decoration: InputDecoration(labelText: 'lecture Title'),
        ),
        TextField(
          controller: assignmentDescriptionController,
          decoration: InputDecoration(labelText: 'Lecture Number'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 208, 231, 244)),
          onPressed: () async {
            final title = assignmentTitleController.text;
            final description = assignmentDescriptionController.text;
            // TODO: Handle assignment submission with file upload
            final filePickerResult = await FilePicker.platform.pickFiles();
            if (filePickerResult != null) {
              final file = filePickerResult.files.single;
              print('Lecture Title: $title, Number: $description');
              print('File Name: ${file.name}, File Path: ${file.path}');
            }
          },
          child: Text(
            'Upload',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
