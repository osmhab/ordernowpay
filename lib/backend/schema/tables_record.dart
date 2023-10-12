import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TablesRecord extends FirestoreRecord {
  TablesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "tableName" field.
  String? _tableName;
  String get tableName => _tableName ?? '';
  bool hasTableName() => _tableName != null;

  // "tableQrUrl" field.
  String? _tableQrUrl;
  String get tableQrUrl => _tableQrUrl ?? '';
  bool hasTableQrUrl() => _tableQrUrl != null;

  // "tableInUse" field.
  bool? _tableInUse;
  bool get tableInUse => _tableInUse ?? false;
  bool hasTableInUse() => _tableInUse != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "tableQrImage" field.
  String? _tableQrImage;
  String get tableQrImage => _tableQrImage ?? '';
  bool hasTableQrImage() => _tableQrImage != null;

  // "tableId" field.
  String? _tableId;
  String get tableId => _tableId ?? '';
  bool hasTableId() => _tableId != null;

  // "tableID" field.
  String? _tableID;
  String get tableID => _tableID ?? '';
  bool hasTableID() => _tableID != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "tablesToPrint" field.
  bool? _tablesToPrint;
  bool get tablesToPrint => _tablesToPrint ?? false;
  bool hasTablesToPrint() => _tablesToPrint != null;

  // "printed" field.
  bool? _printed;
  bool get printed => _printed ?? false;
  bool hasPrinted() => _printed != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _tableName = snapshotData['tableName'] as String?;
    _tableQrUrl = snapshotData['tableQrUrl'] as String?;
    _tableInUse = snapshotData['tableInUse'] as bool?;
    _description = snapshotData['description'] as String?;
    _tableQrImage = snapshotData['tableQrImage'] as String?;
    _tableId = snapshotData['tableId'] as String?;
    _tableID = snapshotData['tableID'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _tablesToPrint = snapshotData['tablesToPrint'] as bool?;
    _printed = snapshotData['printed'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tables');

  static Stream<TablesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TablesRecord.fromSnapshot(s));

  static Future<TablesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TablesRecord.fromSnapshot(s));

  static TablesRecord fromSnapshot(DocumentSnapshot snapshot) => TablesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TablesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TablesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TablesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TablesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTablesRecordData({
  DocumentReference? userRef,
  String? tableName,
  String? tableQrUrl,
  bool? tableInUse,
  String? description,
  String? tableQrImage,
  String? tableId,
  String? tableID,
  DateTime? createdAt,
  bool? tablesToPrint,
  bool? printed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'tableName': tableName,
      'tableQrUrl': tableQrUrl,
      'tableInUse': tableInUse,
      'description': description,
      'tableQrImage': tableQrImage,
      'tableId': tableId,
      'tableID': tableID,
      'createdAt': createdAt,
      'tablesToPrint': tablesToPrint,
      'printed': printed,
    }.withoutNulls,
  );

  return firestoreData;
}

class TablesRecordDocumentEquality implements Equality<TablesRecord> {
  const TablesRecordDocumentEquality();

  @override
  bool equals(TablesRecord? e1, TablesRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.tableName == e2?.tableName &&
        e1?.tableQrUrl == e2?.tableQrUrl &&
        e1?.tableInUse == e2?.tableInUse &&
        e1?.description == e2?.description &&
        e1?.tableQrImage == e2?.tableQrImage &&
        e1?.tableId == e2?.tableId &&
        e1?.tableID == e2?.tableID &&
        e1?.createdAt == e2?.createdAt &&
        e1?.tablesToPrint == e2?.tablesToPrint &&
        e1?.printed == e2?.printed;
  }

  @override
  int hash(TablesRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.tableName,
        e?.tableQrUrl,
        e?.tableInUse,
        e?.description,
        e?.tableQrImage,
        e?.tableId,
        e?.tableID,
        e?.createdAt,
        e?.tablesToPrint,
        e?.printed
      ]);

  @override
  bool isValidKey(Object? o) => o is TablesRecord;
}
