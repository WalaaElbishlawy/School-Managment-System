import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FeeViewPage(),
  ));
}

class FeeViewPage extends StatelessWidget {
  // Sample list of fees for students
  final List<StudentFee> studentFees = [
    StudentFee(
      studentName: 'John Doe',
      totalFee: 1000,
      paidAmount: 800,
      dueAmount: 200,
    ),
    StudentFee(
      studentName: 'Jane Smith',
      totalFee: 1200,
      paidAmount: 1100,
      dueAmount: 100,
    ),
    // Add more student fees here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Fees'),
      ),
      body: ListView.builder(
        itemCount: studentFees.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(studentFees[index].studentName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total Fee: \$${studentFees[index].totalFee}'),
                Text('Paid Amount: \$${studentFees[index].paidAmount}'),
                Text('Due Amount: \$${studentFees[index].dueAmount}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class StudentFee {
  final String studentName;
  final double totalFee;
  final double paidAmount;
  final double dueAmount;

  StudentFee({
    required this.studentName,
    required this.totalFee,
    required this.paidAmount,
    required this.dueAmount,
  });
}
