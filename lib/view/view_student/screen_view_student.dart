import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_getx/model/student/student_model.dart';
import 'package:student_management_getx/view/add_student/screen_add_student.dart';
import 'package:student_management_getx/view/view_student/widgets/student_details.dart';

class ScreenViewStudent extends StatelessWidget {
  const ScreenViewStudent({super.key, required this.student});
  final Student student;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(ScreenAddStudent(
                    operation: StudentOperation.Edit, student: student));
              },
              icon: const Icon(CupertinoIcons.pen)),
        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: .5),
          ),
          child: StudentDetailsWidget(student: student),
        ),
      ),
    );
  }
}
