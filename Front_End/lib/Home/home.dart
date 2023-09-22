// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatelessWidget {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 208, 231, 244),
        title: Image.asset(
          "images/logo_retina.png",
          width: 160,
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("register");
              },
              child: Text(
                "LOGIN ",
                style: isHovered
                    ? TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      )
                    : TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                      ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // School Logo and Title
            SchoolHeader(),
            SizedBox(height: 20),
            // Animated welcome text
            AnimatedText(),
            SizedBox(height: 20),
            // Vision Section
            VisionSection(),
            SizedBox(height: 20),
            // Photos in a Row
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center photos horizontally
              children: [
                // Photo Section 1
                PhotoSection(
                  imagePath: 'images/home.jpeg',
                  tag: 'photo1',
                ),
                // Photo Section 2
                PhotoSection(
                  imagePath: 'images/home1.jpg', // Replace with your image path
                  tag: 'photo2',
                ),
                // Photo Section 3
                PhotoSection(
                  imagePath:
                      'images/home2.jpeg', // Replace with your image path
                  tag: 'photo3',
                ),
              ],
            ),
            SizedBox(height: 20),
            // Quick links or features
            FeatureButtons(),
          ],
        ),
      ),
    );
  }
}

class SchoolHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // School Logo with Hero animation
        SizedBox(height: 10),
        // School Title
        Text(
          'Our School',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class AnimatedText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      child: AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText('Welcome to our School!'),
          TyperAnimatedText('Explore the School Management System.'),
          TyperAnimatedText('Manage students, teachers, and more.'),
          TyperAnimatedText('Get started now!'),
        ],
        onTap: () {
          print("Text tapped.");
        },
      ),
    );
  }
}

class VisionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Our Vision',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'To provide quality education and foster a culture of learning and innovation for future leaders.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class PhotoSection extends StatelessWidget {
  final String imagePath;
  final String tag;

  PhotoSection({required this.imagePath, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Photo with Hero animation
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoDetail(
                    imagePath: imagePath,
                    tag: tag,
                  ),
                ),
              );
            },
            child: Hero(
              tag: tag,
              child: Image.asset(
                imagePath,
                width: 300,
                height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("student");
          },
          child: Text('Students'),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("teacherAccount");
          },
          child: Text('Teachers'),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("admin");
          },
          child: Text('Admin'),
        ),
      ],
    );
  }
}

class PhotoDetail extends StatelessWidget {
  final String imagePath;
  final String tag;

  PhotoDetail({required this.imagePath, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Detail'),
      ),
      body: Center(
        child: Hero(
          tag: tag,
          child: Image.asset(
            imagePath,
            width: 400,
            height: 300,
          ),
        ),
      ),
    );
  }
}
