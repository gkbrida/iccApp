import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupsRecord extends FirestoreRecord {
  GroupsRecord._(
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

  // "department" field.
  DocumentReference? _department;
  DocumentReference? get department => _department;
  bool hasDepartment() => _department != null;

  // "manager" field.
  DocumentReference? _manager;
  DocumentReference? get manager => _manager;
  bool hasManager() => _manager != null;

  // "second" field.
  DocumentReference? _second;
  DocumentReference? get second => _second;
  bool hasSecond() => _second != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "department_name" field.
  String? _departmentName;
  String get departmentName => _departmentName ?? '';
  bool hasDepartmentName() => _departmentName != null;

  // "id" field.
  DocumentReference? _id;
  DocumentReference? get id => _id;
  bool hasId() => _id != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _department = snapshotData['department'] as DocumentReference?;
    _manager = snapshotData['manager'] as DocumentReference?;
    _second = snapshotData['second'] as DocumentReference?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _departmentName = snapshotData['department_name'] as String?;
    _id = snapshotData['id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('groups');

  static Stream<GroupsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupsRecord.fromSnapshot(s));

  static Future<GroupsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupsRecord.fromSnapshot(s));

  static GroupsRecord fromSnapshot(DocumentSnapshot snapshot) => GroupsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupsRecordData({
  String? name,
  DateTime? createDate,
  DocumentReference? department,
  DocumentReference? manager,
  DocumentReference? second,
  DocumentReference? createBy,
  String? departmentName,
  DocumentReference? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'create_date': createDate,
      'department': department,
      'manager': manager,
      'second': second,
      'create_by': createBy,
      'department_name': departmentName,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupsRecordDocumentEquality implements Equality<GroupsRecord> {
  const GroupsRecordDocumentEquality();

  @override
  bool equals(GroupsRecord? e1, GroupsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.createDate == e2?.createDate &&
        e1?.department == e2?.department &&
        e1?.manager == e2?.manager &&
        e1?.second == e2?.second &&
        e1?.createBy == e2?.createBy &&
        e1?.departmentName == e2?.departmentName &&
        e1?.id == e2?.id;
  }

  @override
  int hash(GroupsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.createDate,
        e?.department,
        e?.manager,
        e?.second,
        e?.createBy,
        e?.departmentName,
        e?.id
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupsRecord;
}
