import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChildrenIjRecord extends FirestoreRecord {
  ChildrenIjRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "birth_date" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  bool hasBirthDate() => _birthDate != null;

  // "legaltutor" field.
  String? _legaltutor;
  String get legaltutor => _legaltutor ?? '';
  bool hasLegaltutor() => _legaltutor != null;

  // "phonetutor" field.
  String? _phonetutor;
  String get phonetutor => _phonetutor ?? '';
  bool hasPhonetutor() => _phonetutor != null;

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
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _birthDate = snapshotData['birth_date'] as DateTime?;
    _legaltutor = snapshotData['legaltutor'] as String?;
    _phonetutor = snapshotData['phonetutor'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _child = snapshotData['child'] as DocumentReference?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('children-ij');

  static Stream<ChildrenIjRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChildrenIjRecord.fromSnapshot(s));

  static Future<ChildrenIjRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChildrenIjRecord.fromSnapshot(s));

  static ChildrenIjRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChildrenIjRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChildrenIjRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChildrenIjRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChildrenIjRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChildrenIjRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChildrenIjRecordData({
  String? firstName,
  String? lastName,
  DateTime? birthDate,
  String? legaltutor,
  String? phonetutor,
  DateTime? createDate,
  DocumentReference? child,
  DocumentReference? createBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'birth_date': birthDate,
      'legaltutor': legaltutor,
      'phonetutor': phonetutor,
      'create_date': createDate,
      'child': child,
      'create_by': createBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChildrenIjRecordDocumentEquality implements Equality<ChildrenIjRecord> {
  const ChildrenIjRecordDocumentEquality();

  @override
  bool equals(ChildrenIjRecord? e1, ChildrenIjRecord? e2) {
    return e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.birthDate == e2?.birthDate &&
        e1?.legaltutor == e2?.legaltutor &&
        e1?.phonetutor == e2?.phonetutor &&
        e1?.createDate == e2?.createDate &&
        e1?.child == e2?.child &&
        e1?.createBy == e2?.createBy;
  }

  @override
  int hash(ChildrenIjRecord? e) => const ListEquality().hash([
        e?.firstName,
        e?.lastName,
        e?.birthDate,
        e?.legaltutor,
        e?.phonetutor,
        e?.createDate,
        e?.child,
        e?.createBy
      ]);

  @override
  bool isValidKey(Object? o) => o is ChildrenIjRecord;
}
