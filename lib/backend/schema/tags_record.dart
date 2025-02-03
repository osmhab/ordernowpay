import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TagsRecord extends FirestoreRecord {
  TagsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "itemRefs" field.
  List<DocumentReference>? _itemRefs;
  List<DocumentReference> get itemRefs => _itemRefs ?? const [];
  bool hasItemRefs() => _itemRefs != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _itemRefs = getDataList(snapshotData['itemRefs']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tags');

  static Stream<TagsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TagsRecord.fromSnapshot(s));

  static Future<TagsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TagsRecord.fromSnapshot(s));

  static TagsRecord fromSnapshot(DocumentSnapshot snapshot) => TagsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TagsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TagsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TagsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TagsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTagsRecordData({
  DocumentReference? userRef,
  String? name,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'name': name,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class TagsRecordDocumentEquality implements Equality<TagsRecord> {
  const TagsRecordDocumentEquality();

  @override
  bool equals(TagsRecord? e1, TagsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.name == e2?.name &&
        listEquality.equals(e1?.itemRefs, e2?.itemRefs) &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(TagsRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.name, e?.itemRefs, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is TagsRecord;
}
