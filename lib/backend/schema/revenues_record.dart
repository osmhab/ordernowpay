import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RevenuesRecord extends FirestoreRecord {
  RevenuesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "Amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['Amount']);
    _date = snapshotData['Date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Revenues');

  static Stream<RevenuesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RevenuesRecord.fromSnapshot(s));

  static Future<RevenuesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RevenuesRecord.fromSnapshot(s));

  static RevenuesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RevenuesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RevenuesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RevenuesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RevenuesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RevenuesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRevenuesRecordData({
  DocumentReference? userRef,
  double? amount,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'Amount': amount,
      'Date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class RevenuesRecordDocumentEquality implements Equality<RevenuesRecord> {
  const RevenuesRecordDocumentEquality();

  @override
  bool equals(RevenuesRecord? e1, RevenuesRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.amount == e2?.amount &&
        e1?.date == e2?.date;
  }

  @override
  int hash(RevenuesRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.amount, e?.date]);

  @override
  bool isValidKey(Object? o) => o is RevenuesRecord;
}
