import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewcomersRecord extends FirestoreRecord {
  NewcomersRecord._(
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

  // "age_group" field.
  String? _ageGroup;
  String get ageGroup => _ageGroup ?? '';
  bool hasAgeGroup() => _ageGroup != null;

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

  // "visit_reason" field.
  String? _visitReason;
  String get visitReason => _visitReason ?? '';
  bool hasVisitReason() => _visitReason != null;

  // "salvation_pray" field.
  bool? _salvationPray;
  bool get salvationPray => _salvationPray ?? false;
  bool hasSalvationPray() => _salvationPray != null;

  // "nc_na" field.
  String? _ncNa;
  String get ncNa => _ncNa ?? '';
  bool hasNcNa() => _ncNa != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "visit" field.
  bool? _visit;
  bool get visit => _visit ?? false;
  bool hasVisit() => _visit != null;

  // "affect" field.
  bool? _affect;
  bool get affect => _affect ?? false;
  bool hasAffect() => _affect != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  bool hasCreatedAt() => _createdAt != null;

  // "group" field.
  DocumentReference? _group;
  DocumentReference? get group => _group;
  bool hasGroup() => _group != null;

  // "advisor" field.
  DocumentReference? _advisor;
  DocumentReference? get advisor => _advisor;
  bool hasAdvisor() => _advisor != null;

  // "last_modify" field.
  DateTime? _lastModify;
  DateTime? get lastModify => _lastModify;
  bool hasLastModify() => _lastModify != null;

  // "last_editor" field.
  DocumentReference? _lastEditor;
  DocumentReference? get lastEditor => _lastEditor;
  bool hasLastEditor() => _lastEditor != null;

  // "churchID" field.
  DocumentReference? _churchID;
  DocumentReference? get churchID => _churchID;
  bool hasChurchID() => _churchID != null;

  // "commentaire" field.
  String? _commentaire;
  String get commentaire => _commentaire ?? '';
  bool hasCommentaire() => _commentaire != null;

  // "recuAu" field.
  DocumentReference? _recuAu;
  DocumentReference? get recuAu => _recuAu;
  bool hasRecuAu() => _recuAu != null;

  // "eventDate" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  bool hasEventDate() => _eventDate != null;

  // "recuAuName" field.
  String? _recuAuName;
  String get recuAuName => _recuAuName ?? '';
  bool hasRecuAuName() => _recuAuName != null;

  void _initializeFields() {
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _ageGroup = snapshotData['age_group'] as String?;
    _phone = snapshotData['phone'] as String?;
    _email = snapshotData['email'] as String?;
    _adress = snapshotData['adress'] as String?;
    _visitReason = snapshotData['visit_reason'] as String?;
    _salvationPray = snapshotData['salvation_pray'] as bool?;
    _ncNa = snapshotData['nc_na'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _visit = snapshotData['visit'] as bool?;
    _affect = snapshotData['affect'] as bool?;
    _createdAt = snapshotData['created_at'] as String?;
    _group = snapshotData['group'] as DocumentReference?;
    _advisor = snapshotData['advisor'] as DocumentReference?;
    _lastModify = snapshotData['last_modify'] as DateTime?;
    _lastEditor = snapshotData['last_editor'] as DocumentReference?;
    _churchID = snapshotData['churchID'] as DocumentReference?;
    _commentaire = snapshotData['commentaire'] as String?;
    _recuAu = snapshotData['recuAu'] as DocumentReference?;
    _eventDate = snapshotData['eventDate'] as DateTime?;
    _recuAuName = snapshotData['recuAuName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('newcomers');

  static Stream<NewcomersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewcomersRecord.fromSnapshot(s));

  static Future<NewcomersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewcomersRecord.fromSnapshot(s));

  static NewcomersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NewcomersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewcomersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewcomersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewcomersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewcomersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewcomersRecordData({
  String? firstName,
  String? lastName,
  String? ageGroup,
  String? phone,
  String? email,
  String? adress,
  String? visitReason,
  bool? salvationPray,
  String? ncNa,
  DateTime? createDate,
  DocumentReference? createBy,
  bool? visit,
  bool? affect,
  String? createdAt,
  DocumentReference? group,
  DocumentReference? advisor,
  DateTime? lastModify,
  DocumentReference? lastEditor,
  DocumentReference? churchID,
  String? commentaire,
  DocumentReference? recuAu,
  DateTime? eventDate,
  String? recuAuName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'age_group': ageGroup,
      'phone': phone,
      'email': email,
      'adress': adress,
      'visit_reason': visitReason,
      'salvation_pray': salvationPray,
      'nc_na': ncNa,
      'create_date': createDate,
      'create_by': createBy,
      'visit': visit,
      'affect': affect,
      'created_at': createdAt,
      'group': group,
      'advisor': advisor,
      'last_modify': lastModify,
      'last_editor': lastEditor,
      'churchID': churchID,
      'commentaire': commentaire,
      'recuAu': recuAu,
      'eventDate': eventDate,
      'recuAuName': recuAuName,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewcomersRecordDocumentEquality implements Equality<NewcomersRecord> {
  const NewcomersRecordDocumentEquality();

  @override
  bool equals(NewcomersRecord? e1, NewcomersRecord? e2) {
    return e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.ageGroup == e2?.ageGroup &&
        e1?.phone == e2?.phone &&
        e1?.email == e2?.email &&
        e1?.adress == e2?.adress &&
        e1?.visitReason == e2?.visitReason &&
        e1?.salvationPray == e2?.salvationPray &&
        e1?.ncNa == e2?.ncNa &&
        e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.visit == e2?.visit &&
        e1?.affect == e2?.affect &&
        e1?.createdAt == e2?.createdAt &&
        e1?.group == e2?.group &&
        e1?.advisor == e2?.advisor &&
        e1?.lastModify == e2?.lastModify &&
        e1?.lastEditor == e2?.lastEditor &&
        e1?.churchID == e2?.churchID &&
        e1?.commentaire == e2?.commentaire &&
        e1?.recuAu == e2?.recuAu &&
        e1?.eventDate == e2?.eventDate &&
        e1?.recuAuName == e2?.recuAuName;
  }

  @override
  int hash(NewcomersRecord? e) => const ListEquality().hash([
        e?.firstName,
        e?.lastName,
        e?.ageGroup,
        e?.phone,
        e?.email,
        e?.adress,
        e?.visitReason,
        e?.salvationPray,
        e?.ncNa,
        e?.createDate,
        e?.createBy,
        e?.visit,
        e?.affect,
        e?.createdAt,
        e?.group,
        e?.advisor,
        e?.lastModify,
        e?.lastEditor,
        e?.churchID,
        e?.commentaire,
        e?.recuAu,
        e?.eventDate,
        e?.recuAuName
      ]);

  @override
  bool isValidKey(Object? o) => o is NewcomersRecord;
}
