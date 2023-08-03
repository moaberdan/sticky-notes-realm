import 'package:realm/realm.dart';

part 'sticky_note_model.g.dart';

@RealmModel()
class _StickyNoteModel {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;
  late String title;
  late String description;
  bool editable = false;
}
