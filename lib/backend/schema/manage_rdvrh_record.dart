import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ManageRdvrhRecord extends FirestoreRecord {
  ManageRdvrhRecord._(
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

  // "create_date" field.
  String? _createDate;
  String get createDate => _createDate ?? '';
  bool hasCreateDate() => _createDate != null;

  // "rdvrh" field.
  DocumentReference? _rdvrh;
  DocumentReference? get rdvrh => _rdvrh;
  bool hasRdvrh() => _rdvrh != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  void _initializeFields() {
    _meetingDate = snapshotData['meeting_date'] as DateTime?;
    _meetingType = snapshotData['meeting_type'] as String?;
    _phoneMeeting = snapshotData['phone_meeting'] as String?;
    _meetingPlace = snapshotData['meeting_place'] as String?;
    _meetingLink = snapshotData['meeting_link'] as String?;
    _comments = snapshotData['comments'] as String?;
    _status = snapshotData['status'] as String?;
    _createDate = snapshotData['create_date'] as String?;
    _rdvrh = snapshotData['rdvrh'] as DocumentReference?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('manage_rdvrh');

  static Stream<ManageRdvrhRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ManageRdvrhRecord.fromSnapshot(s));

  static Future<ManageRdvrhRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ManageRdvrhRecord.fromSnapshot(s));

  static ManageRdvrhRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ManageRdvrhRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ManageRdvrhRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ManageRdvrhRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ManageRdvrhRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ManageRdvrhRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createManageRdvrhRecordData({
  DateTime? meetingDate,
  String? meetingType,
  String? phoneMeeting,
  String? meetingPlace,
  String? meetingLink,
  String? comments,
  String? status,
  String? createDate,
  DocumentReference? rdvrh,
  DocumentReference? createBy,
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
      'create_date': createDate,
      'rdvrh': rdvrh,
      'create_by': createBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ManageRdvrhRecordDocumentEquality implements Equality<ManageRdvrhRecord> {
  const ManageRdvrhRecordDocumentEquality();

  @override
  bool equals(ManageRdvrhRecord? e1, ManageRdvrhRecord? e2) {
    return e1?.meetingDate == e2?.meetingDate &&
        e1?.meetingType == e2?.meetingType &&
        e1?.phoneMeeting == e2?.phoneMeeting &&
        e1?.meetingPlace == e2?.meetingPlace &&
        e1?.meetingLink == e2?.meetingLink &&
        e1?.comments == e2?.comments &&
        e1?.status == e2?.status &&
        e1?.createDate == e2?.createDate &&
        e1?.rdvrh == e2?.rdvrh &&
        e1?.createBy == e2?.createBy;
  }

  @override
  int hash(ManageRdvrhRecord? e) => const ListEquality().hash([
        e?.meetingDate,
        e?.meetingType,
        e?.phoneMeeting,
        e?.meetingPlace,
        e?.meetingLink,
        e?.comments,
        e?.status,
        e?.createDate,
        e?.rdvrh,
        e?.createBy
      ]);

  @override
  bool isValidKey(Object? o) => o is ManageRdvrhRecord;
}
