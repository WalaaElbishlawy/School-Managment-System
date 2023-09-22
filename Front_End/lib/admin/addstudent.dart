// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EnrollmentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class EnrollmentScreen extends StatefulWidget {
  @override
  _EnrollmentScreenState createState() => _EnrollmentScreenState();
}

class _EnrollmentScreenState extends State<EnrollmentScreen> {
  List<String> classes = ['Class A', 'Class B', 'Class C'];
  List<String> genders = ['Male', 'Female'];

  String selectedClass = 'Class A';
  String selectedGender = 'Male'; // Default selected gender

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController fatherNationalIdController = TextEditingController();
  TextEditingController fatherEducationController = TextEditingController();
  TextEditingController fatherMobileController = TextEditingController();
  TextEditingController fatherJobController = TextEditingController();
  TextEditingController fatherIncomeController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController motherNationalIdController = TextEditingController();
  TextEditingController motherEducationController = TextEditingController();
  TextEditingController motherMobileController = TextEditingController();
  TextEditingController motherJobController = TextEditingController();
  TextEditingController motherIncomeController = TextEditingController();
  DateTime selectedBirthDate = DateTime.now(); // Default selected birth date

  Future<void> enrollStudent() async {
    if (_formKey.currentState?.validate() == true) {
      final url = Uri.parse(
          'http://127.0.0.1/api/enrollment'); // Replace with your API endpoint

      // Prepare the request body
      final Map<String, dynamic> data = {
        'name': nameController.text,
        'age': int.tryParse(ageController.text) ?? 0,
        'phone': phoneController.text,
        'address': addressController.text,
        'class': selectedClass,
        'gender': selectedGender,
        'birth_date': selectedBirthDate.toString(),
        'father_name': fatherNameController.text,
        'father_national_id': fatherNationalIdController.text,
        'father_education': fatherEducationController.text,
        'father_mobile': fatherMobileController.text,
        'father_job': fatherJobController.text,
        'father_income': fatherIncomeController.text,
        'mother_name': motherNameController.text,
        'mother_national_id': motherNationalIdController.text,
        'mother_education': motherEducationController.text,
        'mother_mobile': motherMobileController.text,
        'mother_job': motherJobController.text,
        'mother_income': motherIncomeController.text,
      };

      try {
        final response = await http.post(
          url,
          body: json.encode(data), // Encode data as JSON
          headers: {
            'Content-Type': 'application/json', // Set content type
          },
        );

        if (response.statusCode == 200) {
          // Enrollment successful, you can handle the response here
          print('Enrollment successful: ${response.body}');
          // Clear form fields here
          nameController.clear();
          ageController.clear();
          // ... Clear other controllers
        } else {
          // Handle error, e.g., display an error message
          print('Failed to enroll student: ${response.body}');
        }
      } catch (error) {
        // Handle network or other errors here
        print('Error enrolling student: $error');
      }
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
                    'Student Information',
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
                            InputDecoration(labelText: 'Name Of Student'),
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
                        value: selectedClass,
                        items: classes.map((className) {
                          return DropdownMenuItem<String>(
                            value: className,
                            child: Text(className),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedClass = newValue!;
                          });
                        },
                        decoration: InputDecoration(labelText: 'Select Class'),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a class';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
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
                SizedBox(height: 10),
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
                    'Father Information (Optional)',
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
                        controller: fatherNameController,
                        decoration:
                            InputDecoration(labelText: 'Father\'s Name'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: fatherNationalIdController,
                        decoration:
                            InputDecoration(labelText: 'National ID No'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: fatherEducationController,
                        decoration: InputDecoration(labelText: 'Education'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: fatherMobileController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(labelText: 'Mobile Number'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: fatherJobController,
                        decoration: InputDecoration(labelText: 'Job'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: fatherIncomeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Income'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
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
                    'Mother Information (Optional)',
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
                        controller: motherNameController,
                        decoration:
                            InputDecoration(labelText: 'Mother\'s Name'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: motherNationalIdController,
                        decoration:
                            InputDecoration(labelText: 'National ID No'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: motherEducationController,
                        decoration: InputDecoration(labelText: 'Education'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: motherMobileController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(labelText: 'Mobile Number'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: motherJobController,
                        decoration: InputDecoration(labelText: 'Job'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: motherIncomeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Income'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 208, 231, 244)),
                  onPressed: enrollStudent,
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
