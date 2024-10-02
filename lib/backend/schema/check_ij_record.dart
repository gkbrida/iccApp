import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckIjRecord extends FirestoreRecord {
  CheckIjRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "recup" field.
  bool? _recup;
  bool get recup => _recup ?? false;
  bool hasRecup() => _recup != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "child" field.
  DocumentReference? _child;
  DocumentReference? get child => _child;
  bool hasChild() => _child != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _recup = snapshotData['recup'] as bool?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _child = snapshotData['child'] as DocumentReference?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('check-ij');

  static Stream<CheckIjRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CheckIjRecord.fromSnapshot(s));

  static Future<CheckIjRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CheckIjRecord.fromSnapshot(s));

  static CheckIjRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CheckIjRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CheckIjRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CheckIjRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CheckIjRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CheckIjRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCheckIjRecordData({
  String? name,
  DateTime? date,
  bool? recup,
  DateTime? createDate,
  DocumentReference? child,
  DocumentReference? createBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'date': date,
      'recup': recup,
      'create_date': createDate,
      'child': child,
      'create_by': createBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class CheckIjRecordDocumentEquality implements Equality<CheckIjRecord> {
  const CheckIjRecordDocumentEquality();

  @override
  bool equals(CheckIjRecord? e1, CheckIjRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.date == e2?.date &&
        e1?.recup == e2?.recup &&
        e1?.createDate == e2?.createDate &&
        e1?.child == e2?.child &&
        e1?.createBy == e2?.createBy;
  }

  @override
  int hash(CheckIjRecord? e) => const ListEquality()
      .hash([e?.name, e?.date, e?.recup, e?.createDate, e?.child, e?.createBy]);

  @override
  bool isValidKey(Object? o) => o is CheckIjRecord;
}
