import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InteractionsRecord extends FirestoreRecord {
  InteractionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "cantact_date" field.
  DateTime? _cantactDate;
  DateTime? get cantactDate => _cantactDate;
  bool hasCantactDate() => _cantactDate != null;

  // "contact_type" field.
  String? _contactType;
  String get contactType => _contactType ?? '';
  bool hasContactType() => _contactType != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "newcome" field.
  DocumentReference? _newcome;
  DocumentReference? get newcome => _newcome;
  bool hasNewcome() => _newcome != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  void _initializeFields() {
    _cantactDate = snapshotData['cantact_date'] as DateTime?;
    _contactType = snapshotData['contact_type'] as String?;
    _comments = snapshotData['comments'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _newcome = snapshotData['newcome'] as DocumentReference?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('interactions');

  static Stream<InteractionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InteractionsRecord.fromSnapshot(s));

  static Future<InteractionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InteractionsRecord.fromSnapshot(s));

  static InteractionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InteractionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InteractionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InteractionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InteractionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InteractionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInteractionsRecordData({
  DateTime? cantactDate,
  String? contactType,
  String? comments,
  DateTime? createDate,
  DocumentReference? newcome,
  DocumentReference? createBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cantact_date': cantactDate,
      'contact_type': contactType,
      'comments': comments,
      'create_date': createDate,
      'newcome': newcome,
      'create_by': createBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class InteractionsRecordDocumentEquality
    implements Equality<InteractionsRecord> {
  const InteractionsRecordDocumentEquality();

  @override
  bool equals(InteractionsRecord? e1, InteractionsRecord? e2) {
    return e1?.cantactDate == e2?.cantactDate &&
        e1?.contactType == e2?.contactType &&
        e1?.comments == e2?.comments &&
        e1?.createDate == e2?.createDate &&
        e1?.newcome == e2?.newcome &&
        e1?.createBy == e2?.createBy;
  }

  @override
  int hash(InteractionsRecord? e) => const ListEquality().hash([
        e?.cantactDate,
        e?.contactType,
        e?.comments,
        e?.createDate,
        e?.newcome,
        e?.createBy
      ]);

  @override
  bool isValidKey(Object? o) => o is InteractionsRecord;
}
