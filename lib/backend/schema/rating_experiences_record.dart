import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingExperiencesRecord extends FirestoreRecord {
  RatingExperiencesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "startsNumber" field.
  int? _startsNumber;
  int get startsNumber => _startsNumber ?? 0;
  bool hasStartsNumber() => _startsNumber != null;

  // "improveText" field.
  String? _improveText;
  String get improveText => _improveText ?? '';
  bool hasImproveText() => _improveText != null;

  void _initializeFields() {
    _startsNumber = castToType<int>(snapshotData['startsNumber']);
    _improveText = snapshotData['improveText'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ratingExperiences');

  static Stream<RatingExperiencesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RatingExperiencesRecord.fromSnapshot(s));

  static Future<RatingExperiencesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RatingExperiencesRecord.fromSnapshot(s));

  static RatingExperiencesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RatingExperiencesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RatingExperiencesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RatingExperiencesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RatingExperiencesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RatingExperiencesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRatingExperiencesRecordData({
  int? startsNumber,
  String? improveText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'startsNumber': startsNumber,
      'improveText': improveText,
    }.withoutNulls,
  );

  return firestoreData;
}

class RatingExperiencesRecordDocumentEquality
    implements Equality<RatingExperiencesRecord> {
  const RatingExperiencesRecordDocumentEquality();

  @override
  bool equals(RatingExperiencesRecord? e1, RatingExperiencesRecord? e2) {
    return e1?.startsNumber == e2?.startsNumber &&
        e1?.improveText == e2?.improveText;
  }

  @override
  int hash(RatingExperiencesRecord? e) =>
      const ListEquality().hash([e?.startsNumber, e?.improveText]);

  @override
  bool isValidKey(Object? o) => o is RatingExperiencesRecord;
}
