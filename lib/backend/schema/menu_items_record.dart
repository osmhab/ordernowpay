import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuItemsRecord extends FirestoreRecord {
  MenuItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "specification" field.
  String? _specification;
  String get specification => _specification ?? '';
  bool hasSpecification() => _specification != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "modifiers" field.
  List<String>? _modifiers;
  List<String> get modifiers => _modifiers ?? const [];
  bool hasModifiers() => _modifiers != null;

  // "modifiers_2" field.
  List<String>? _modifiers2;
  List<String> get modifiers2 => _modifiers2 ?? const [];
  bool hasModifiers2() => _modifiers2 != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _specification = snapshotData['specification'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _modifiers = getDataList(snapshotData['modifiers']);
    _modifiers2 = getDataList(snapshotData['modifiers_2']);
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _tags = getDataList(snapshotData['tags']);
    _isActive = snapshotData['isActive'] as bool?;
    _photoUrl = snapshotData['photoUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MenuItems');

  static Stream<MenuItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenuItemsRecord.fromSnapshot(s));

  static Future<MenuItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MenuItemsRecord.fromSnapshot(s));

  static MenuItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MenuItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenuItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenuItemsRecord._(reference, mapFromFirestore(data));

  static MenuItemsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      MenuItemsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'description': snapshot.data['description'],
          'price': convertAlgoliaParam(
            snapshot.data['price'],
            ParamType.double,
            false,
          ),
          'specification': snapshot.data['specification'],
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'modified_at': convertAlgoliaParam(
            snapshot.data['modified_at'],
            ParamType.DateTime,
            false,
          ),
          'quantity': convertAlgoliaParam(
            snapshot.data['quantity'],
            ParamType.int,
            false,
          ),
          'modifiers': safeGet(
            () => snapshot.data['modifiers'].toList(),
          ),
          'modifiers_2': safeGet(
            () => snapshot.data['modifiers_2'].toList(),
          ),
          'userRef': convertAlgoliaParam(
            snapshot.data['userRef'],
            ParamType.DocumentReference,
            false,
          ),
          'tags': safeGet(
            () => snapshot.data['tags'].toList(),
          ),
          'isActive': snapshot.data['isActive'],
          'photoUrl': snapshot.data['photoUrl'],
        },
        MenuItemsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<MenuItemsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'MenuItems',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'MenuItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenuItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenuItemsRecordData({
  String? name,
  String? description,
  double? price,
  String? specification,
  DateTime? createdAt,
  DateTime? modifiedAt,
  int? quantity,
  DocumentReference? userRef,
  bool? isActive,
  String? photoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'specification': specification,
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'quantity': quantity,
      'userRef': userRef,
      'isActive': isActive,
      'photoUrl': photoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenuItemsRecordDocumentEquality implements Equality<MenuItemsRecord> {
  const MenuItemsRecordDocumentEquality();

  @override
  bool equals(MenuItemsRecord? e1, MenuItemsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.specification == e2?.specification &&
        e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.quantity == e2?.quantity &&
        listEquality.equals(e1?.modifiers, e2?.modifiers) &&
        listEquality.equals(e1?.modifiers2, e2?.modifiers2) &&
        e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.isActive == e2?.isActive &&
        e1?.photoUrl == e2?.photoUrl;
  }

  @override
  int hash(MenuItemsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.price,
        e?.specification,
        e?.createdAt,
        e?.modifiedAt,
        e?.quantity,
        e?.modifiers,
        e?.modifiers2,
        e?.userRef,
        e?.tags,
        e?.isActive,
        e?.photoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is MenuItemsRecord;
}
