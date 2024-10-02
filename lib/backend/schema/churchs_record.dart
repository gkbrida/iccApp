import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChurchsRecord extends FirestoreRecord {
  ChurchsRecord._(
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

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "titular_pastor" field.
  DocumentReference? _titularPastor;
  DocumentReference? get titularPastor => _titularPastor;
  bool hasTitularPastor() => _titularPastor != null;

  // "titular_name" field.
  String? _titularName;
  String get titularName => _titularName ?? '';
  bool hasTitularName() => _titularName != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _adress = snapshotData['adress'] as String?;
    _email = snapshotData['email'] as String?;
    _phone = snapshotData['phone'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _titularPastor = snapshotData['titular_pastor'] as DocumentReference?;
    _titularName = snapshotData['titular_name'] as String?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('churchs');

  static Stream<ChurchsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChurchsRecord.fromSnapshot(s));

  static Future<ChurchsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChurchsRecord.fromSnapshot(s));

  static ChurchsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChurchsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChurchsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChurchsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChurchsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChurchsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChurchsRecordData({
  String? name,
  String? adress,
  String? email,
  String? phone,
  DateTime? createDate,
  DocumentReference? titularPastor,
  String? titularName,
  DocumentReference? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'adress': adress,
      'email': email,
      'phone': phone,
      'create_date': createDate,
      'titular_pastor': titularPastor,
      'titular_name': titularName,
      'created_by': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChurchsRecordDocumentEquality implements Equality<ChurchsRecord> {
  const ChurchsRecordDocumentEquality();

  @override
  bool equals(ChurchsRecord? e1, ChurchsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.adress == e2?.adress &&
        e1?.email == e2?.email &&
        e1?.phone == e2?.phone &&
        e1?.createDate == e2?.createDate &&
        e1?.titularPastor == e2?.titularPastor &&
        e1?.titularName == e2?.titularName &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(ChurchsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.adress,
        e?.email,
        e?.phone,
        e?.createDate,
        e?.titularPastor,
        e?.titularName,
        e?.createdBy
      ]);

  @override
  bool isValidKey(Object? o) => o is ChurchsRecord;
}
