import 'package:realm/realm.dart';
import '../models/sticky_note_model.dart';

class ListStickyNoteUseCase {
  final RealmResults<StickyNoteModel> listStickyNote;
  final Realm _realm;
  ListStickyNoteUseCase(this.listStickyNote) : _realm = listStickyNote.realm;

  void addNewStickyNote() {
    _realm.write(() => _realm.add(StickyNoteModel(ObjectId(), "", "")));
  }
}
