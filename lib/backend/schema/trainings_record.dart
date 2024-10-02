import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrainingsRecord extends FirestoreRecord {
  TrainingsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "training" field.
  String? _training;
  String get training => _training ?? '';
  bool hasTraining() => _training != null;

  // "startdate" field.
  DateTime? _startdate;
  DateTime? get startdate => _startdate;
  bool hasStartdate() => _startdate != null;

  // "enddate" field.
  DateTime? _enddate;
  DateTime? get enddate => _enddate;
  bool hasEnddate() => _enddate != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "newcome" field.
  DocumentReference? _newcome;
  DocumentReference? get newcome => _newcome;
  bool hasNewcome() => _newcome != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _training = snapshotData['training'] as String?;
    _startdate = snapshotData['startdate'] as DateTime?;
    _enddate = snapshotData['enddate'] as DateTime?;
    _comments = snapshotData['comments'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _newcome = snapshotData['newcome'] as DocumentReference?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _status = snapshotData['status'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Trainings');

  static Stream<TrainingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TrainingsRecord.fromSnapshot(s));

  static Future<TrainingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TrainingsRecord.fromSnapshot(s));

  static TrainingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TrainingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TrainingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TrainingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TrainingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TrainingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTrainingsRecordData({
  String? training,
  DateTime? startdate,
  DateTime? enddate,
  String? comments,
  DateTime? createDate,
  DocumentReference? newcome,
  DocumentReference? createBy,
  bool? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'training': training,
      'startdate': startdate,
      'enddate': enddate,
      'comments': comments,
      'create_date': createDate,
      'newcome': newcome,
      'create_by': createBy,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class TrainingsRecordDocumentEquality implements Equality<TrainingsRecord> {
  const TrainingsRecordDocumentEquality();

  @override
  bool equals(TrainingsRecord? e1, TrainingsRecord? e2) {
    return e1?.training == e2?.training &&
        e1?.startdate == e2?.startdate &&
        e1?.enddate == e2?.enddate &&
        e1?.comments == e2?.comments &&
        e1?.createDate == e2?.createDate &&
        e1?.newcome == e2?.newcome &&
        e1?.createBy == e2?.createBy &&
        e1?.status == e2?.status;
  }

  @override
  int hash(TrainingsRecord? e) => const ListEquality().hash([
        e?.training,
        e?.startdate,
        e?.enddate,
        e?.comments,
        e?.createDate,
        e?.newcome,
        e?.createBy,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is TrainingsRecord;
}
