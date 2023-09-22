// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EnrollmentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enrollment and Admission',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    );
  }
}

class EnrollmentEmployee extends StatefulWidget {
  @override
  _EnrollmentEmployeeState createState() => _EnrollmentEmployeeState();
}

class _EnrollmentEmployeeState extends State<EnrollmentEmployee> {
  List<String> classes = ['Class A', 'Class B', 'Class C'];
  List<String> genders = ['Male', 'Female'];
  List<String> technicals = ['technical', 'not technical'];

  String selectedClass = 'Class A';
  String selectedGender = 'Male'; // Default selected gender
  String selectedtechnical = 'technical';

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController sallaryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController NationalIDController = TextEditingController();

  DateTime selectedBirthDate = DateTime.now(); // Default selected birth date

//////////////////////
  Future<void> enrollEmployee() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/employees');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': nameController.text,
          'age': int.tryParse(ageController.text) ?? 0,
          'national_id': NationalIDController.text,
          'gender': selectedGender,
          'salary': double.tryParse(sallaryController.text) ?? 0,
          'major': majorController.text,
          'phone': phoneController.text,
          'address': addressController.text,
          'technical': selectedtechnical,
          'birth_date': selectedBirthDate.toLocal().toString(),
        }),
      );

      if (response.statusCode == 201) {
        // Employee created successfully
        print('Employee created.');
        // Optionally, display a success message to the user
      } else {
        // Handle HTTP error (e.g., display an error message)
        print('Failed to create employee: ${response.statusCode}');
        // Optionally, display an error message to the user
      }
    } catch (e) {
      // Handle network or other errors
      print('Error creating employee: $e');
      // Optionally, display an error message to the user
    }
  }

  void enrollment() {
    if (_formKey.currentState?.validate() == true) {
      String name = nameController.text;
      int age = int.tryParse(ageController.text) ?? 0;
      String phone = phoneController.text;
      String address = addressController.text;
      String major = majorController.text;
      String NationalId = NationalIDController.text;
      double salally = double.tryParse(sallaryController.text) ?? 0;
      ;

      nameController.clear();
      ageController.clear();
      phoneController.clear();
      addressController.clear();
      majorController.clear();
      sallaryController.clear();
      NationalIDController.clear();
    }
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 208, 231, 244),
                    border:
                        Border.all(color: Color.fromARGB(255, 208, 231, 244)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'employee Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        decoration:
                            InputDecoration(labelText: 'Name Of employee'),
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Age'),
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Please enter an age';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: NationalIDController,
                        decoration: InputDecoration(labelText: 'National ID'),
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Please enter National ID';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedGender,
                        items: genders.map((gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedGender = newValue!;
                          });
                        },
                        decoration: InputDecoration(labelText: 'Select Gender'),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a gender';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: sallaryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'sallary'),
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Please enter sallary';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: majorController,
                        decoration: InputDecoration(labelText: 'major'),
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Please enter major';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(labelText: 'Mobile Number'),
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Please enter a phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(labelText: 'Address'),
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Please enter an address';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedtechnical,
                        items: technicals.map((technical) {
                          return DropdownMenuItem<String>(
                            value: technical,
                            child: Text(technical),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedtechnical = newValue!;
                          });
                        },
                        decoration:
                            InputDecoration(labelText: 'Select Technical'),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a technical or not technical';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('Birth Date:'),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedBirthDate,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null &&
                            pickedDate != selectedBirthDate) {
                          setState(() {
                            selectedBirthDate = pickedDate;
                          });
                        }
                      },
                      child: Text(
                          '${selectedBirthDate.day}/${selectedBirthDate.month}/${selectedBirthDate.year}'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 208, 231, 244)),
                  onPressed: enrollment,
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
