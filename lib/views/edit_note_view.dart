import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteView extends StatefulWidget {
  EditNoteView({super.key, required this.note});
  NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
              onPressed: () {
                editNoteMethod(context);
              },
              title: 'Edit Note ',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              hintText: widget.note.title,
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              onChanged: (value) {
                subTitle = value;
              },
              hintText: widget.note.subTitle,
              maxLines: 6,
            )
          ],
        ),
      ),
    );
  }

  void editNoteMethod(BuildContext context) {
      widget.note.title = title ?? widget.note.title;
    widget.note.subTitle = subTitle ?? widget.note.subTitle;
    widget.note.save();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    
    Navigator.pop(context);
  }
}
