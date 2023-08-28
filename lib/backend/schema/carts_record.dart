import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartsRecord extends FirestoreRecord {
  CartsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "itemCount" field.
  int? _itemCount;
  int get itemCount => _itemCount ?? 0;
  bool hasItemCount() => _itemCount != null;

  // "cartActive" field.
  bool? _cartActive;
  bool get cartActive => _cartActive ?? false;
  bool hasCartActive() => _cartActive != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  bool hasDiscount() => _discount != null;

  // "extraCharge" field.
  double? _extraCharge;
  double get extraCharge => _extraCharge ?? 0.0;
  bool hasExtraCharge() => _extraCharge != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "orderNumber" field.
  int? _orderNumber;
  int get orderNumber => _orderNumber ?? 0;
  bool hasOrderNumber() => _orderNumber != null;

  // "cartPaid" field.
  bool? _cartPaid;
  bool get cartPaid => _cartPaid ?? false;
  bool hasCartPaid() => _cartPaid != null;

  // "cartTable" field.
  String? _cartTable;
  String get cartTable => _cartTable ?? '';
  bool hasCartTable() => _cartTable != null;

  // "cartItems" field.
  List<DocumentReference>? _cartItems;
  List<DocumentReference> get cartItems => _cartItems ?? const [];
  bool hasCartItems() => _cartItems != null;

  // "orderID" field.
  String? _orderID;
  String get orderID => _orderID ?? '';
  bool hasOrderID() => _orderID != null;

  // "tip" field.
  double? _tip;
  double get tip => _tip ?? 0.0;
  bool hasTip() => _tip != null;

  // "tableID" field.
  String? _tableID;
  String get tableID => _tableID ?? '';
  bool hasTableID() => _tableID != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _itemCount = castToType<int>(snapshotData['itemCount']);
    _cartActive = snapshotData['cartActive'] as bool?;
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _total = castToType<double>(snapshotData['total']);
    _discount = castToType<double>(snapshotData['discount']);
    _extraCharge = castToType<double>(snapshotData['extraCharge']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _orderNumber = castToType<int>(snapshotData['orderNumber']);
    _cartPaid = snapshotData['cartPaid'] as bool?;
    _cartTable = snapshotData['cartTable'] as String?;
    _cartItems = getDataList(snapshotData['cartItems']);
    _orderID = snapshotData['orderID'] as String?;
    _tip = castToType<double>(snapshotData['tip']);
    _tableID = snapshotData['tableID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Carts');

  static Stream<CartsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartsRecord.fromSnapshot(s));

  static Future<CartsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartsRecord.fromSnapshot(s));

  static CartsRecord fromSnapshot(DocumentSnapshot snapshot) => CartsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartsRecordData({
  DocumentReference? userRef,
  int? itemCount,
  bool? cartActive,
  double? subtotal,
  double? total,
  double? discount,
  double? extraCharge,
  DateTime? createdAt,
  DateTime? modifiedAt,
  int? orderNumber,
  bool? cartPaid,
  String? cartTable,
  String? orderID,
  double? tip,
  String? tableID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'itemCount': itemCount,
      'cartActive': cartActive,
      'subtotal': subtotal,
      'total': total,
      'discount': discount,
      'extraCharge': extraCharge,
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'orderNumber': orderNumber,
      'cartPaid': cartPaid,
      'cartTable': cartTable,
      'orderID': orderID,
      'tip': tip,
      'tableID': tableID,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartsRecordDocumentEquality implements Equality<CartsRecord> {
  const CartsRecordDocumentEquality();

  @override
  bool equals(CartsRecord? e1, CartsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.itemCount == e2?.itemCount &&
        e1?.cartActive == e2?.cartActive &&
        e1?.subtotal == e2?.subtotal &&
        e1?.total == e2?.total &&
        e1?.discount == e2?.discount &&
        e1?.extraCharge == e2?.extraCharge &&
        e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.orderNumber == e2?.orderNumber &&
        e1?.cartPaid == e2?.cartPaid &&
        e1?.cartTable == e2?.cartTable &&
        listEquality.equals(e1?.cartItems, e2?.cartItems) &&
        e1?.orderID == e2?.orderID &&
        e1?.tip == e2?.tip &&
        e1?.tableID == e2?.tableID;
  }

  @override
  int hash(CartsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.itemCount,
        e?.cartActive,
        e?.subtotal,
        e?.total,
        e?.discount,
        e?.extraCharge,
        e?.createdAt,
        e?.modifiedAt,
        e?.orderNumber,
        e?.cartPaid,
        e?.cartTable,
        e?.cartItems,
        e?.orderID,
        e?.tip,
        e?.tableID
      ]);

  @override
  bool isValidKey(Object? o) => o is CartsRecord;
}
