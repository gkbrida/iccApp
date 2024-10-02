import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupAdvisorRecord extends FirestoreRecord {
  GroupAdvisorRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "group" field.
  DocumentReference? _group;
  DocumentReference? get group => _group;
  bool hasGroup() => _group != null;

  // "advisor" field.
  DocumentReference? _advisor;
  DocumentReference? get advisor => _advisor;
  bool hasAdvisor() => _advisor != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "dpt" field.
  DocumentReference? _dpt;
  DocumentReference? get dpt => _dpt;
  bool hasDpt() => _dpt != null;

  // "advisor_name" field.
  String? _advisorName;
  String get advisorName => _advisorName ?? '';
  bool hasAdvisorName() => _advisorName != null;

  // "group_name" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  bool hasGroupName() => _groupName != null;

  // "church" field.
  DocumentReference? _church;
  DocumentReference? get church => _church;
  bool hasChurch() => _church != null;

  void _initializeFields() {
    _group = snapshotData['group'] as DocumentReference?;
    _advisor = snapshotData['advisor'] as DocumentReference?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _dpt = snapshotData['dpt'] as DocumentReference?;
    _advisorName = snapshotData['advisor_name'] as String?;
    _groupName = snapshotData['group_name'] as String?;
    _church = snapshotData['church'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('group_advisor');

  static Stream<GroupAdvisorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupAdvisorRecord.fromSnapshot(s));

  static Future<GroupAdvisorRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupAdvisorRecord.fromSnapshot(s));

  static GroupAdvisorRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GroupAdvisorRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupAdvisorRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupAdvisorRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupAdvisorRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupAdvisorRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupAdvisorRecordData({
  DocumentReference? group,
  DocumentReference? advisor,
  DocumentReference? createdBy,
  DateTime? createDate,
  DocumentReference? dpt,
  String? advisorName,
  String? groupName,
  DocumentReference? church,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'group': group,
      'advisor': advisor,
      'created_by': createdBy,
      'create_date': createDate,
      'dpt': dpt,
      'advisor_name': advisorName,
      'group_name': groupName,
      'church': church,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupAdvisorRecordDocumentEquality
    implements Equality<GroupAdvisorRecord> {
  const GroupAdvisorRecordDocumentEquality();

  @override
  bool equals(GroupAdvisorRecord? e1, GroupAdvisorRecord? e2) {
    return e1?.group == e2?.group &&
        e1?.advisor == e2?.advisor &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createDate == e2?.createDate &&
        e1?.dpt == e2?.dpt &&
        e1?.advisorName == e2?.advisorName &&
        e1?.groupName == e2?.groupName &&
        e1?.church == e2?.church;
  }

  @override
  int hash(GroupAdvisorRecord? e) => const ListEquality().hash([
        e?.group,
        e?.advisor,
        e?.createdBy,
        e?.createDate,
        e?.dpt,
        e?.advisorName,
        e?.groupName,
        e?.church
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupAdvisorRecord;
}
