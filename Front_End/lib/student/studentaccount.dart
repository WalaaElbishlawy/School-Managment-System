import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class studentAccount extends StatefulWidget {
  @override
  studentAccountState createState() => studentAccountState();
}

class studentAccountState extends State<studentAccount> {
  String greeting = 'welcome ';
  String message = 'in your account';

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the page is initialized
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'http://127.0.0.1:8000/api/StudentAccount')); // Replace with your API URL

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        greeting = data['greeting'];
        message = data['message'];
      });
    } else {
      // Handle error
      print('Failed to fetch data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 208, 231, 244),
          iconTheme: IconThemeData(color: Colors.black),
          title: Image.asset(
            "images/logo.jpeg",
            width: 160,
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text(
                    'profile',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "profile");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  leading: const Icon(Icons.school),
                  title: const Text(
                    'Assigment',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "assignmentViewPage");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  leading: const Icon(Icons.school),
                  title: const Text(
                    'Event',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "studentevent");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "home");
                    //
                  },
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  child: Image.asset(
                    'images/frist_photo.png',
                    height: 250,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: TypewriterAnimatedTextKit(
                    speed: Duration(milliseconds: 350),
                    totalRepeatCount: 1,
                    text: [
                      greeting,
                      message,
                    ],
                    textStyle: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
