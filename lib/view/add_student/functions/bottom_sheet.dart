import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_getx/view/add_student/functions/from_camera.dart';
import 'package:student_management_getx/view/add_student/functions/from_gallery.dart';

Future<XFile> showBottomSheetWidget() async {
  final completer = Completer<XFile>();

  final bottomSheetWidget = Container(
    height: 200,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), border: Border.all(width: .4)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          'Select the image source:',
          style: TextStyle(fontSize: 20, color: Colors.grey[900]),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
              onPressed: () async {
                XFile imagePath = await fromCamera();
                completer.complete(imagePath);
              },
              icon: const Icon(
                Icons.camera,
              ),
              label: const Text('Camera'),
            ),
            TextButton.icon(
              onPressed: () async {
                XFile imagePath = await fromGallery();
                completer.complete(imagePath);
              },
              icon: const Icon(
                Icons.image,
              ),
              label: const Text('Gallery'),
            ),
          ],
        )
      ],
    ),
  );
  Get.bottomSheet(bottomSheetWidget, backgroundColor: Colors.white);
  return completer.future;
}
