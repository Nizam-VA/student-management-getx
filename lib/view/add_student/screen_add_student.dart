import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_getx/controller/getx/student_controller.dart';
import 'package:student_management_getx/core/constants.dart';
import 'package:student_management_getx/model/student/student_model.dart';
import 'package:student_management_getx/view/add_student/functions/bottom_sheet.dart';
import 'package:student_management_getx/view/add_student/widgets/save_button.dart';
import 'package:student_management_getx/view/add_student/widgets/text_field.dart';

enum StudentOperation { Add, Edit }

final studentController = Get.put(StudentController());

class ScreenAddStudent extends StatelessWidget {
  ScreenAddStudent({super.key, this.student, required this.operation});
  final nameController = TextEditingController();
  final placeController = TextEditingController();
  final ageController = TextEditingController();
  final mobileController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Student? student;
  StudentOperation operation;
  XFile? imagePath;

  initTextControllers() {
    if (student != null) {
      nameController.text = student!.name;
      placeController.text = student!.place;
      ageController.text = student!.age;
      mobileController.text = student!.mobile;
      studentController.imagePath.value = student!.image;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (operation == StudentOperation.Edit) {
      initTextControllers();
    } else {
      studentController.imagePath.value =
          imagePath != null ? imagePath!.path : '';
    }
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              operation == StudentOperation.Add
                  ? 'Add Student'
                  : 'Edit Student',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Column(
                  children: [
                    InkWell(
                        onTap: () async {
                          imagePath = await showBottomSheetWidget();
                          if (imagePath != null) {
                            studentController.setImage(imagePath!.path);
                            Get.back();
                          }
                        },
                        child: Obx(() => Container(
                              height: height * .15,
                              width: width * .35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(width: .5),
                                  image: studentController
                                          .imagePath.value.isNotEmpty
                                      ? DecorationImage(
                                          image: FileImage(File(
                                              studentController
                                                  .imagePath.value)),
                                          fit: BoxFit.cover)
                                      : null),
                              child: studentController.imagePath.value.isEmpty
                                  ? const Center(
                                      child: Icon(
                                          CupertinoIcons.photo_on_rectangle),
                                    )
                                  : null,
                            ))),
                    kHight10,
                    TextFieldWidget(
                      nameController: nameController,
                      text: 'Name',
                      type: TextInputType.name,
                    ),
                    kHight10,
                    TextFieldWidget(
                      nameController: placeController,
                      text: 'Place',
                      type: TextInputType.name,
                    ),
                    kHight10,
                    TextFieldWidget(
                      nameController: ageController,
                      text: 'Age',
                      type: TextInputType.number,
                    ),
                    kHight10,
                    TextFieldWidget(
                      nameController: mobileController,
                      text: 'Mobile No',
                      type: TextInputType.phone,
                    ),
                    kHight20,
                    SaveButton(
                      width: width,
                      formKey: formKey,
                      nameController: nameController,
                      placeController: placeController,
                      ageController: ageController,
                      mobileController: mobileController,
                      student: student,
                      studentController: studentController,
                      operation: operation,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
