import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ManageApplRecord extends FirestoreRecord {
  ManageApplRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "meeting_date" field.
  DateTime? _meetingDate;
  DateTime? get meetingDate => _meetingDate;
  bool hasMeetingDate() => _meetingDate != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "application" field.
  DocumentReference? _application;
  DocumentReference? get application => _application;
  bool hasApplication() => _application != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "info_meeting" field.
  String? _infoMeeting;
  String get infoMeeting => _infoMeeting ?? '';
  bool hasInfoMeeting() => _infoMeeting != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "meeting_type" field.
  int? _meetingType;
  int get meetingType => _meetingType ?? 0;
  bool hasMeetingType() => _meetingType != null;

  void _initializeFields() {
    _meetingDate = snapshotData['meeting_date'] as DateTime?;
    _comments = snapshotData['comments'] as String?;
    _status = snapshotData['status'] as String?;
    _application = snapshotData['application'] as DocumentReference?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _infoMeeting = snapshotData['info_meeting'] as String?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _meetingType = castToType<int>(snapshotData['meeting_type']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('manage_appl');

  static Stream<ManageApplRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ManageApplRecord.fromSnapshot(s));

  static Future<ManageApplRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ManageApplRecord.fromSnapshot(s));

  static ManageApplRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ManageApplRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ManageApplRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ManageApplRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ManageApplRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ManageApplRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createManageApplRecordData({
  DateTime? meetingDate,
  String? comments,
  String? status,
  DocumentReference? application,
  DocumentReference? createBy,
  String? infoMeeting,
  DateTime? createdDate,
  int? meetingType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'meeting_date': meetingDate,
      'comments': comments,
      'status': status,
      'application': application,
      'create_by': createBy,
      'info_meeting': infoMeeting,
      'created_date': createdDate,
      'meeting_type': meetingType,
    }.withoutNulls,
  );

  return firestoreData;
}

class ManageApplRecordDocumentEquality implements Equality<ManageApplRecord> {
  const ManageApplRecordDocumentEquality();

  @override
  bool equals(ManageApplRecord? e1, ManageApplRecord? e2) {
    return e1?.meetingDate == e2?.meetingDate &&
        e1?.comments == e2?.comments &&
        e1?.status == e2?.status &&
        e1?.application == e2?.application &&
        e1?.createBy == e2?.createBy &&
        e1?.infoMeeting == e2?.infoMeeting &&
        e1?.createdDate == e2?.createdDate &&
        e1?.meetingType == e2?.meetingType;
  }

  @override
  int hash(ManageApplRecord? e) => const ListEquality().hash([
        e?.meetingDate,
        e?.comments,
        e?.status,
        e?.application,
        e?.createBy,
        e?.infoMeeting,
        e?.createdDate,
        e?.meetingType
      ]);

  @override
  bool isValidKey(Object? o) => o is ManageApplRecord;
}
