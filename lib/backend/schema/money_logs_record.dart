import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoneyLogsRecord extends FirestoreRecord {
  MoneyLogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "amountLogged" field.
  double? _amountLogged;
  double get amountLogged => _amountLogged ?? 0.0;
  bool hasAmountLogged() => _amountLogged != null;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _details = snapshotData['details'] as String?;
    _amountLogged = castToType<double>(snapshotData['amountLogged']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('moneyLogs');

  static Stream<MoneyLogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoneyLogsRecord.fromSnapshot(s));

  static Future<MoneyLogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoneyLogsRecord.fromSnapshot(s));

  static MoneyLogsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MoneyLogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoneyLogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoneyLogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoneyLogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoneyLogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMoneyLogsRecordData({
  DocumentReference? owner,
  DateTime? timeCreated,
  String? details,
  double? amountLogged,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'time_created': timeCreated,
      'details': details,
      'amountLogged': amountLogged,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoneyLogsRecordDocumentEquality implements Equality<MoneyLogsRecord> {
  const MoneyLogsRecordDocumentEquality();

  @override
  bool equals(MoneyLogsRecord? e1, MoneyLogsRecord? e2) {
    return e1?.owner == e2?.owner &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.details == e2?.details &&
        e1?.amountLogged == e2?.amountLogged;
  }

  @override
  int hash(MoneyLogsRecord? e) => const ListEquality()
      .hash([e?.owner, e?.timeCreated, e?.details, e?.amountLogged]);

  @override
  bool isValidKey(Object? o) => o is MoneyLogsRecord;
}
