import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_system/Home/home.dart';
import 'package:school_system/auth/register.dart';
import 'package:school_system/services/auth_services.dart';
import 'package:school_system/services/globals.dart';
import 'package:school_system/widgets/RoundedButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // Navigate to the homepage on successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                HomePage(), // Replace with your homepage widget
          ),
        );
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 208, 231, 244),
        title: Image.asset(
          "images/logo.jpeg",
          width: 160,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(right: 500, left: 500),
        children: [
          Column(
            children: [
              Image.asset("images/login.jpg"),
              Container(
                child: TypewriterAnimatedTextKit(
                  speed: Duration(
                      milliseconds:
                          250), // Speed at which each character appears
                  totalRepeatCount:
                      1, // Number of times the animation will repeat
                  text: [
                    'Hello!',
                    'Welcome',
                    "please login ",
                    "if you don't have an account please sign up"
                  ], // List of texts to animate
                  textStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight:
                          FontWeight.bold), // TextStyle for the animated text
                  textAlign: TextAlign.center,
                  // Text alignment
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                onChanged: (value) {
                  _email = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
                onChanged: (value) {
                  _password = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedButton(
                btnText: 'LOG IN',
                onBtnPressed: () => loginPressed(),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const RegisterScreen(),
                      ));
                },
                child: const Text(
                  'If you do not have an account click here',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
