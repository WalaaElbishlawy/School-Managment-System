import 'package:flutter/material.dart';

class FeeManagementScreen extends StatefulWidget {
  @override
  _FeeManagementScreenState createState() => _FeeManagementScreenState();
}

class _FeeManagementScreenState extends State<FeeManagementScreen> {
  List<Student> students = [
    Student(name: 'John', admissionNumber: 'A001'),
    Student(name: 'Alice', admissionNumber: 'A002'),
    Student(name: 'Bob', admissionNumber: 'A003'),
    // Add more students here
  ];

  TextEditingController _feeController = TextEditingController();
  String? selectedStudent;

  void _handleFeePayment() {
    // Implement logic to record fee payment here
    // You can send this data to your backend API for storage
    final double feeAmount = double.tryParse(_feeController.text) ?? 0.0;
    if (feeAmount > 0 && selectedStudent != null) {
      // Record the payment and generate an invoice/receipt
      final String invoiceMessage =
          'Invoice for $selectedStudent: \$${feeAmount.toStringAsFixed(2)}';
      // Display the invoice/receipt to the user (you can use a dialog or a screen)
      _showInvoiceDialog(invoiceMessage);
    }
  }

  void _showInvoiceDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invoice/Receipt'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Select Student:',
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton<String>(
              value: selectedStudent,
              onChanged: (String? newValue) {
                setState(() {
                  selectedStudent = newValue;
                });
              },
              items: students.map<DropdownMenuItem<String>>((Student student) {
                return DropdownMenuItem<String>(
                  value: student.name,
                  child: Text(student.name),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _feeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Fee Amount',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleFeePayment,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color.fromARGB(255, 208, 231, 244), // Change the color here
              ),
              child: Text(
                'Pay Fee',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Student {
  final String name;
  final String admissionNumber;

  Student({
    required this.name,
    required this.admissionNumber,
  });
}
