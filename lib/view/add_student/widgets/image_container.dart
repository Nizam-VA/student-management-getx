import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:student_management_getx/view/add_student/screen_add_student.dart';

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .15,
      width: width * .35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: .5),
          image: studentController.imagePath.value.isNotEmpty
              ? DecorationImage(
                  image: FileImage(File(studentController.imagePath.value)),
                  fit: BoxFit.cover)
              : null),
      child: studentController.imagePath.value.isEmpty
          ? const Center(
              child: Icon(CupertinoIcons.photo_on_rectangle),
            )
          : null,
    );
  }
}
