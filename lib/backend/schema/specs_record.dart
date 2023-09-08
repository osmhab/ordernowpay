import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpecsRecord extends FirestoreRecord {
  SpecsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "ItemRef" field.
  DocumentReference? _itemRef;
  DocumentReference? get itemRef => _itemRef;
  bool hasItemRef() => _itemRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _itemRef = snapshotData['ItemRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('specs')
          : FirebaseFirestore.instance.collectionGroup('specs');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('specs').doc();

  static Stream<SpecsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpecsRecord.fromSnapshot(s));

  static Future<SpecsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SpecsRecord.fromSnapshot(s));

  static SpecsRecord fromSnapshot(DocumentSnapshot snapshot) => SpecsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpecsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpecsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpecsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpecsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpecsRecordData({
  String? name,
  double? price,
  DocumentReference? itemRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'ItemRef': itemRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpecsRecordDocumentEquality implements Equality<SpecsRecord> {
  const SpecsRecordDocumentEquality();

  @override
  bool equals(SpecsRecord? e1, SpecsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.itemRef == e2?.itemRef;
  }

  @override
  int hash(SpecsRecord? e) =>
      const ListEquality().hash([e?.name, e?.price, e?.itemRef]);

  @override
  bool isValidKey(Object? o) => o is SpecsRecord;
}
