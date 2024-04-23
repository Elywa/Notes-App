import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_List.dart';
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
        child: SingleChildScrollView(
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
              ),
              const SizedBox(
                height: 25,
              ),
              EditNoteColorsList(
                note: widget.note,
              ),
            ],
          ),
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

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  @override
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColorsList.indexOf(Color(widget.note.color));
    super.initState();
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: 40 * 2,
      child: ListView.builder(
          itemCount: kColorsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 5, left: 5),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  widget.note.color = kColorsList[index].value;
                  setState(() {});
                },
                child: ColorItem(
                  color: kColorsList[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
