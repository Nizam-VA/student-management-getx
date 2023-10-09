import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_management_getx/core/constants.dart';
import 'package:student_management_getx/model/student/student_model.dart';

class StudentDetailsWidget extends StatelessWidget {
  const StudentDetailsWidget({
    super.key,
    required this.student,
  });

  final Student student;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHight50,
        kHight50,
        CircleAvatar(
          radius: 50,
          backgroundImage: FileImage(File(student.image)),
        ),
        kHight20,
        Text(
          'Name: ${student.name}',
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kHight10,
        Text(
          'Place: ${student.place}',
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        kHight10,
        Text(
          'Age: ${student.age}',
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        kHight10,
        Text(
          'Mobile: ${student.mobile}',
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
