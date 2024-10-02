import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "place" field.
  String? _place;
  String get place => _place ?? '';
  bool hasPlace() => _place != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "poster" field.
  String? _poster;
  String get poster => _poster ?? '';
  bool hasPoster() => _poster != null;

  // "posted_date" field.
  DateTime? _postedDate;
  DateTime? get postedDate => _postedDate;
  bool hasPostedDate() => _postedDate != null;

  // "posted_by" field.
  DocumentReference? _postedBy;
  DocumentReference? get postedBy => _postedBy;
  bool hasPostedBy() => _postedBy != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "church" field.
  DocumentReference? _church;
  DocumentReference? get church => _church;
  bool hasChurch() => _church != null;

  void _initializeFields() {
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _place = snapshotData['place'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _status = snapshotData['status'] as bool?;
    _poster = snapshotData['poster'] as String?;
    _postedDate = snapshotData['posted_date'] as DateTime?;
    _postedBy = snapshotData['posted_by'] as DocumentReference?;
    _comments = snapshotData['comments'] as String?;
    _church = snapshotData['church'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  DateTime? startDate,
  DateTime? endDate,
  String? title,
  String? place,
  DateTime? createDate,
  DocumentReference? createBy,
  bool? status,
  String? poster,
  DateTime? postedDate,
  DocumentReference? postedBy,
  String? comments,
  DocumentReference? church,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'start_date': startDate,
      'end_date': endDate,
      'title': title,
      'place': place,
      'create_date': createDate,
      'create_by': createBy,
      'status': status,
      'poster': poster,
      'posted_date': postedDate,
      'posted_by': postedBy,
      'comments': comments,
      'church': church,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    return e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.title == e2?.title &&
        e1?.place == e2?.place &&
        e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.status == e2?.status &&
        e1?.poster == e2?.poster &&
        e1?.postedDate == e2?.postedDate &&
        e1?.postedBy == e2?.postedBy &&
        e1?.comments == e2?.comments &&
        e1?.church == e2?.church;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.startDate,
        e?.endDate,
        e?.title,
        e?.place,
        e?.createDate,
        e?.createBy,
        e?.status,
        e?.poster,
        e?.postedDate,
        e?.postedBy,
        e?.comments,
        e?.church
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
