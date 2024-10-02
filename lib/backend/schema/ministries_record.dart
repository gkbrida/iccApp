import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MinistriesRecord extends FirestoreRecord {
  MinistriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "minister" field.
  String? _minister;
  String get minister => _minister ?? '';
  bool hasMinister() => _minister != null;

  // "second" field.
  String? _second;
  String get second => _second ?? '';
  bool hasSecond() => _second != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "church" field.
  DocumentReference? _church;
  DocumentReference? get church => _church;
  bool hasChurch() => _church != null;

  // "church_name" field.
  String? _churchName;
  String get churchName => _churchName ?? '';
  bool hasChurchName() => _churchName != null;

  // "ministerID" field.
  DocumentReference? _ministerID;
  DocumentReference? get ministerID => _ministerID;
  bool hasMinisterID() => _ministerID != null;

  // "SecondID" field.
  DocumentReference? _secondID;
  DocumentReference? get secondID => _secondID;
  bool hasSecondID() => _secondID != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "modified_by" field.
  DocumentReference? _modifiedBy;
  DocumentReference? get modifiedBy => _modifiedBy;
  bool hasModifiedBy() => _modifiedBy != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _minister = snapshotData['minister'] as String?;
    _second = snapshotData['second'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _church = snapshotData['church'] as DocumentReference?;
    _churchName = snapshotData['church_name'] as String?;
    _ministerID = snapshotData['ministerID'] as DocumentReference?;
    _secondID = snapshotData['SecondID'] as DocumentReference?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _modifiedBy = snapshotData['modified_by'] as DocumentReference?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ministries');

  static Stream<MinistriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MinistriesRecord.fromSnapshot(s));

  static Future<MinistriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MinistriesRecord.fromSnapshot(s));

  static MinistriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MinistriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MinistriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MinistriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MinistriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MinistriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMinistriesRecordData({
  String? name,
  String? minister,
  String? second,
  DateTime? createDate,
  DocumentReference? church,
  String? churchName,
  DocumentReference? ministerID,
  DocumentReference? secondID,
  DateTime? modifiedAt,
  DocumentReference? modifiedBy,
  DocumentReference? createBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'minister': minister,
      'second': second,
      'create_date': createDate,
      'church': church,
      'church_name': churchName,
      'ministerID': ministerID,
      'SecondID': secondID,
      'modified_at': modifiedAt,
      'modified_by': modifiedBy,
      'create_by': createBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class MinistriesRecordDocumentEquality implements Equality<MinistriesRecord> {
  const MinistriesRecordDocumentEquality();

  @override
  bool equals(MinistriesRecord? e1, MinistriesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.minister == e2?.minister &&
        e1?.second == e2?.second &&
        e1?.createDate == e2?.createDate &&
        e1?.church == e2?.church &&
        e1?.churchName == e2?.churchName &&
        e1?.ministerID == e2?.ministerID &&
        e1?.secondID == e2?.secondID &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.modifiedBy == e2?.modifiedBy &&
        e1?.createBy == e2?.createBy;
  }

  @override
  int hash(MinistriesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.minister,
        e?.second,
        e?.createDate,
        e?.church,
        e?.churchName,
        e?.ministerID,
        e?.secondID,
        e?.modifiedAt,
        e?.modifiedBy,
        e?.createBy
      ]);

  @override
  bool isValidKey(Object? o) => o is MinistriesRecord;
}
