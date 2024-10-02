import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventTasksRecord extends FirestoreRecord {
  EventTasksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "session" field.
  DocumentReference? _session;
  DocumentReference? get session => _session;
  bool hasSession() => _session != null;

  // "outline" field.
  DocumentReference? _outline;
  DocumentReference? get outline => _outline;
  bool hasOutline() => _outline != null;

  // "duree" field.
  int? _duree;
  int get duree => _duree ?? 0;
  bool hasDuree() => _duree != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _session = snapshotData['session'] as DocumentReference?;
    _outline = snapshotData['outline'] as DocumentReference?;
    _duree = castToType<int>(snapshotData['duree']);
    _startDate = snapshotData['start_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('event_tasks');

  static Stream<EventTasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventTasksRecord.fromSnapshot(s));

  static Future<EventTasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventTasksRecord.fromSnapshot(s));

  static EventTasksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventTasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventTasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventTasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventTasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventTasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventTasksRecordData({
  String? description,
  DateTime? createdDate,
  DocumentReference? createdBy,
  DocumentReference? session,
  DocumentReference? outline,
  int? duree,
  DateTime? startDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'created_date': createdDate,
      'created_by': createdBy,
      'session': session,
      'outline': outline,
      'duree': duree,
      'start_date': startDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventTasksRecordDocumentEquality implements Equality<EventTasksRecord> {
  const EventTasksRecordDocumentEquality();

  @override
  bool equals(EventTasksRecord? e1, EventTasksRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.createdDate == e2?.createdDate &&
        e1?.createdBy == e2?.createdBy &&
        e1?.session == e2?.session &&
        e1?.outline == e2?.outline &&
        e1?.duree == e2?.duree &&
        e1?.startDate == e2?.startDate;
  }

  @override
  int hash(EventTasksRecord? e) => const ListEquality().hash([
        e?.description,
        e?.createdDate,
        e?.createdBy,
        e?.session,
        e?.outline,
        e?.duree,
        e?.startDate
      ]);

  @override
  bool isValidKey(Object? o) => o is EventTasksRecord;
}
