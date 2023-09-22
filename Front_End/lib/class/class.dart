import 'package:flutter/material.dart';
import 'package:school_system/class/classRequirement.dart';

class MultiSelectSubject extends StatefulWidget {
  final List<String> subjet;
  const MultiSelectSubject({Key? key, required this.subjet}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectSubjectState();
}

class _MultiSelectSubjectState extends State<MultiSelectSubject> {
  // this variable holds the selected subjet
  final List<String> _selectedsubjet = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedsubjet.add(itemValue);
      } else {
        _selectedsubjet.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedsubjet);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Select Topics',
        style: TextStyle(color: Colors.black),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.subjet
              .map((item) => CheckboxListTile(
                    value: _selectedsubjet.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text(
            'Cancel',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 208, 231, 244)),
          onPressed: _submit,
          child: const Text(
            'Submit',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
/////////////////////////////////

class MultiSelectTeacher extends StatefulWidget {
  final List<String> teacher;
  const MultiSelectTeacher({Key? key, required this.teacher}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectTeacherState();
}

class _MultiSelectTeacherState extends State<MultiSelectTeacher> {
  // this variable holds the selected teacher
  final List<String> _selectedteacher = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedteacher.add(itemValue);
      } else {
        _selectedteacher.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedteacher);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:
          const Text('Select teacher', style: TextStyle(color: Colors.black)),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.teacher
              .map((item) => CheckboxListTile(
                    value: _selectedteacher.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text(
            'Cancel',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 208, 231, 244)),
          onPressed: _submit,
          child: const Text(
            'Submit',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

///////////////////////////
// Implement a multi select on the Home screen
class SelectSubjectAndClass extends StatefulWidget {
  const SelectSubjectAndClass({Key? key}) : super(key: key);

  @override
  State<SelectSubjectAndClass> createState() => _SelectSubjectAndClassState();
}

class _SelectSubjectAndClassState extends State<SelectSubjectAndClass> {
  String? _educationalLevel;
  String? level;
  List<String> _selectedsubjet = [];
  List<String> classes = [];
  List<String> _selectedTeacher = [];
  void _showMultiSelectSubject() async {
    final List<String> subjet = [
      'Flutter',
      'Node.js',
      'React Native',
      'Java',
      'Docker',
      'MySQL'
    ];

    final List<String>? resultsOfSbject = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectSubject(subjet: subjet);
      },
    );

    // Update UI
    if (resultsOfSbject != null) {
      setState(() {
        _selectedsubjet = resultsOfSbject;
      });
    }
  }

  void _showMultiSelectTeacher() async {
    final List<String> teacher = [
      'jana',
      'nour',
      'walaa',
      'aliaa',
      'ali',
      'alaa'
    ];

    final List<String>? resultsOfteacher = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectTeacher(teacher: teacher);
      },
    );
    if (resultsOfteacher != null) {
      setState(() {
        _selectedTeacher = resultsOfteacher;
      });
    }
  }

  List<String> _selectedstudent = [];

  void _showMultiSelectStudent() async {
    List<Map<String, dynamic>> student = [
      {"id": 1, "name": "safaa", "age": 20},
      {"id": 2, "name": "safy", "age": 20},
      {"id": 1, "name": "safaa", "age": 20},
      {"id": 2, "name": "bsant", "age": 20},
      {"id": 1, "name": "walaa", "age": 20},
      {"id": 2, "name": "aliaa", "age": 20},
      {"id": 1, "name": "khaled", "age": 20},
      {"id": 2, "name": "mama", "age": 20},
      {"id": 1, "name": "nour", "age": 20},
      {"id": 2, "name": "nancy", "age": 20},
      {"id": 1, "name": "jana", "age": 20},
      {"id": 2, "name": "saphain", "age": 20},
    ];

    final List<String>? resultsOfStudent = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(student: student);
      },
    );

    if (resultsOfStudent != null) {
      setState(() {
        _selectedstudent = resultsOfStudent;
      });
    }
  }

