import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "storeName" field.
  String? _storeName;
  String get storeName => _storeName ?? '';
  bool hasStoreName() => _storeName != null;

  // "storeAdress" field.
  String? _storeAdress;
  String get storeAdress => _storeAdress ?? '';
  bool hasStoreAdress() => _storeAdress != null;

  // "storeLocality" field.
  String? _storeLocality;
  String get storeLocality => _storeLocality ?? '';
  bool hasStoreLocality() => _storeLocality != null;

  // "bankIBAN" field.
  String? _bankIBAN;
  String get bankIBAN => _bankIBAN ?? '';
  bool hasBankIBAN() => _bankIBAN != null;

  // "invitedBy" field.
  String? _invitedBy;
  String get invitedBy => _invitedBy ?? '';
  bool hasInvitedBy() => _invitedBy != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "invitation" field.
  String? _invitation;
  String get invitation => _invitation ?? '';
  bool hasInvitation() => _invitation != null;

  // "beneficiaireName" field.
  String? _beneficiaireName;
  String get beneficiaireName => _beneficiaireName ?? '';
  bool hasBeneficiaireName() => _beneficiaireName != null;

  // "beneficiaireAdresse" field.
  String? _beneficiaireAdresse;
  String get beneficiaireAdresse => _beneficiaireAdresse ?? '';
  bool hasBeneficiaireAdresse() => _beneficiaireAdresse != null;

  // "StoreEmail" field.
  String? _storeEmail;
  String get storeEmail => _storeEmail ?? '';
  bool hasStoreEmail() => _storeEmail != null;

  // "StoreBankBenefName" field.
  String? _storeBankBenefName;
  String get storeBankBenefName => _storeBankBenefName ?? '';
  bool hasStoreBankBenefName() => _storeBankBenefName != null;

  // "StoreBankBenefIBAN" field.
  String? _storeBankBenefIBAN;
  String get storeBankBenefIBAN => _storeBankBenefIBAN ?? '';
  bool hasStoreBankBenefIBAN() => _storeBankBenefIBAN != null;

  // "StoreBankBenefAdress" field.
  String? _storeBankBenefAdress;
  String get storeBankBenefAdress => _storeBankBenefAdress ?? '';
  bool hasStoreBankBenefAdress() => _storeBankBenefAdress != null;

  // "SubscriptionStart" field.
  DateTime? _subscriptionStart;
  DateTime? get subscriptionStart => _subscriptionStart;
  bool hasSubscriptionStart() => _subscriptionStart != null;

  // "SubscriptionEnd" field.
  DateTime? _subscriptionEnd;
  DateTime? get subscriptionEnd => _subscriptionEnd;
  bool hasSubscriptionEnd() => _subscriptionEnd != null;

  // "stripeAccountID" field.
  String? _stripeAccountID;
  String get stripeAccountID => _stripeAccountID ?? '';
  bool hasStripeAccountID() => _stripeAccountID != null;

  // "stripeChargesEnabled" field.
  bool? _stripeChargesEnabled;
  bool get stripeChargesEnabled => _stripeChargesEnabled ?? false;
  bool hasStripeChargesEnabled() => _stripeChargesEnabled != null;

  // "SubscriptionActive" field.
  bool? _subscriptionActive;
  bool get subscriptionActive => _subscriptionActive ?? false;
  bool hasSubscriptionActive() => _subscriptionActive != null;

  // "SubscriptionFinished" field.
  bool? _subscriptionFinished;
  bool get subscriptionFinished => _subscriptionFinished ?? false;
  bool hasSubscriptionFinished() => _subscriptionFinished != null;

  // "PackageSent" field.
  bool? _packageSent;
  bool get packageSent => _packageSent ?? false;
  bool hasPackageSent() => _packageSent != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _name = snapshotData['name'] as String?;
    _role = snapshotData['role'] as String?;
    _storeName = snapshotData['storeName'] as String?;
    _storeAdress = snapshotData['storeAdress'] as String?;
    _storeLocality = snapshotData['storeLocality'] as String?;
    _bankIBAN = snapshotData['bankIBAN'] as String?;
    _invitedBy = snapshotData['invitedBy'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _invitation = snapshotData['invitation'] as String?;
    _beneficiaireName = snapshotData['beneficiaireName'] as String?;
    _beneficiaireAdresse = snapshotData['beneficiaireAdresse'] as String?;
    _storeEmail = snapshotData['StoreEmail'] as String?;
    _storeBankBenefName = snapshotData['StoreBankBenefName'] as String?;
    _storeBankBenefIBAN = snapshotData['StoreBankBenefIBAN'] as String?;
    _storeBankBenefAdress = snapshotData['StoreBankBenefAdress'] as String?;
    _subscriptionStart = snapshotData['SubscriptionStart'] as DateTime?;
    _subscriptionEnd = snapshotData['SubscriptionEnd'] as DateTime?;
    _stripeAccountID = snapshotData['stripeAccountID'] as String?;
    _stripeChargesEnabled = snapshotData['stripeChargesEnabled'] as bool?;
    _subscriptionActive = snapshotData['SubscriptionActive'] as bool?;
    _subscriptionFinished = snapshotData['SubscriptionFinished'] as bool?;
    _packageSent = snapshotData['PackageSent'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? name,
  String? role,
  String? storeName,
  String? storeAdress,
  String? storeLocality,
  String? bankIBAN,
  String? invitedBy,
  DocumentReference? userRef,
  String? invitation,
  String? beneficiaireName,
  String? beneficiaireAdresse,
  String? storeEmail,
  String? storeBankBenefName,
  String? storeBankBenefIBAN,
  String? storeBankBenefAdress,
  DateTime? subscriptionStart,
  DateTime? subscriptionEnd,
  String? stripeAccountID,
  bool? stripeChargesEnabled,
  bool? subscriptionActive,
  bool? subscriptionFinished,
  bool? packageSent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'name': name,
      'role': role,
      'storeName': storeName,
      'storeAdress': storeAdress,
      'storeLocality': storeLocality,
      'bankIBAN': bankIBAN,
      'invitedBy': invitedBy,
      'userRef': userRef,
      'invitation': invitation,
      'beneficiaireName': beneficiaireName,
      'beneficiaireAdresse': beneficiaireAdresse,
      'StoreEmail': storeEmail,
      'StoreBankBenefName': storeBankBenefName,
      'StoreBankBenefIBAN': storeBankBenefIBAN,
      'StoreBankBenefAdress': storeBankBenefAdress,
      'SubscriptionStart': subscriptionStart,
      'SubscriptionEnd': subscriptionEnd,
      'stripeAccountID': stripeAccountID,
      'stripeChargesEnabled': stripeChargesEnabled,
      'SubscriptionActive': subscriptionActive,
      'SubscriptionFinished': subscriptionFinished,
      'PackageSent': packageSent,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.name == e2?.name &&
        e1?.role == e2?.role &&
        e1?.storeName == e2?.storeName &&
        e1?.storeAdress == e2?.storeAdress &&
        e1?.storeLocality == e2?.storeLocality &&
        e1?.bankIBAN == e2?.bankIBAN &&
        e1?.invitedBy == e2?.invitedBy &&
        e1?.userRef == e2?.userRef &&
        e1?.invitation == e2?.invitation &&
        e1?.beneficiaireName == e2?.beneficiaireName &&
        e1?.beneficiaireAdresse == e2?.beneficiaireAdresse &&
        e1?.storeEmail == e2?.storeEmail &&
        e1?.storeBankBenefName == e2?.storeBankBenefName &&
        e1?.storeBankBenefIBAN == e2?.storeBankBenefIBAN &&
        e1?.storeBankBenefAdress == e2?.storeBankBenefAdress &&
        e1?.subscriptionStart == e2?.subscriptionStart &&
        e1?.subscriptionEnd == e2?.subscriptionEnd &&
        e1?.stripeAccountID == e2?.stripeAccountID &&
        e1?.stripeChargesEnabled == e2?.stripeChargesEnabled &&
        e1?.subscriptionActive == e2?.subscriptionActive &&
        e1?.subscriptionFinished == e2?.subscriptionFinished &&
        e1?.packageSent == e2?.packageSent;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.name,
        e?.role,
        e?.storeName,
        e?.storeAdress,
        e?.storeLocality,
        e?.bankIBAN,
        e?.invitedBy,
        e?.userRef,
        e?.invitation,
        e?.beneficiaireName,
        e?.beneficiaireAdresse,
        e?.storeEmail,
        e?.storeBankBenefName,
        e?.storeBankBenefIBAN,
        e?.storeBankBenefAdress,
        e?.subscriptionStart,
        e?.subscriptionEnd,
        e?.stripeAccountID,
        e?.stripeChargesEnabled,
        e?.subscriptionActive,
        e?.subscriptionFinished,
        e?.packageSent
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
