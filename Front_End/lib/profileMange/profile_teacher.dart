import 'package:school_system/models/teacherprofile.dart';
import 'package:school_system/profileMange/Edit_teacher_profile.dart';
import 'package:flutter/material.dart';
import 'package:school_system/widgets/profileWidget.dart';
import '../widgets/buttonEdit.dart';
import 'package:school_system/models/teacherPerference.dart';
class profileForTeacher extends StatefulWidget {
  const profileForTeacher({super.key});

  @override
  State<profileForTeacher> createState() => _profileForTeacherState();
}

class _profileForTeacherState extends State<profileForTeacher> {
  @override
  Widget build(BuildContext context) {
    final Teacher_profile = teacherPreference.myteacher;
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
                        imagePath: Teacher_profile.imagePath,
                        isEdit: false,
                        onClicked: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditTeacherProfile()));
                        },
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        color: Color.fromARGB(255, 208, 231, 244),
                        child: Text(
                          "Teacher Details",
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
                            buildName(Teacher_profile),
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
                            buildAddress(Teacher_profile),
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
                            buildAge(Teacher_profile),
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
                            buildId(Teacher_profile),
                          ]),
                      Container(
                        margin: EdgeInsets.all(5),
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        color: Color.fromARGB(255, 208, 231, 244),
                        child: Text(
                          "Work Details",
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
                                "Job ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            buildWork(Teacher_profile),
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
  Widget buildName(Teacher_profile Teacher_profile) => Column(
        children: [
          Container(
            width: 100,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              Teacher_profile.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      );

  Widget buildAddress(Teacher_profile Teacher_profile) => Column(
        children: [
          Container(
            width: 100,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              Teacher_profile.address,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      );

  Widget buildAge(Teacher_profile Teacher_profile) => Column(
        children: [
          Container(
            width: 100,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              Teacher_profile.age,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      );
  Widget buildId(Teacher_profile Teacher_profile) => Column(
        children: [
          Container(
            width: 100,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              Teacher_profile.identificationNum,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      );
  Widget buildWork(Teacher_profile Teacher_profile) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              Teacher_profile.work,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      );
  Widget buildEditB() => ButtonWidget(
        text: "Edit Profile",
        onClicked: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EditTeacherProfile()));
        },
      );
}
