import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ManageRdvpRecord extends FirestoreRecord {
  ManageRdvpRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "meeting_date" field.
  DateTime? _meetingDate;
  DateTime? get meetingDate => _meetingDate;
  bool hasMeetingDate() => _meetingDate != null;

  // "meeting_type" field.
  String? _meetingType;
  String get meetingType => _meetingType ?? '';
  bool hasMeetingType() => _meetingType != null;

  // "phone_meeting" field.
  String? _phoneMeeting;
  String get phoneMeeting => _phoneMeeting ?? '';
  bool hasPhoneMeeting() => _phoneMeeting != null;

  // "meeting_place" field.
  String? _meetingPlace;
  String get meetingPlace => _meetingPlace ?? '';
  bool hasMeetingPlace() => _meetingPlace != null;

  // "meeting_link" field.
  String? _meetingLink;
  String get meetingLink => _meetingLink ?? '';
  bool hasMeetingLink() => _meetingLink != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "rdvp" field.
  DocumentReference? _rdvp;
  DocumentReference? get rdvp => _rdvp;
  bool hasRdvp() => _rdvp != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  void _initializeFields() {
    _meetingDate = snapshotData['meeting_date'] as DateTime?;
    _meetingType = snapshotData['meeting_type'] as String?;
    _phoneMeeting = snapshotData['phone_meeting'] as String?;
    _meetingPlace = snapshotData['meeting_place'] as String?;
    _meetingLink = snapshotData['meeting_link'] as String?;
    _comments = snapshotData['comments'] as String?;
    _status = snapshotData['status'] as String?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _rdvp = snapshotData['rdvp'] as DocumentReference?;
    _createDate = snapshotData['create_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('manage_rdvp');

  static Stream<ManageRdvpRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ManageRdvpRecord.fromSnapshot(s));

  static Future<ManageRdvpRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ManageRdvpRecord.fromSnapshot(s));

  static ManageRdvpRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ManageRdvpRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ManageRdvpRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ManageRdvpRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ManageRdvpRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ManageRdvpRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createManageRdvpRecordData({
  DateTime? meetingDate,
  String? meetingType,
  String? phoneMeeting,
  String? meetingPlace,
  String? meetingLink,
  String? comments,
  String? status,
  DocumentReference? createBy,
  DocumentReference? rdvp,
  DateTime? createDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'meeting_date': meetingDate,
      'meeting_type': meetingType,
      'phone_meeting': phoneMeeting,
      'meeting_place': meetingPlace,
      'meeting_link': meetingLink,
      'comments': comments,
      'status': status,
      'create_by': createBy,
      'rdvp': rdvp,
      'create_date': createDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class ManageRdvpRecordDocumentEquality implements Equality<ManageRdvpRecord> {
  const ManageRdvpRecordDocumentEquality();

  @override
  bool equals(ManageRdvpRecord? e1, ManageRdvpRecord? e2) {
    return e1?.meetingDate == e2?.meetingDate &&
        e1?.meetingType == e2?.meetingType &&
        e1?.phoneMeeting == e2?.phoneMeeting &&
        e1?.meetingPlace == e2?.meetingPlace &&
        e1?.meetingLink == e2?.meetingLink &&
        e1?.comments == e2?.comments &&
        e1?.status == e2?.status &&
        e1?.createBy == e2?.createBy &&
        e1?.rdvp == e2?.rdvp &&
        e1?.createDate == e2?.createDate;
  }

  @override
  int hash(ManageRdvpRecord? e) => const ListEquality().hash([
        e?.meetingDate,
        e?.meetingType,
        e?.phoneMeeting,
        e?.meetingPlace,
        e?.meetingLink,
        e?.comments,
        e?.status,
        e?.createBy,
        e?.rdvp,
        e?.createDate
      ]);

  @override
  bool isValidKey(Object? o) => o is ManageRdvpRecord;
}
