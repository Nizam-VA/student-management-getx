import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSuccessMessage(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    colorText: Colors.green[900],
  );
}
