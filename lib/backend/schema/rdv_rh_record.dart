import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RdvRhRecord extends FirestoreRecord {
  RdvRhRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "star" field.
  DocumentReference? _star;
  DocumentReference? get star => _star;
  bool hasStar() => _star != null;

  // "church" field.
  DocumentReference? _church;
  DocumentReference? get church => _church;
  bool hasChurch() => _church != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  void _initializeFields() {
    _star = snapshotData['star'] as DocumentReference?;
    _church = snapshotData['church'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rdv_rh');

  static Stream<RdvRhRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RdvRhRecord.fromSnapshot(s));

  static Future<RdvRhRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RdvRhRecord.fromSnapshot(s));

  static RdvRhRecord fromSnapshot(DocumentSnapshot snapshot) => RdvRhRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RdvRhRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RdvRhRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RdvRhRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RdvRhRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRdvRhRecordData({
  DocumentReference? star,
  DocumentReference? church,
  String? status,
  DateTime? createDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'star': star,
      'church': church,
      'status': status,
      'create_date': createDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class RdvRhRecordDocumentEquality implements Equality<RdvRhRecord> {
  const RdvRhRecordDocumentEquality();

  @override
  bool equals(RdvRhRecord? e1, RdvRhRecord? e2) {
    return e1?.star == e2?.star &&
        e1?.church == e2?.church &&
        e1?.status == e2?.status &&
        e1?.createDate == e2?.createDate;
  }

  @override
  int hash(RdvRhRecord? e) =>
      const ListEquality().hash([e?.star, e?.church, e?.status, e?.createDate]);

  @override
  bool isValidKey(Object? o) => o is RdvRhRecord;
}
