import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventSessionsRecord extends FirestoreRecord {
  EventSessionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "outline" field.
  DocumentReference? _outline;
  DocumentReference? get outline => _outline;
  bool hasOutline() => _outline != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _event = snapshotData['event'] as DocumentReference?;
    _outline = snapshotData['outline'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('event_sessions');

  static Stream<EventSessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventSessionsRecord.fromSnapshot(s));

  static Future<EventSessionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventSessionsRecord.fromSnapshot(s));

  static EventSessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventSessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventSessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventSessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventSessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventSessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventSessionsRecordData({
  String? name,
  DateTime? createdDate,
  DocumentReference? createdBy,
  DocumentReference? event,
  DocumentReference? outline,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'created_date': createdDate,
      'created_by': createdBy,
      'event': event,
      'outline': outline,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventSessionsRecordDocumentEquality
    implements Equality<EventSessionsRecord> {
  const EventSessionsRecordDocumentEquality();

  @override
  bool equals(EventSessionsRecord? e1, EventSessionsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.createdDate == e2?.createdDate &&
        e1?.createdBy == e2?.createdBy &&
        e1?.event == e2?.event &&
        e1?.outline == e2?.outline;
  }

  @override
  int hash(EventSessionsRecord? e) => const ListEquality()
      .hash([e?.name, e?.createdDate, e?.createdBy, e?.event, e?.outline]);

  @override
  bool isValidKey(Object? o) => o is EventSessionsRecord;
}
