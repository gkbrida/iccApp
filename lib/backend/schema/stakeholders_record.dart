import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StakeholdersRecord extends FirestoreRecord {
  StakeholdersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tasks" field.
  DocumentReference? _tasks;
  DocumentReference? get tasks => _tasks;
  bool hasTasks() => _tasks != null;

  // "star" field.
  DocumentReference? _star;
  DocumentReference? get star => _star;
  bool hasStar() => _star != null;

  // "dpt" field.
  DocumentReference? _dpt;
  DocumentReference? get dpt => _dpt;
  bool hasDpt() => _dpt != null;

  // "invite" field.
  String? _invite;
  String get invite => _invite ?? '';
  bool hasInvite() => _invite != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "typeStakeholder" field.
  String? _typeStakeholder;
  String get typeStakeholder => _typeStakeholder ?? '';
  bool hasTypeStakeholder() => _typeStakeholder != null;

  // "star_name" field.
  String? _starName;
  String get starName => _starName ?? '';
  bool hasStarName() => _starName != null;

  // "dpt_name" field.
  String? _dptName;
  String get dptName => _dptName ?? '';
  bool hasDptName() => _dptName != null;

  void _initializeFields() {
    _tasks = snapshotData['tasks'] as DocumentReference?;
    _star = snapshotData['star'] as DocumentReference?;
    _dpt = snapshotData['dpt'] as DocumentReference?;
    _invite = snapshotData['invite'] as String?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _typeStakeholder = snapshotData['typeStakeholder'] as String?;
    _starName = snapshotData['star_name'] as String?;
    _dptName = snapshotData['dpt_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stakeholders');

  static Stream<StakeholdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StakeholdersRecord.fromSnapshot(s));

  static Future<StakeholdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StakeholdersRecord.fromSnapshot(s));

  static StakeholdersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StakeholdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StakeholdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StakeholdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StakeholdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StakeholdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStakeholdersRecordData({
  DocumentReference? tasks,
  DocumentReference? star,
  DocumentReference? dpt,
  String? invite,
  DocumentReference? createdBy,
  DateTime? createdDate,
  String? typeStakeholder,
  String? starName,
  String? dptName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tasks': tasks,
      'star': star,
      'dpt': dpt,
      'invite': invite,
      'created_by': createdBy,
      'created_date': createdDate,
      'typeStakeholder': typeStakeholder,
      'star_name': starName,
      'dpt_name': dptName,
    }.withoutNulls,
  );

  return firestoreData;
}

class StakeholdersRecordDocumentEquality
    implements Equality<StakeholdersRecord> {
  const StakeholdersRecordDocumentEquality();

  @override
  bool equals(StakeholdersRecord? e1, StakeholdersRecord? e2) {
    return e1?.tasks == e2?.tasks &&
        e1?.star == e2?.star &&
        e1?.dpt == e2?.dpt &&
        e1?.invite == e2?.invite &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdDate == e2?.createdDate &&
        e1?.typeStakeholder == e2?.typeStakeholder &&
        e1?.starName == e2?.starName &&
        e1?.dptName == e2?.dptName;
  }

  @override
  int hash(StakeholdersRecord? e) => const ListEquality().hash([
        e?.tasks,
        e?.star,
        e?.dpt,
        e?.invite,
        e?.createdBy,
        e?.createdDate,
        e?.typeStakeholder,
        e?.starName,
        e?.dptName
      ]);

  @override
  bool isValidKey(Object? o) => o is StakeholdersRecord;
}
