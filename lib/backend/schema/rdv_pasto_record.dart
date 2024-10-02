import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RdvPastoRecord extends FirestoreRecord {
  RdvPastoRecord._(
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

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

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
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _phone = snapshotData['phone'] as String?;
    _email = snapshotData['email'] as String?;
    _church = snapshotData['church'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rdv_pasto');

  static Stream<RdvPastoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RdvPastoRecord.fromSnapshot(s));

  static Future<RdvPastoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RdvPastoRecord.fromSnapshot(s));

  static RdvPastoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RdvPastoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RdvPastoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RdvPastoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RdvPastoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RdvPastoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRdvPastoRecordData({
  String? firstName,
  String? lastName,
  String? phone,
  String? email,
  DocumentReference? church,
  String? status,
  DateTime? createDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': email,
      'church': church,
      'status': status,
      'create_date': createDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class RdvPastoRecordDocumentEquality implements Equality<RdvPastoRecord> {
  const RdvPastoRecordDocumentEquality();

  @override
  bool equals(RdvPastoRecord? e1, RdvPastoRecord? e2) {
    return e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.phone == e2?.phone &&
        e1?.email == e2?.email &&
        e1?.church == e2?.church &&
        e1?.status == e2?.status &&
        e1?.createDate == e2?.createDate;
  }

  @override
  int hash(RdvPastoRecord? e) => const ListEquality().hash([
        e?.firstName,
        e?.lastName,
        e?.phone,
        e?.email,
        e?.church,
        e?.status,
        e?.createDate
      ]);

  @override
  bool isValidKey(Object? o) => o is RdvPastoRecord;
}
