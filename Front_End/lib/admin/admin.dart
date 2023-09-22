import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  String message = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Fetch data from the server
    // ...
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 208, 231, 244),
          iconTheme: IconThemeData(color: Colors.black),
          title: Image.asset(
            "images/logo.jpeg",
            width: 160, // Adjust the logo width
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
                    'Classes',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "manageclass");
                    //
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text(
                    'Add Student',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "addstudent");
                    //
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  leading: const Icon(Icons.group),
                  title: const Text(
                    'Add Employees',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "addemployee");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  leading: const Icon(Icons.money),
                  title: const Text(
                    'Fees',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "fee handling");
                    //
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
                    'Event',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "createEvent");
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0, // Added space at the top
                ),
                Container(
                  child: TypewriterAnimatedTextKit(
                    speed: Duration(milliseconds: 350),
                    totalRepeatCount: 1,
                    text: [
                      'Hello!',
                      'Welcome to your admin account',
                    ],
                    textStyle: TextStyle(
                      fontSize: screenWidth < 600
                          ? 20.0
                          : 24.0, // Adjust the font size
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20.0, // Added space between text and roles
                ),
                Text(
                  'Roles:',
                  style: TextStyle(
                    fontSize:
                        screenWidth < 600 ? 16.0 : 20.0, // Adjust the font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Wrap(
                  spacing: 8.0, // Adjust the spacing between RoleCards
                  runSpacing: 8.0,
                  alignment: WrapAlignment.center,
                  children: [
                    RoleCard(
                        title: 'create class',
                        description: 'create classes for student an manage it'),
                    RoleCard(
                        title: 'add employee',
                        description:
                            'add a employee to staff teacher,libarain and manger'),
                    RoleCard(
                        title: 'fees managment',
                        description: 'manages fees for student and payment'),
                  ],
                ),

                // Add more photos as needed...
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  final String title;
  final String description;

  RoleCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final cardWidth =
        MediaQuery.of(context).size.width * 0.9; // Adjust the card width

    return Container(
      width: cardWidth,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0.0, 4.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class HoverPhoto extends StatefulWidget {
  final String imagePath;

  HoverPhoto({required this.imagePath});

  @override
  _HoverPhotoState createState() => _HoverPhotoState();
}

class _HoverPhotoState extends State<HoverPhoto> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle photo click
      },
      onHover: (hovering) {
        setState(() {
          isHovered = hovering;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0.0, 4.0),
                    blurRadius: 10.0,
                  ),
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            widget.imagePath,
            width: 200.0,
            height: 150.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
