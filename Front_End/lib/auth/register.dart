import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:http/http.dart' as http;
import 'package:school_system/auth/login.dart';
import 'package:school_system/services/auth_services.dart';
import 'package:school_system/services/globals.dart';
import 'package:school_system/widgets/RoundedButton.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email = '';
  String _password = '';
  String _name = '';

  createAccountPressed() async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
    if (emailValid) {
      http.Response response =
          await AuthServices.register(_name, _email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const LoginScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'email not valid');
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
                Image.asset("images/login2.jpg"),
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
                      'To langugage School',
                      "please login ",
                      "if you don't have account please sign up"
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
                  height: 10,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                  onChanged: (value) {
                    _name = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
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
                    hintText: 'Password',
                  ),
                  onChanged: (value) {
                    _password = value;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                RoundedButton(
                  btnText: 'Create Account',
                  onBtnPressed: () => createAccountPressed(),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const LoginScreen(),
                        ));
                  },
                  child: const Text(
                    'already have an account',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ]),
    );
  }
}
