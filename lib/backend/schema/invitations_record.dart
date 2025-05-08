import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvitationsRecord extends FirestoreRecord {
  InvitationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "invitationId" field.
  String? _invitationId;
  String get invitationId => _invitationId ?? '';
  bool hasInvitationId() => _invitationId != null;

  // "inviterId" field.
  DocumentReference? _inviterId;
  DocumentReference? get inviterId => _inviterId;
  bool hasInviterId() => _inviterId != null;

  // "invitedEmail" field.
  String? _invitedEmail;
  String get invitedEmail => _invitedEmail ?? '';
  bool hasInvitedEmail() => _invitedEmail != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "inviterID" field.
  String? _inviterID;
  String get inviterID => _inviterID ?? '';
  bool hasInviterID() => _inviterID != null;

  // "invitationToken" field.
  String? _invitationToken;
  String get invitationToken => _invitationToken ?? '';
  bool hasInvitationToken() => _invitationToken != null;

  // "bankName" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  // "RestaurantName" field.
  DocumentReference? _restaurantName;
  DocumentReference? get restaurantName => _restaurantName;
  bool hasRestaurantName() => _restaurantName != null;

  void _initializeFields() {
    _invitationId = snapshotData['invitationId'] as String?;
    _inviterId = snapshotData['inviterId'] as DocumentReference?;
    _invitedEmail = snapshotData['invitedEmail'] as String?;
    _role = snapshotData['role'] as String?;
    _status = snapshotData['status'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _inviterID = snapshotData['inviterID'] as String?;
    _invitationToken = snapshotData['invitationToken'] as String?;
    _bankName = snapshotData['bankName'] as String?;
    _restaurantName = snapshotData['RestaurantName'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Invitations');

  static Stream<InvitationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvitationsRecord.fromSnapshot(s));

  static Future<InvitationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvitationsRecord.fromSnapshot(s));

  static InvitationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvitationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvitationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvitationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvitationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvitationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvitationsRecordData({
  String? invitationId,
  DocumentReference? inviterId,
  String? invitedEmail,
  String? role,
  String? status,
  DocumentReference? userRef,
  String? inviterID,
  String? invitationToken,
  String? bankName,
  DocumentReference? restaurantName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'invitationId': invitationId,
      'inviterId': inviterId,
      'invitedEmail': invitedEmail,
      'role': role,
      'status': status,
      'userRef': userRef,
      'inviterID': inviterID,
      'invitationToken': invitationToken,
      'bankName': bankName,
      'RestaurantName': restaurantName,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvitationsRecordDocumentEquality implements Equality<InvitationsRecord> {
  const InvitationsRecordDocumentEquality();

  @override
  bool equals(InvitationsRecord? e1, InvitationsRecord? e2) {
    return e1?.invitationId == e2?.invitationId &&
        e1?.inviterId == e2?.inviterId &&
        e1?.invitedEmail == e2?.invitedEmail &&
        e1?.role == e2?.role &&
        e1?.status == e2?.status &&
        e1?.userRef == e2?.userRef &&
        e1?.inviterID == e2?.inviterID &&
        e1?.invitationToken == e2?.invitationToken &&
        e1?.bankName == e2?.bankName &&
        e1?.restaurantName == e2?.restaurantName;
  }

  @override
  int hash(InvitationsRecord? e) => const ListEquality().hash([
        e?.invitationId,
        e?.inviterId,
        e?.invitedEmail,
        e?.role,
        e?.status,
        e?.userRef,
        e?.inviterID,
        e?.invitationToken,
        e?.bankName,
        e?.restaurantName
      ]);

  @override
  bool isValidKey(Object? o) => o is InvitationsRecord;
}
