import 'package:realm/realm.dart';

import '../models/sticky_note_model.dart';

class UpdateStickyNoteUseCase {
  final StickyNoteModel stickyNoteModel;
  late final Realm _realm;

  UpdateStickyNoteUseCase(this.stickyNoteModel) {
    _realm = stickyNoteModel.realm;
    title = stickyNoteModel.title;
    description = stickyNoteModel.description;
  }

  String title = "";
  String description = "";

  void update() {
    if (stickyNoteModel.editable) {
      _realm.write(() {
        stickyNoteModel.editable = false;
        stickyNoteModel.title = title;
        stickyNoteModel.description = description;
      });
    } else {
      _realm.write(() => stickyNoteModel.editable = true);
    }
  }

  void delete() {
    _realm.write(() => _realm.delete(stickyNoteModel));
  }
}
