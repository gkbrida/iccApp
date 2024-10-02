import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicesRecord extends FirestoreRecord {
  ServicesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "application" field.
  DocumentReference? _application;
  DocumentReference? get application => _application;
  bool hasApplication() => _application != null;

  // "Department" field.
  DocumentReference? _department;
  DocumentReference? get department => _department;
  bool hasDepartment() => _department != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "department_name" field.
  String? _departmentName;
  String get departmentName => _departmentName ?? '';
  bool hasDepartmentName() => _departmentName != null;

  // "star_name" field.
  String? _starName;
  String get starName => _starName ?? '';
  bool hasStarName() => _starName != null;

  // "churchID" field.
  DocumentReference? _churchID;
  DocumentReference? get churchID => _churchID;
  bool hasChurchID() => _churchID != null;

  // "deleted" field.
  bool? _deleted;
  bool get deleted => _deleted ?? false;
  bool hasDeleted() => _deleted != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "modified_by" field.
  DocumentReference? _modifiedBy;
  DocumentReference? get modifiedBy => _modifiedBy;
  bool hasModifiedBy() => _modifiedBy != null;

  void _initializeFields() {
    _application = snapshotData['application'] as DocumentReference?;
    _department = snapshotData['Department'] as DocumentReference?;
    _status = snapshotData['status'] as bool?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _departmentName = snapshotData['department_name'] as String?;
    _starName = snapshotData['star_name'] as String?;
    _churchID = snapshotData['churchID'] as DocumentReference?;
    _deleted = snapshotData['deleted'] as bool?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _modifiedBy = snapshotData['modified_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('services');

  static Stream<ServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicesRecord.fromSnapshot(s));

  static Future<ServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicesRecord.fromSnapshot(s));

  static ServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicesRecordData({
  DocumentReference? application,
  DocumentReference? department,
  bool? status,
  DateTime? createDate,
  DocumentReference? createBy,
  String? departmentName,
  String? starName,
  DocumentReference? churchID,
  bool? deleted,
  DateTime? modifiedAt,
  DocumentReference? modifiedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'application': application,
      'Department': department,
      'status': status,
      'create_date': createDate,
      'create_by': createBy,
      'department_name': departmentName,
      'star_name': starName,
      'churchID': churchID,
      'deleted': deleted,
      'modified_at': modifiedAt,
      'modified_by': modifiedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicesRecordDocumentEquality implements Equality<ServicesRecord> {
  const ServicesRecordDocumentEquality();

  @override
  bool equals(ServicesRecord? e1, ServicesRecord? e2) {
    return e1?.application == e2?.application &&
        e1?.department == e2?.department &&
        e1?.status == e2?.status &&
        e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.departmentName == e2?.departmentName &&
        e1?.starName == e2?.starName &&
        e1?.churchID == e2?.churchID &&
        e1?.deleted == e2?.deleted &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.modifiedBy == e2?.modifiedBy;
  }

  @override
  int hash(ServicesRecord? e) => const ListEquality().hash([
        e?.application,
        e?.department,
        e?.status,
        e?.createDate,
        e?.createBy,
        e?.departmentName,
        e?.starName,
        e?.churchID,
        e?.deleted,
        e?.modifiedAt,
        e?.modifiedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is ServicesRecord;
}
