import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventStarRecord extends FirestoreRecord {
  EventStarRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "star" field.
  DocumentReference? _star;
  DocumentReference? get star => _star;
  bool hasStar() => _star != null;

  // "dpt" field.
  DocumentReference? _dpt;
  DocumentReference? get dpt => _dpt;
  bool hasDpt() => _dpt != null;

  // "ministry" field.
  DocumentReference? _ministry;
  DocumentReference? get ministry => _ministry;
  bool hasMinistry() => _ministry != null;

  // "star_name" field.
  String? _starName;
  String get starName => _starName ?? '';
  bool hasStarName() => _starName != null;

  // "dpt_name" field.
  String? _dptName;
  String get dptName => _dptName ?? '';
  bool hasDptName() => _dptName != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "group" field.
  DocumentReference? _group;
  DocumentReference? get group => _group;
  bool hasGroup() => _group != null;

  // "group_name" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  bool hasGroupName() => _groupName != null;

  // "group_affectation" field.
  bool? _groupAffectation;
  bool get groupAffectation => _groupAffectation ?? false;
  bool hasGroupAffectation() => _groupAffectation != null;

  // "event_date" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  bool hasEventDate() => _eventDate != null;

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  void _initializeFields() {
    _event = snapshotData['event'] as DocumentReference?;
    _star = snapshotData['star'] as DocumentReference?;
    _dpt = snapshotData['dpt'] as DocumentReference?;
    _ministry = snapshotData['ministry'] as DocumentReference?;
    _starName = snapshotData['star_name'] as String?;
    _dptName = snapshotData['dpt_name'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _group = snapshotData['group'] as DocumentReference?;
    _groupName = snapshotData['group_name'] as String?;
    _groupAffectation = snapshotData['group_affectation'] as bool?;
    _eventDate = snapshotData['event_date'] as DateTime?;
    _eventName = snapshotData['event_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('event_star');

  static Stream<EventStarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventStarRecord.fromSnapshot(s));

  static Future<EventStarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventStarRecord.fromSnapshot(s));

  static EventStarRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventStarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventStarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventStarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventStarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventStarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventStarRecordData({
  DocumentReference? event,
  DocumentReference? star,
  DocumentReference? dpt,
  DocumentReference? ministry,
  String? starName,
  String? dptName,
  DateTime? createdAt,
  DocumentReference? createdBy,
  String? comment,
  DocumentReference? group,
  String? groupName,
  bool? groupAffectation,
  DateTime? eventDate,
  String? eventName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event': event,
      'star': star,
      'dpt': dpt,
      'ministry': ministry,
      'star_name': starName,
      'dpt_name': dptName,
      'created_at': createdAt,
      'created_by': createdBy,
      'comment': comment,
      'group': group,
      'group_name': groupName,
      'group_affectation': groupAffectation,
      'event_date': eventDate,
      'event_name': eventName,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventStarRecordDocumentEquality implements Equality<EventStarRecord> {
  const EventStarRecordDocumentEquality();

  @override
  bool equals(EventStarRecord? e1, EventStarRecord? e2) {
    return e1?.event == e2?.event &&
        e1?.star == e2?.star &&
        e1?.dpt == e2?.dpt &&
        e1?.ministry == e2?.ministry &&
        e1?.starName == e2?.starName &&
        e1?.dptName == e2?.dptName &&
        e1?.createdAt == e2?.createdAt &&
        e1?.createdBy == e2?.createdBy &&
        e1?.comment == e2?.comment &&
        e1?.group == e2?.group &&
        e1?.groupName == e2?.groupName &&
        e1?.groupAffectation == e2?.groupAffectation &&
        e1?.eventDate == e2?.eventDate &&
        e1?.eventName == e2?.eventName;
  }

  @override
  int hash(EventStarRecord? e) => const ListEquality().hash([
        e?.event,
        e?.star,
        e?.dpt,
        e?.ministry,
        e?.starName,
        e?.dptName,
        e?.createdAt,
        e?.createdBy,
        e?.comment,
        e?.group,
        e?.groupName,
        e?.groupAffectation,
        e?.eventDate,
        e?.eventName
      ]);

  @override
  bool isValidKey(Object? o) => o is EventStarRecord;
}
