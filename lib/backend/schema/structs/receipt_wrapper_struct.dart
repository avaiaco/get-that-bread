// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReceiptWrapperStruct extends FFFirebaseStruct {
  ReceiptWrapperStruct({
    List<ReceiptItemDataTypeStruct>? items,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _items = items,
        super(firestoreUtilData);

  // "items" field.
  List<ReceiptItemDataTypeStruct>? _items;
  List<ReceiptItemDataTypeStruct> get items => _items ?? const [];
  set items(List<ReceiptItemDataTypeStruct>? val) => _items = val;

  void updateItems(Function(List<ReceiptItemDataTypeStruct>) updateFn) {
    updateFn(_items ??= []);
  }

  bool hasItems() => _items != null;

  static ReceiptWrapperStruct fromMap(Map<String, dynamic> data) =>
      ReceiptWrapperStruct(
        items: getStructList(
          data['items'],
          ReceiptItemDataTypeStruct.fromMap,
        ),
      );

  static ReceiptWrapperStruct? maybeFromMap(dynamic data) => data is Map
      ? ReceiptWrapperStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'items': _items?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ReceiptWrapperStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReceiptWrapperStruct(
        items: deserializeStructParam<ReceiptItemDataTypeStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: ReceiptItemDataTypeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ReceiptWrapperStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ReceiptWrapperStruct &&
        listEquality.equals(items, other.items);
  }

  @override
  int get hashCode => const ListEquality().hash([items]);
}

ReceiptWrapperStruct createReceiptWrapperStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ReceiptWrapperStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ReceiptWrapperStruct? updateReceiptWrapperStruct(
  ReceiptWrapperStruct? receiptWrapper, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    receiptWrapper
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addReceiptWrapperStructData(
  Map<String, dynamic> firestoreData,
  ReceiptWrapperStruct? receiptWrapper,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (receiptWrapper == null) {
    return;
  }
  if (receiptWrapper.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && receiptWrapper.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final receiptWrapperData =
      getReceiptWrapperFirestoreData(receiptWrapper, forFieldValue);
  final nestedData =
      receiptWrapperData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = receiptWrapper.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getReceiptWrapperFirestoreData(
  ReceiptWrapperStruct? receiptWrapper, [
  bool forFieldValue = false,
]) {
  if (receiptWrapper == null) {
    return {};
  }
  final firestoreData = mapToFirestore(receiptWrapper.toMap());

  // Add any Firestore field values
  receiptWrapper.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getReceiptWrapperListFirestoreData(
  List<ReceiptWrapperStruct>? receiptWrappers,
) =>
    receiptWrappers
        ?.map((e) => getReceiptWrapperFirestoreData(e, true))
        .toList() ??
    [];
