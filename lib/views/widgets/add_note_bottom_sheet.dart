import 'package:flutter/material.dart';

import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            CustomTextField(
              hintText: 'title',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: 'content',
              maxLines: 6,
            ),
            SizedBox(
              height: 50,
            ),
            CustomButton(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
