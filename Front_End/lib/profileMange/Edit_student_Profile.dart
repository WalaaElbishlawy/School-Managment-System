// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';

import '../models/User.dart';
import '../widgets/profileWidget.dart';
import 'Profile_student.dart';
import 'package:school_system/models/userPreference.dart';
class EditStudentProfile extends StatefulWidget {
  const EditStudentProfile({super.key});

  @override
  State<EditStudentProfile> createState() => _EditStudentProfileState();
}

class _EditStudentProfileState extends State<EditStudentProfile> {
  User user = userPreference.myuser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 208, 231, 244),
        title: Image.asset(
          "images/logo_retina.png",
          width: 160,
        ),
      ),
      body: ListView(
          padding: EdgeInsets.only(top: 10),
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Color.fromARGB(255, 208, 231, 244),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Edit Student Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 50),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                ),
                initialValue: user.name,
                onChanged: (newValue) {
                  user.name = newValue;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 50),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Age',
                ),
                initialValue: user.age,
                onChanged: (newValue) {
                  user.age = newValue;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 50),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
                initialValue: user.address,
                onChanged: (newValue) {
                  user.address = newValue;
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Color.fromARGB(255, 208, 231, 244),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Edit Father Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 50),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Father Name',
                ),
                initialValue: user.fatherName,
                onChanged: (newValue) {
                  user.fatherName = newValue;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 50),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Material State',
                ),
                initialValue: user.materialState,
                onChanged: (newValue) {
                  user.materialState = newValue;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 50),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Work',
                ),
                initialValue: user.work,
                onChanged: (newValue) {
                  user.work = newValue;
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 208, 231, 244),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => profileForStudent()),
                );
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ]),
    );
  }
}
