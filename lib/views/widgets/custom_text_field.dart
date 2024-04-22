import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged});
  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required ';
        } else {
          return null;
        }
      },
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
