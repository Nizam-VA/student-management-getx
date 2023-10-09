import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.nameController,
      required this.text,
      required this.type});

  final TextEditingController nameController;
  final String text;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      controller: nameController,
      keyboardType: type,
      decoration: InputDecoration(
          label: Text('$text '),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1),
          )),
    );
  }
}
