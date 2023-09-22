// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, camel_case_types, prefer_const_declarations, unused_import

import 'package:flutter/material.dart';

import 'package:school_system/widgets/profileWidget.dart';
import '../models/User.dart';
import '../widgets/buttonEdit.dart';
import 'EditProfile.dart';
import 'package:school_system/models/userPreference.dart';
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    final user = userPreference.myuser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 208, 231, 244),
        title: Image.asset(
          "images/logo_retina.png",
          width: 160,
        ),
      ),
      body: Center(
        child: Container(
          child: ListView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.grey[100],
                  width: double.infinity,
                  margin: EdgeInsets.all(20),
                  child: Center(
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: Text(
                          " Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 208, 231, 244),
                        ),
                        width: double.infinity,
                        height: 50,
                      ),
                      ProfileWidget(
                        imagePath: user.imagePath,
                        isEdit: false,
                        onClicked: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditProfile()));
                        },
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        color: Color.fromARGB(255, 208, 231, 244),
                        child: Text(
                          "Student Details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 60,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(10),
                              child: Text(
                                "Name ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            buildName(user),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 60,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(10),
                              child: Text(
                                "Address ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            buildAddress(user),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 60,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(10),
                              child: Text(
                                "Age ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            buildAge(user),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 60,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(10),
                              child: Text(
                                "Identifcation Number ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            buildId(user),
                          ]),
                      Container(
                        margin: EdgeInsets.all(5),
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        color: Color.fromARGB(255, 208, 231, 244),
                        child: Text(
                          "Guardian Details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 60,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Guardian Name ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            buildFatherName(user),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 60,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(10),
                              child: Text(
                                "Job ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            buildWork(user),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 60,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(10),
                              child: Text(
                                "Material Status ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            buildMatrialStatus(user),
                          ]),
                      Container(
                          alignment: Alignment.center, child: buildEditB()),
                    ]),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Container(
            width: 100,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      );

  Widget buildAddress(User user) => Column(
        children: [
          Container(
            width: 100,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              user.address,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      );

  Widget buildAge(User user) => Column(
        children: [
          Container(
            width: 100,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              user.age,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      );
  Widget buildId(User user) => Column(
        children: [
          Container(
            width: 100,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              user.identificationNum,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      );
  Widget buildFatherName(User user) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              user.fatherName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      );
  Widget buildWork(User user) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              user.work,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      );
  Widget buildMatrialStatus(User user) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              user.materialState,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      );
  Widget buildEditB() => ButtonWidget(
        text: "Edit Profile",
        onClicked: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EditProfile()));
        },
      );
}
