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
        child: AddNoteFrom(),
      ),
    );
  }
}

class AddNoteFrom extends StatefulWidget {
  const AddNoteFrom({
    super.key,
  });

  @override
  State<AddNoteFrom> createState() => _AddNoteFromState();
}

class _AddNoteFromState extends State<AddNoteFrom> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: 'title',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hintText: 'content',
            maxLines: 6,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
            onTap: () {
              // هنا هعمل validate  للداتا اللى هيكتبها اليوزر بمجرد ماضغط على الزارار
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
