// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticky_note_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class StickyNoteModel extends _StickyNoteModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  StickyNoteModel(
    ObjectId id,
    String title,
    String description, {
    bool editable = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<StickyNoteModel>({
        'editable': false,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'editable', editable);
  }

  StickyNoteModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  bool get editable => RealmObjectBase.get<bool>(this, 'editable') as bool;
  @override
  set editable(bool value) => RealmObjectBase.set(this, 'editable', value);

  @override
  Stream<RealmObjectChanges<StickyNoteModel>> get changes =>
      RealmObjectBase.getChanges<StickyNoteModel>(this);

  @override
  StickyNoteModel freeze() =>
      RealmObjectBase.freezeObject<StickyNoteModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(StickyNoteModel._);
    return const SchemaObject(
        ObjectType.realmObject, StickyNoteModel, 'StickyNoteModel', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('editable', RealmPropertyType.bool),
    ]);
  }
}
