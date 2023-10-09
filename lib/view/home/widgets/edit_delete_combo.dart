import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_getx/model/student/student_model.dart';
import 'package:student_management_getx/view/add_student/screen_add_student.dart';

class EditDeleteCombo extends StatelessWidget {
  const EditDeleteCombo({super.key, required this.student});
  final Student student;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Get.to(
                  ScreenAddStudent(
                      operation: StudentOperation.Edit, student: student),
                  transition: Transition.circularReveal);
            },
            icon: Icon(
              CupertinoIcons.pencil,
              color: Colors.grey[900],
            )),
        IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'Delete Student',
                middleText: 'Are you sure to delete the student?',
                onConfirm: () {
                  studentController.deleteStudent(student.id);
                  Get.back();
                },
                onCancel: () {},
              );
            },
            icon: Icon(
              CupertinoIcons.delete_solid,
              color: Colors.grey[900],
            ))
      ],
    );
  }
}
