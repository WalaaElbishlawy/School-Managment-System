import 'package:flutter/material.dart';

class TeacherHomePage extends StatelessWidget {
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
                    'upload material',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                     Navigator.pushNamed(context, "UploadMatrial");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  leading: const Icon(Icons.school),
                  title: const Text(
                    'Add assigmet and quizes',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "UploadAssigment");
                    //
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  leading: const Icon(Icons.group),
                  title: const Text(
                    'create online class',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "onlineMeeting");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  leading: const Icon(Icons.front_hand),
                  title: const Text(
                    'Attendance',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "takeattendance");
                    //
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  leading: const Icon(Icons.event_note),
                  title: const Text(
                    'Lectures schedule',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "Lectureschedule");
                    //
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, Teacher!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Roles:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. Conduct classes and lectures.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2. Assign homework and grade assignments.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '3. Provide guidance and support to students.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Vision:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'To inspire and educate the next generation.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Rights:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. Right to a safe and respectful working environment.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2. Right to professional development opportunities.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset("images/teaching.jpg", width: 200.0, height: 150.0, fit: BoxFit.cover),
                    SizedBox(height: 8.0),
                    Text(
                      'Teaching',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("images/inclass.jpeg", width: 200.0, height: 150.0, fit: BoxFit.cover),
                    SizedBox(height: 8.0),
                    Text(
                      'In Class',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("images/withstudents.jpg", width: 200.0, height: 150.0, fit: BoxFit.cover),
                    SizedBox(height: 8.0),
                    Text(
                      'With Students',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


