import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OutlinesRecord extends FirestoreRecord {
  OutlinesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "last_task_date" field.
  DateTime? _lastTaskDate;
  DateTime? get lastTaskDate => _lastTaskDate;
  bool hasLastTaskDate() => _lastTaskDate != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _event = snapshotData['event'] as DocumentReference?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _lastTaskDate = snapshotData['last_task_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('outlines');

  static Stream<OutlinesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OutlinesRecord.fromSnapshot(s));

  static Future<OutlinesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OutlinesRecord.fromSnapshot(s));

  static OutlinesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OutlinesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OutlinesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OutlinesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OutlinesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OutlinesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOutlinesRecordData({
  String? name,
  DateTime? startDate,
  DocumentReference? event,
  DocumentReference? createdBy,
  DateTime? createdDate,
  DateTime? endDate,
  DateTime? lastTaskDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'start_date': startDate,
      'event': event,
      'created_by': createdBy,
      'created_date': createdDate,
      'end_date': endDate,
      'last_task_date': lastTaskDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class OutlinesRecordDocumentEquality implements Equality<OutlinesRecord> {
  const OutlinesRecordDocumentEquality();

  @override
  bool equals(OutlinesRecord? e1, OutlinesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.startDate == e2?.startDate &&
        e1?.event == e2?.event &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdDate == e2?.createdDate &&
        e1?.endDate == e2?.endDate &&
        e1?.lastTaskDate == e2?.lastTaskDate;
  }

  @override
  int hash(OutlinesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.startDate,
        e?.event,
        e?.createdBy,
        e?.createdDate,
        e?.endDate,
        e?.lastTaskDate
      ]);

  @override
  bool isValidKey(Object? o) => o is OutlinesRecord;
}
