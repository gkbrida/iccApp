import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MembershipsRecord extends FirestoreRecord {
  MembershipsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "star" field.
  DocumentReference? _star;
  DocumentReference? get star => _star;
  bool hasStar() => _star != null;

  // "church" field.
  DocumentReference? _church;
  DocumentReference? get church => _church;
  bool hasChurch() => _church != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _star = snapshotData['star'] as DocumentReference?;
    _church = snapshotData['church'] as DocumentReference?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('memberships');

  static Stream<MembershipsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MembershipsRecord.fromSnapshot(s));

  static Future<MembershipsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MembershipsRecord.fromSnapshot(s));

  static MembershipsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MembershipsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MembershipsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MembershipsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MembershipsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MembershipsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMembershipsRecordData({
  DateTime? createDate,
  DocumentReference? star,
  DocumentReference? church,
  DocumentReference? createBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'star': star,
      'church': church,
      'create_by': createBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class MembershipsRecordDocumentEquality implements Equality<MembershipsRecord> {
  const MembershipsRecordDocumentEquality();

  @override
  bool equals(MembershipsRecord? e1, MembershipsRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.star == e2?.star &&
        e1?.church == e2?.church &&
        e1?.createBy == e2?.createBy;
  }

  @override
  int hash(MembershipsRecord? e) => const ListEquality()
      .hash([e?.createDate, e?.star, e?.church, e?.createBy]);

  @override
  bool isValidKey(Object? o) => o is MembershipsRecord;
}
