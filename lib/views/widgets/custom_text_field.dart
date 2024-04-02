import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.maxLines = 1});
  final String hintText;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      cursorColor: kPrimarycolor,
      decoration: InputDecoration(
        border: buildTextFieldBorder(),
        hintText: hintText,
        enabledBorder: buildTextFieldBorder(),
        focusedBorder: buildTextFieldBorder(kPrimarycolor),
      ),
    );
  }

  OutlineInputBorder buildTextFieldBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
