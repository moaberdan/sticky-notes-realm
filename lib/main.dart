import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:sticky_notes_realm/use-cases/update_sticky_note_use_case.dart';
import 'models/sticky_note_model.dart';

import 'sticky_note.dart';
import 'use-cases/list_sticky_note_use_case.dart';

void main() async {
  final app = App(AppConfiguration("colocar-chave-device-sync"));
  final user = await app.logIn(Credentials.anonymous());
  final realm =
      Realm(Configuration.flexibleSync(user, [StickyNoteModel.schema]));
  realm.subscriptions.update((mutableSubscriptions) {
    mutableSubscriptions.add(realm.all<StickyNoteModel>());
  });
  final allItems = realm.all<StickyNoteModel>();

  runApp(MyApp(allItems));
}

class MyApp extends StatelessWidget {
  final RealmResults<StickyNoteModel> stickyNotes;
  const MyApp(this.stickyNotes, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sticky Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListStickyNote(ListStickyNoteUseCase(stickyNotes),
          title: 'Sticky Notes'),
    );
  }
}

class ListStickyNote extends StatefulWidget {
  final ListStickyNoteUseCase listStickyNoteUseCase;
  const ListStickyNote(this.listStickyNoteUseCase,
      {super.key, required this.title});

  final String title;

  @override
  State<ListStickyNote> createState() => _ListStickyNoteState();
}

class _ListStickyNoteState extends State<ListStickyNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: StreamBuilder(
            stream: widget.listStickyNoteUseCase.listStickyNote.changes,
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: widget.listStickyNoteUseCase.listStickyNote.length,
                itemBuilder: (context, index) {
                  final stickyNote =
                      widget.listStickyNoteUseCase.listStickyNote[index];
                  return StickyNote(UpdateStickyNoteUseCase(stickyNote));
                },
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: widget.listStickyNoteUseCase.addNewStickyNote,
          child: const Icon(Icons.add),
        ));
  }
}
