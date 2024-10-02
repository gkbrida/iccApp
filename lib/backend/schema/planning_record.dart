import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanningRecord extends FirestoreRecord {
  PlanningRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "department" field.
  DocumentReference? _department;
  DocumentReference? get department => _department;
  bool hasDepartment() => _department != null;

  // "star" field.
  DocumentReference? _star;
  DocumentReference? get star => _star;
  bool hasStar() => _star != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "is_master" field.
  bool? _isMaster;
  bool get isMaster => _isMaster ?? false;
  bool hasIsMaster() => _isMaster != null;

  void _initializeFields() {
    _department = snapshotData['department'] as DocumentReference?;
    _star = snapshotData['star'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _event = snapshotData['event'] as DocumentReference?;
    _isMaster = snapshotData['is_master'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('planning');

  static Stream<PlanningRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlanningRecord.fromSnapshot(s));

  static Future<PlanningRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlanningRecord.fromSnapshot(s));

  static PlanningRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlanningRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlanningRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlanningRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlanningRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlanningRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlanningRecordData({
  DocumentReference? department,
  DocumentReference? star,
  String? comment,
  DateTime? createDate,
  DocumentReference? event,
  bool? isMaster,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'department': department,
      'star': star,
      'comment': comment,
      'create_date': createDate,
      'event': event,
      'is_master': isMaster,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlanningRecordDocumentEquality implements Equality<PlanningRecord> {
  const PlanningRecordDocumentEquality();

  @override
  bool equals(PlanningRecord? e1, PlanningRecord? e2) {
    return e1?.department == e2?.department &&
        e1?.star == e2?.star &&
        e1?.comment == e2?.comment &&
        e1?.createDate == e2?.createDate &&
        e1?.event == e2?.event &&
        e1?.isMaster == e2?.isMaster;
  }

  @override
  int hash(PlanningRecord? e) => const ListEquality().hash([
        e?.department,
        e?.star,
        e?.comment,
        e?.createDate,
        e?.event,
        e?.isMaster
      ]);

  @override
  bool isValidKey(Object? o) => o is PlanningRecord;
}