  void ShowClass() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Class Details', style: TextStyle(color: Colors.black)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the user's level
              Text('Educational Level: ${_educationalLevel ?? "N/A"}'),
              const SizedBox(height: 8),
              Text('Level: ${level ?? "None"}'),
              const SizedBox(height: 8),
              Text('Class Name: ${classes.isNotEmpty ? classes.last : "N/A"}'),
              const SizedBox(height: 8),
              Text(
                  'Selected Subjects: ${_selectedsubjet.isNotEmpty ? _selectedsubjet.join(", ") : "None"}'),
              const SizedBox(height: 8),
              Text(
                  'Selected teacher: ${_selectedTeacher.isNotEmpty ? _selectedTeacher.join(", ") : "None"}'),
              const SizedBox(height: 8),
              Text(
                  'Selected Students: ${_selectedstudent.isNotEmpty ? _selectedstudent.join(", ") : "None"}'),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 208, 231, 244),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            ),
          ],
        );
      },
    );
  }

  void _submit() async {
    try {
      final createdClass = await createClass({
        'educationalLevel': _educationalLevel, // Replace with your data
        'level': level, // Replace with your data
        'selectedSubjects': _selectedsubjet, // Replace with your data
        'selectedTeachers': _selectedTeacher, // Replace with your data
        'selectedStudents': _selectedstudent, // Replace with your data
      });

      // Process the response as needed
      print('Created class: $createdClass');

      if (createdClass.containsKey('id')) {
        final classId = createdClass['id'];
        final classDetails = await getClassDetails(classId);

        // Process the class details response as needed
        print('Class details: $classDetails');
      } else {
        print('Class ID not found in the response.');
      }

      Navigator.pop(context);
    } catch (e) {
      print('Error creating class: $e');
      // Handle the error here
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
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // use this button to open the multi-select dialog
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      //color: Color.fromARGB(255, 112, 236, 236),
                      child: Text(
                        'Classes',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset("images/class.jpeg"),
                    ),
                    SizedBox(height: 20),
//////////////////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // ...
                          DropdownButton<String>(
                            value: _educationalLevel,
                            onChanged: (String? newValue) {
                              setState(() {
                                _educationalLevel = newValue;
                              });
                            },
                            items: <String>[
                              'Primary',
                              'Secondary',
                              'Higher Secondary',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: Text('Select Educational Level'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),

                    TextField(
                      onChanged: (value) => level = value,
                      decoration: InputDecoration(
                        labelText: 'Level',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
///////////////////////////////////////////////////
                    TextField(
                      onChanged: (value) => classes.add(value),
                      decoration: InputDecoration(
                          labelText: 'Class Name',
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _showMultiSelectSubject,
                child: const Text('Select Your subject',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 208, 231, 244)),
                ),
              ),
              const Divider(
                height: 30,
              ),
              // display selected subjet
              Wrap(
                children: _selectedsubjet
                    .map((e) => Chip(
                          label: Text(e),
                        ))
                    .toList(),
              ),
              ElevatedButton(
                onPressed: _showMultiSelectTeacher,
                child: const Text('Select Your teacher',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 208, 231, 244)),
                ),
              ),
              const Divider(
                height: 30,
              ),
              // display selected subjet
              Wrap(
                children: _selectedTeacher
                    .map((e) => Chip(
                          label: Text(e),
                        ))
                    .toList(),
              ),
              ElevatedButton(
                onPressed: _showMultiSelectStudent,
                child: const Text('Select student in class',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 208, 231, 244)),
                ),
              ),
              const Divider(
                height: 30,
              ),
              Wrap(
                children: _selectedstudent
                    .map((e) => Chip(
                          label: Text(e),
                        ))
                    .toList(),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 208, 231, 244)),
                onPressed: ShowClass,
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              //information on data base
              //   ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: classes.length,
              //   itemBuilder: (context, index) {
              //     return ListTile(
              //       title: Text(classes[index]),
              //       subtitle: Text("subjects$_selectedsubjet,student $_selectedstudent"),
              //     );
              //   },
              // ),
              /////
            ],
          ),
        ),
      ]),
    );
  }
}

class MultiSelect extends StatefulWidget {
  final List<Map<String, dynamic>> student;
  const MultiSelect({Key? key, required this.student}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  final List<String> _selectedstudent = [];
  String searchQuery = '';

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedstudent.add(itemValue);
      } else {
        _selectedstudent.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedstudent);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Student'),
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ListBody(
                children: widget.student
                    .where((item) =>
                        item["name"].toLowerCase().contains(searchQuery))
                    .map((item) => CheckboxListTile(
                          value: _selectedstudent.contains(item["name"]),
                          title: Text(item["name"]),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (isChecked) =>
                              _itemChange(item["name"], isChecked!),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text(
            'Cancel',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 208, 231, 244)),
          onPressed: _submit,
          child: const Text(
            'Submit',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ],
    );
  }
}
