import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImpactFamilyRecord extends FirestoreRecord {
  ImpactFamilyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  bool hasAdress() => _adress != null;

  // "pilote" field.
  String? _pilote;
  String get pilote => _pilote ?? '';
  bool hasPilote() => _pilote != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _adress = snapshotData['adress'] as String?;
    _pilote = snapshotData['pilote'] as String?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('impact_family');

  static Stream<ImpactFamilyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImpactFamilyRecord.fromSnapshot(s));

  static Future<ImpactFamilyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImpactFamilyRecord.fromSnapshot(s));

  static ImpactFamilyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ImpactFamilyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImpactFamilyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImpactFamilyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImpactFamilyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImpactFamilyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImpactFamilyRecordData({
  String? name,
  String? adress,
  String? pilote,
  DateTime? createdDate,
  DocumentReference? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'adress': adress,
      'pilote': pilote,
      'created_date': createdDate,
      'created_by': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImpactFamilyRecordDocumentEquality
    implements Equality<ImpactFamilyRecord> {
  const ImpactFamilyRecordDocumentEquality();

  @override
  bool equals(ImpactFamilyRecord? e1, ImpactFamilyRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.adress == e2?.adress &&
        e1?.pilote == e2?.pilote &&
        e1?.createdDate == e2?.createdDate &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(ImpactFamilyRecord? e) => const ListEquality()
      .hash([e?.name, e?.adress, e?.pilote, e?.createdDate, e?.createdBy]);

  @override
  bool isValidKey(Object? o) => o is ImpactFamilyRecord;
}
