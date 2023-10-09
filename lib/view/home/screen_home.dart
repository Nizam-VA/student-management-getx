import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_getx/controller/getx/student_controller.dart';
import 'package:student_management_getx/core/constants.dart';
import 'package:student_management_getx/view/add_student/screen_add_student.dart';
import 'package:student_management_getx/view/home/widgets/edit_delete_combo.dart';
import 'package:student_management_getx/view/view_student/screen_view_student.dart';

final studentController = Get.put(StudentController());

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    studentController.getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Manager',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CupertinoSearchTextField(
                padding: const EdgeInsets.all(8),
                backgroundColor: Colors.grey,
                prefixIcon:
                    const Icon(CupertinoIcons.search, color: Colors.white),
                suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,
                    color: Colors.white),
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  studentController.searchResult(value);
                },
              ),
              kHight20,
              Expanded(
                child: GetX<StudentController>(
                    init: StudentController(),
                    builder: ((controller) {
                      return studentController.students.isNotEmpty
                          ? ListView.separated(
                              itemBuilder: (_, index) {
                                final student =
                                    studentController.students[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        FileImage(File(student.image)),
                                  ),
                                  title: Text(student.name),
                                  subtitle: Text(student.place),
                                  trailing: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .25,
                                    child: EditDeleteCombo(student: student),
                                  ),
                                  onTap: () => {
                                    Get.to(ScreenViewStudent(student: student),
                                        transition: Transition.downToUp)
                                  },
                                );
                              },
                              separatorBuilder: (_, index) {
                                return const Divider(height: .5, thickness: 1);
                              },
                              itemCount: studentController.students.length,
                            )
                          : const Center(
                              child: Text('No data found'),
                            );
                    })),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(
              ScreenAddStudent(operation: StudentOperation.Add),
              transition: Transition.fade,
            );
          },
          child: const Icon(CupertinoIcons.add_circled)),
    );
  }
}
