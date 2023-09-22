// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:school_system/auth/register.dart';
import 'package:school_system/fee_Handling/fee.dart';
import 'package:school_system/profileMange/Profile.dart';
import 'package:school_system/student/assigment.dart';
import 'package:school_system/student/event.dart';
import 'package:school_system/student/studentaccount.dart';
import 'package:school_system/teacher/onlineMeeting.dart';
import 'package:school_system/teacher/teacherAccout.dart';
import 'package:school_system/teacher/teacherSchedule.dart';
import 'package:school_system/teacher/uploadAssigment.dart';
import 'package:school_system/teacher/uploadMatrial.dart';
import 'Home/home.dart';
import 'auth/login.dart';
import 'admin/addemployee.dart';
import 'admin/addstudent.dart';
import 'admin/admin.dart';
import 'class/attendance.dart';
import 'class/calendar.dart';
import 'class/class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primaryColor: Colors.blue,
        primaryColor: Color.fromARGB(255, 168, 222, 247),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 20, color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          // Set the arrow icon color to black for all AppBar instances
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: LoginScreen(),
      routes: {
        "home": (context) => HomePage(),
        "profile": (context) => profile(),
        "Login": (context) => LoginScreen(),
        "register": (context) => RegisterScreen(),
        "addstudent": (context) => EnrollmentScreen(),
        "manageclass": (context) => SelectSubjectAndClass(),
        "takeattendance": (context) => Attendance(),
        "createEvent": (context) => SchoolCalendarScreen(),
        "admin": (context) => AdminPage(),
        "addemployee": (context) => EnrollmentEmployee(),
        "teacherScedule": (context) => LectureSchedulerPage(),
        "onlineMeeting": (context) => ZoomMeetingPage(),
        "Lectureschedule": (context) => LectureSchedulerPage(),
        "UploadMatrial": (context) => TeacherDashboard(),
        "UploadAssigment": (context) => UploadAssigmentAndQuizes(),
        "teacherAccount": (context) => TeacherHomePage(),
        "fee handling": (context) => FeeManagementScreen(),
        "student": (context) => studentAccount(),
        "assignmentViewPage": (context) => AssignmentViewPage(),
        "studentevent": (context) => Events()
      },
    );
  }
}
