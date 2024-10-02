import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ApplicationsRecord extends FirestoreRecord {
  ApplicationsRecord._(
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

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  bool hasAdress() => _adress != null;

  // "department" field.
  String? _department;
  String get department => _department ?? '';
  bool hasDepartment() => _department != null;

  // "statut" field.
  String? _statut;
  String get statut => _statut ?? '';
  bool hasStatut() => _statut != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "church" field.
  String? _church;
  String get church => _church ?? '';
  bool hasChurch() => _church != null;

  // "birthdate" field.
  DateTime? _birthdate;
  DateTime? get birthdate => _birthdate;
  bool hasBirthdate() => _birthdate != null;

  // "id" field.
  DocumentReference? _id;
  DocumentReference? get id => _id;
  bool hasId() => _id != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "modified_by" field.
  DocumentReference? _modifiedBy;
  DocumentReference? get modifiedBy => _modifiedBy;
  bool hasModifiedBy() => _modifiedBy != null;

  // "date_naissance" field.
  DateTime? _dateNaissance;
  DateTime? get dateNaissance => _dateNaissance;
  bool hasDateNaissance() => _dateNaissance != null;

  // "statut_matri" field.
  String? _statutMatri;
  String get statutMatri => _statutMatri ?? '';
  bool hasStatutMatri() => _statutMatri != null;

  // "statut_pro" field.
  String? _statutPro;
  String get statutPro => _statutPro ?? '';
  bool hasStatutPro() => _statutPro != null;

  // "skills" field.
  String? _skills;
  String get skills => _skills ?? '';
  bool hasSkills() => _skills != null;

  // "church_ids" field.
  List<DocumentReference>? _churchIds;
  List<DocumentReference> get churchIds => _churchIds ?? const [];
  bool hasChurchIds() => _churchIds != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  void _initializeFields() {
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _phone = snapshotData['phone'] as String?;
    _email = snapshotData['email'] as String?;
    _adress = snapshotData['adress'] as String?;
    _department = snapshotData['department'] as String?;
    _statut = snapshotData['statut'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _church = snapshotData['church'] as String?;
    _birthdate = snapshotData['birthdate'] as DateTime?;
    _id = snapshotData['id'] as DocumentReference?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _modifiedBy = snapshotData['modified_by'] as DocumentReference?;
    _dateNaissance = snapshotData['date_naissance'] as DateTime?;
    _statutMatri = snapshotData['statut_matri'] as String?;
    _statutPro = snapshotData['statut_pro'] as String?;
    _skills = snapshotData['skills'] as String?;
    _churchIds = getDataList(snapshotData['church_ids']);
    _createBy = snapshotData['create_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('applications');

  static Stream<ApplicationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ApplicationsRecord.fromSnapshot(s));

  static Future<ApplicationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ApplicationsRecord.fromSnapshot(s));

  static ApplicationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ApplicationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ApplicationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ApplicationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ApplicationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ApplicationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createApplicationsRecordData({
  String? firstName,
  String? lastName,
  String? phone,
  String? email,
  String? adress,
  String? department,
  String? statut,
  DateTime? createDate,
  String? church,
  DateTime? birthdate,
  DocumentReference? id,
  DateTime? modifiedAt,
  DocumentReference? modifiedBy,
  DateTime? dateNaissance,
  String? statutMatri,
  String? statutPro,
  String? skills,
  DocumentReference? createBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': email,
      'adress': adress,
      'department': department,
      'statut': statut,
      'create_date': createDate,
      'church': church,
      'birthdate': birthdate,
      'id': id,
      'modified_at': modifiedAt,
      'modified_by': modifiedBy,
      'date_naissance': dateNaissance,
      'statut_matri': statutMatri,
      'statut_pro': statutPro,
      'skills': skills,
      'create_by': createBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ApplicationsRecordDocumentEquality
    implements Equality<ApplicationsRecord> {
  const ApplicationsRecordDocumentEquality();

  @override
  bool equals(ApplicationsRecord? e1, ApplicationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.phone == e2?.phone &&
        e1?.email == e2?.email &&
        e1?.adress == e2?.adress &&
        e1?.department == e2?.department &&
        e1?.statut == e2?.statut &&
        e1?.createDate == e2?.createDate &&
        e1?.church == e2?.church &&
        e1?.birthdate == e2?.birthdate &&
        e1?.id == e2?.id &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.modifiedBy == e2?.modifiedBy &&
        e1?.dateNaissance == e2?.dateNaissance &&
        e1?.statutMatri == e2?.statutMatri &&
        e1?.statutPro == e2?.statutPro &&
        e1?.skills == e2?.skills &&
        listEquality.equals(e1?.churchIds, e2?.churchIds) &&
        e1?.createBy == e2?.createBy;
  }

  @override
  int hash(ApplicationsRecord? e) => const ListEquality().hash([
        e?.firstName,
        e?.lastName,
        e?.phone,
        e?.email,
        e?.adress,
        e?.department,
        e?.statut,
        e?.createDate,
        e?.church,
        e?.birthdate,
        e?.id,
        e?.modifiedAt,
        e?.modifiedBy,
        e?.dateNaissance,
        e?.statutMatri,
        e?.statutPro,
        e?.skills,
        e?.churchIds,
        e?.createBy
      ]);

  @override
  bool isValidKey(Object? o) => o is ApplicationsRecord;
}
