import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepartmentsRecord extends FirestoreRecord {
  DepartmentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "ministry" field.
  DocumentReference? _ministry;
  DocumentReference? get ministry => _ministry;
  bool hasMinistry() => _ministry != null;

  // "manager" field.
  DocumentReference? _manager;
  DocumentReference? get manager => _manager;
  bool hasManager() => _manager != null;

  // "second" field.
  DocumentReference? _second;
  DocumentReference? get second => _second;
  bool hasSecond() => _second != null;

  // "church" field.
  String? _church;
  String get church => _church ?? '';
  bool hasChurch() => _church != null;

  // "ministry_name" field.
  String? _ministryName;
  String get ministryName => _ministryName ?? '';
  bool hasMinistryName() => _ministryName != null;

  // "manager_name" field.
  String? _managerName;
  String get managerName => _managerName ?? '';
  bool hasManagerName() => _managerName != null;

  // "second_name" field.
  String? _secondName;
  String get secondName => _secondName ?? '';
  bool hasSecondName() => _secondName != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "modfied_by" field.
  DocumentReference? _modfiedBy;
  DocumentReference? get modfiedBy => _modfiedBy;
  bool hasModfiedBy() => _modfiedBy != null;

  // "church_id" field.
  DocumentReference? _churchId;
  DocumentReference? get churchId => _churchId;
  bool hasChurchId() => _churchId != null;

  // "id" field.
  DocumentReference? _id;
  DocumentReference? get id => _id;
  bool hasId() => _id != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _ministry = snapshotData['ministry'] as DocumentReference?;
    _manager = snapshotData['manager'] as DocumentReference?;
    _second = snapshotData['second'] as DocumentReference?;
    _church = snapshotData['church'] as String?;
    _ministryName = snapshotData['ministry_name'] as String?;
    _managerName = snapshotData['manager_name'] as String?;
    _secondName = snapshotData['second_name'] as String?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _modfiedBy = snapshotData['modfied_by'] as DocumentReference?;
    _churchId = snapshotData['church_id'] as DocumentReference?;
    _id = snapshotData['id'] as DocumentReference?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('departments');

  static Stream<DepartmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DepartmentsRecord.fromSnapshot(s));

  static Future<DepartmentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DepartmentsRecord.fromSnapshot(s));

  static DepartmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DepartmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DepartmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DepartmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DepartmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DepartmentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDepartmentsRecordData({
  String? name,
  DateTime? createDate,
  DocumentReference? ministry,
  DocumentReference? manager,
  DocumentReference? second,
  String? church,
  String? ministryName,
  String? managerName,
  String? secondName,
  DateTime? modifiedAt,
  DocumentReference? modfiedBy,
  DocumentReference? churchId,
  DocumentReference? id,
  DocumentReference? createBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'create_date': createDate,
      'ministry': ministry,
      'manager': manager,
      'second': second,
      'church': church,
      'ministry_name': ministryName,
      'manager_name': managerName,
      'second_name': secondName,
      'modified_at': modifiedAt,
      'modfied_by': modfiedBy,
      'church_id': churchId,
      'id': id,
      'create_by': createBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class DepartmentsRecordDocumentEquality implements Equality<DepartmentsRecord> {
  const DepartmentsRecordDocumentEquality();

  @override
  bool equals(DepartmentsRecord? e1, DepartmentsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.createDate == e2?.createDate &&
        e1?.ministry == e2?.ministry &&
        e1?.manager == e2?.manager &&
        e1?.second == e2?.second &&
        e1?.church == e2?.church &&
        e1?.ministryName == e2?.ministryName &&
        e1?.managerName == e2?.managerName &&
        e1?.secondName == e2?.secondName &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.modfiedBy == e2?.modfiedBy &&
        e1?.churchId == e2?.churchId &&
        e1?.id == e2?.id &&
        e1?.createBy == e2?.createBy;
  }

  @override
  int hash(DepartmentsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.createDate,
        e?.ministry,
        e?.manager,
        e?.second,
        e?.church,
        e?.ministryName,
        e?.managerName,
        e?.secondName,
        e?.modifiedAt,
        e?.modfiedBy,
        e?.churchId,
        e?.id,
        e?.createBy
      ]);

  @override
  bool isValidKey(Object? o) => o is DepartmentsRecord;
}
