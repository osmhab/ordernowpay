import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemDetailRecord extends FirestoreRecord {
  ItemDetailRecord._(
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

  // "specifications" field.
  String? _specifications;
  String get specifications => _specifications ?? '';
  bool hasSpecifications() => _specifications != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "cartRef" field.
  DocumentReference? _cartRef;
  DocumentReference? get cartRef => _cartRef;
  bool hasCartRef() => _cartRef != null;

  // "menuItemRef" field.
  DocumentReference? _menuItemRef;
  DocumentReference? get menuItemRef => _menuItemRef;
  bool hasMenuItemRef() => _menuItemRef != null;

  // "menuItemPhoto" field.
  String? _menuItemPhoto;
  String get menuItemPhoto => _menuItemPhoto ?? '';
  bool hasMenuItemPhoto() => _menuItemPhoto != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "modifiers" field.
  String? _modifiers;
  String get modifiers => _modifiers ?? '';
  bool hasModifiers() => _modifiers != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _specifications = snapshotData['specifications'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _cartRef = snapshotData['cartRef'] as DocumentReference?;
    _menuItemRef = snapshotData['menuItemRef'] as DocumentReference?;
    _menuItemPhoto = snapshotData['menuItemPhoto'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _modifiers = snapshotData['modifiers'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('itemDetail');

  static Stream<ItemDetailRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemDetailRecord.fromSnapshot(s));

  static Future<ItemDetailRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemDetailRecord.fromSnapshot(s));

  static ItemDetailRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ItemDetailRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemDetailRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemDetailRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemDetailRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemDetailRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemDetailRecordData({
  String? name,
  String? description,
  String? specifications,
  double? price,
  int? quantity,
  DocumentReference? cartRef,
  DocumentReference? menuItemRef,
  String? menuItemPhoto,
  DocumentReference? userRef,
  String? modifiers,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'specifications': specifications,
      'price': price,
      'quantity': quantity,
      'cartRef': cartRef,
      'menuItemRef': menuItemRef,
      'menuItemPhoto': menuItemPhoto,
      'userRef': userRef,
      'modifiers': modifiers,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemDetailRecordDocumentEquality implements Equality<ItemDetailRecord> {
  const ItemDetailRecordDocumentEquality();

  @override
  bool equals(ItemDetailRecord? e1, ItemDetailRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.specifications == e2?.specifications &&
        e1?.price == e2?.price &&
        e1?.quantity == e2?.quantity &&
        e1?.cartRef == e2?.cartRef &&
        e1?.menuItemRef == e2?.menuItemRef &&
        e1?.menuItemPhoto == e2?.menuItemPhoto &&
        e1?.userRef == e2?.userRef &&
        e1?.modifiers == e2?.modifiers;
  }

  @override
  int hash(ItemDetailRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.specifications,
        e?.price,
        e?.quantity,
        e?.cartRef,
        e?.menuItemRef,
        e?.menuItemPhoto,
        e?.userRef,
        e?.modifiers
      ]);

  @override
  bool isValidKey(Object? o) => o is ItemDetailRecord;
}
