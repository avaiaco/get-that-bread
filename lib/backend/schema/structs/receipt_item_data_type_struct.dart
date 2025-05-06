// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ReceiptItemDataTypeStruct extends FFFirebaseStruct {
  ReceiptItemDataTypeStruct({
    String? item,
    double? price,
    bool? glutenFree,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _item = item,
        _price = price,
        _glutenFree = glutenFree,
        super(firestoreUtilData);

  // "item" field.
  String? _item;
  String get item => _item ?? '';
  set item(String? val) => _item = val;

  bool hasItem() => _item != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "gluten_free" field.
  bool? _glutenFree;
  bool get glutenFree => _glutenFree ?? false;
  set glutenFree(bool? val) => _glutenFree = val;

  bool hasGlutenFree() => _glutenFree != null;

  static ReceiptItemDataTypeStruct fromMap(Map<String, dynamic> data) =>
      ReceiptItemDataTypeStruct(
        item: data['item'] as String?,
        price: castToType<double>(data['price']),
        glutenFree: data['gluten_free'] as bool?,
      );

  static ReceiptItemDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? ReceiptItemDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'item': _item,
        'price': _price,
        'gluten_free': _glutenFree,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'item': serializeParam(
          _item,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'gluten_free': serializeParam(
          _glutenFree,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ReceiptItemDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ReceiptItemDataTypeStruct(
        item: deserializeParam(
          data['item'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        glutenFree: deserializeParam(
          data['gluten_free'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ReceiptItemDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReceiptItemDataTypeStruct &&
        item == other.item &&
        price == other.price &&
        glutenFree == other.glutenFree;
  }

  @override
  int get hashCode => const ListEquality().hash([item, price, glutenFree]);
}

ReceiptItemDataTypeStruct createReceiptItemDataTypeStruct({
  String? item,
  double? price,
  bool? glutenFree,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ReceiptItemDataTypeStruct(
      item: item,
      price: price,
      glutenFree: glutenFree,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ReceiptItemDataTypeStruct? updateReceiptItemDataTypeStruct(
  ReceiptItemDataTypeStruct? receiptItemDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    receiptItemDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addReceiptItemDataTypeStructData(
  Map<String, dynamic> firestoreData,
  ReceiptItemDataTypeStruct? receiptItemDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (receiptItemDataType == null) {
    return;
  }
  if (receiptItemDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && receiptItemDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final receiptItemDataTypeData =
      getReceiptItemDataTypeFirestoreData(receiptItemDataType, forFieldValue);
  final nestedData =
      receiptItemDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      receiptItemDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getReceiptItemDataTypeFirestoreData(
  ReceiptItemDataTypeStruct? receiptItemDataType, [
  bool forFieldValue = false,
]) {
  if (receiptItemDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(receiptItemDataType.toMap());

  // Add any Firestore field values
  receiptItemDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getReceiptItemDataTypeListFirestoreData(
  List<ReceiptItemDataTypeStruct>? receiptItemDataTypes,
) =>
    receiptItemDataTypes
        ?.map((e) => getReceiptItemDataTypeFirestoreData(e, true))
        .toList() ??
    [];
