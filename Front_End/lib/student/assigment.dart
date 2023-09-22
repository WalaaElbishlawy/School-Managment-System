import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      home: AssignmentViewPage(),
    ));

class AssignmentViewPage extends StatefulWidget {
  @override
  _AssignmentViewPageState createState() => _AssignmentViewPageState();
}

class _AssignmentViewPageState extends State<AssignmentViewPage> {
  final List<Assignment> assignments = [
    Assignment(
      title: 'Assignment 1',
      description: 'Complete exercises 1-5 in Chapter 3.',
      dueDate: 'September 30, 2023',
    ),
    Assignment(
      title: 'Assignment 2',
      description: 'Write a 500-word essay on a chosen topic.',
      dueDate: 'October 10, 2023',
    ),
    // Add more assignments here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 208, 231, 244),
          // change icon of drawer
          iconTheme: IconThemeData(color: Colors.black),
          title: Image.asset(
            "images/logo.jpeg",
            width: 160,
          ),
      ),
      body: ListView.builder(
        itemCount: assignments.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(assignments[index].title),
            subtitle: Text(assignments[index].dueDate),
            onTap: () {
              _showAssignmentDetails(context, assignments[index]);
            },
          );
        },
      ),
    );
  }

  void _showAssignmentDetails(BuildContext context, Assignment assignment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(assignment.title),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(assignment.description),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _uploadAssignment(context, assignment);
                },
                child: Text('Upload Assignment'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _uploadAssignment(BuildContext context, Assignment assignment) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      PlatformFile file = result.files.first;

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://your-laravel-app-url/upload'), // Replace with your Laravel upload route
      );

      request.files.add(
        http.MultipartFile(
          'file',
          file.readStream!,
          file.size,
          filename: file.name,
        ),
      );

      try {
        var response = await request.send();
        if (response.statusCode == 200) {
          // File uploaded successfully
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Assignment Uploaded'),
                content: Text('File: ${file.name}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else {
          // Handle errors from the server
          print('File upload failed with status code: ${response.statusCode}');
        }
      } catch (e) {
        // Handle network errors
        print('Error during file upload: $e');
      }
    } else {
      // User either canceled the file selection or no file was selected.
      // You can handle this case as needed.
    }
  }
}

class Assignment {
  final String title;
  final String description;
  final String dueDate;

  Assignment({required this.title, required this.description, required this.dueDate});
}
