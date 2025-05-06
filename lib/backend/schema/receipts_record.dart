import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReceiptsRecord extends FirestoreRecord {
  ReceiptsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "receipt_image" field.
  String? _receiptImage;
  String get receiptImage => _receiptImage ?? '';
  bool hasReceiptImage() => _receiptImage != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "time_stamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "receipt_items" field.
  List<ReceiptItemDataTypeStruct>? _receiptItems;
  List<ReceiptItemDataTypeStruct> get receiptItems => _receiptItems ?? const [];
  bool hasReceiptItems() => _receiptItems != null;

  void _initializeFields() {
    _receiptImage = snapshotData['receipt_image'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _timeStamp = snapshotData['time_stamp'] as DateTime?;
    _receiptItems = getStructList(
      snapshotData['receipt_items'],
      ReceiptItemDataTypeStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('receipts');

  static Stream<ReceiptsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReceiptsRecord.fromSnapshot(s));

  static Future<ReceiptsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReceiptsRecord.fromSnapshot(s));

  static ReceiptsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReceiptsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReceiptsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReceiptsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReceiptsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReceiptsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReceiptsRecordData({
  String? receiptImage,
  String? userId,
  DateTime? timeStamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'receipt_image': receiptImage,
      'user_id': userId,
      'time_stamp': timeStamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReceiptsRecordDocumentEquality implements Equality<ReceiptsRecord> {
  const ReceiptsRecordDocumentEquality();

  @override
  bool equals(ReceiptsRecord? e1, ReceiptsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.receiptImage == e2?.receiptImage &&
        e1?.userId == e2?.userId &&
        e1?.timeStamp == e2?.timeStamp &&
        listEquality.equals(e1?.receiptItems, e2?.receiptItems);
  }

  @override
  int hash(ReceiptsRecord? e) => const ListEquality()
      .hash([e?.receiptImage, e?.userId, e?.timeStamp, e?.receiptItems]);

  @override
  bool isValidKey(Object? o) => o is ReceiptsRecord;
}
