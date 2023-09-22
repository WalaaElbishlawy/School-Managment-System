import 'package:school_system/models/adminPreference.dart';
import 'package:school_system/models/adminprofile.dart';
import 'package:school_system/profileMange/Edit_admin_profile.dart';
import 'package:flutter/material.dart';
import 'package:school_system/widgets/profileWidget.dart';
import '../widgets/buttonEdit.dart';
class profileForAdmin extends StatefulWidget {
  const profileForAdmin({super.key});

  @override
  State<profileForAdmin> createState() => _profileForAdminState();
}

class _profileForAdminState extends State<profileForAdmin> {
  @override
  Widget build(BuildContext context) {
    final admin_profile = AdminPreference.myAdmin;
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
                        imagePath: admin_profile.imagePath,
                        isEdit: false,
                        onClicked: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditAdminProfile()));
                        },
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        color: Color.fromARGB(255, 208, 231, 244),
                        child: Text(
                          "Admin Details",
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
                            buildName(admin_profile),
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
                            buildAddress(admin_profile),
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
                            buildAge(admin_profile),
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
                            buildId(admin_profile),
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
                            buildWork(admin_profile),
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
  Widget buildName(admin_profile admin_profile) => Column(
        children: [
          Container(
            width: 100,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              admin_profile.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      );

  Widget buildAddress(admin_profile Teacher_profile) => Column(
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

  Widget buildAge(admin_profile Teacher_profile) => Column(
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
  Widget buildId(admin_profile Teacher_profile) => Column(
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
  Widget buildWork(admin_profile admin_profile) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              admin_profile.work,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      );
  Widget buildEditB() => ButtonWidget(
        text: "Edit Profile",
        onClicked: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EditAdminProfile()));
        },
      );
}
