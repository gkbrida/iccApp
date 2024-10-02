import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrackingsRecord extends FirestoreRecord {
  TrackingsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "integration_end" field.
  DateTime? _integrationEnd;
  DateTime? get integrationEnd => _integrationEnd;
  bool hasIntegrationEnd() => _integrationEnd != null;

  // "impact_familly" field.
  String? _impactFamilly;
  String get impactFamilly => _impactFamilly ?? '';
  bool hasImpactFamilly() => _impactFamilly != null;

  // "star" field.
  String? _star;
  String get star => _star ?? '';
  bool hasStar() => _star != null;

  // "baptism" field.
  bool? _baptism;
  bool get baptism => _baptism ?? false;
  bool hasBaptism() => _baptism != null;

  // "baptism_date" field.
  DateTime? _baptismDate;
  DateTime? get baptismDate => _baptismDate;
  bool hasBaptismDate() => _baptismDate != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "newcome" field.
  DocumentReference? _newcome;
  DocumentReference? get newcome => _newcome;
  bool hasNewcome() => _newcome != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "fi_date" field.
  DateTime? _fiDate;
  DateTime? get fiDate => _fiDate;
  bool hasFiDate() => _fiDate != null;

  // "star_date" field.
  DateTime? _starDate;
  DateTime? get starDate => _starDate;
  bool hasStarDate() => _starDate != null;

  // "last_modif" field.
  DateTime? _lastModif;
  DateTime? get lastModif => _lastModif;
  bool hasLastModif() => _lastModif != null;

  // "integratioin" field.
  bool? _integratioin;
  bool get integratioin => _integratioin ?? false;
  bool hasIntegratioin() => _integratioin != null;

  // "has_fi" field.
  bool? _hasFi;
  bool get hasFi => _hasFi ?? false;
  bool hasHasFi() => _hasFi != null;

  // "his_star" field.
  bool? _hisStar;
  bool get hisStar => _hisStar ?? false;
  bool hasHisStar() => _hisStar != null;

  void _initializeFields() {
    _integrationEnd = snapshotData['integration_end'] as DateTime?;
    _impactFamilly = snapshotData['impact_familly'] as String?;
    _star = snapshotData['star'] as String?;
    _baptism = snapshotData['baptism'] as bool?;
    _baptismDate = snapshotData['baptism_date'] as DateTime?;
    _comments = snapshotData['comments'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _newcome = snapshotData['newcome'] as DocumentReference?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _fiDate = snapshotData['fi_date'] as DateTime?;
    _starDate = snapshotData['star_date'] as DateTime?;
    _lastModif = snapshotData['last_modif'] as DateTime?;
    _integratioin = snapshotData['integratioin'] as bool?;
    _hasFi = snapshotData['has_fi'] as bool?;
    _hisStar = snapshotData['his_star'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trackings');

  static Stream<TrackingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TrackingsRecord.fromSnapshot(s));

  static Future<TrackingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TrackingsRecord.fromSnapshot(s));

  static TrackingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TrackingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TrackingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TrackingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TrackingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TrackingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTrackingsRecordData({
  DateTime? integrationEnd,
  String? impactFamilly,
  String? star,
  bool? baptism,
  DateTime? baptismDate,
  String? comments,
  DateTime? createDate,
  DocumentReference? newcome,
  DocumentReference? createBy,
  DateTime? fiDate,
  DateTime? starDate,
  DateTime? lastModif,
  bool? integratioin,
  bool? hasFi,
  bool? hisStar,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'integration_end': integrationEnd,
      'impact_familly': impactFamilly,
      'star': star,
      'baptism': baptism,
      'baptism_date': baptismDate,
      'comments': comments,
      'create_date': createDate,
      'newcome': newcome,
      'create_by': createBy,
      'fi_date': fiDate,
      'star_date': starDate,
      'last_modif': lastModif,
      'integratioin': integratioin,
      'has_fi': hasFi,
      'his_star': hisStar,
    }.withoutNulls,
  );

  return firestoreData;
}

class TrackingsRecordDocumentEquality implements Equality<TrackingsRecord> {
  const TrackingsRecordDocumentEquality();

  @override
  bool equals(TrackingsRecord? e1, TrackingsRecord? e2) {
    return e1?.integrationEnd == e2?.integrationEnd &&
        e1?.impactFamilly == e2?.impactFamilly &&
        e1?.star == e2?.star &&
        e1?.baptism == e2?.baptism &&
        e1?.baptismDate == e2?.baptismDate &&
        e1?.comments == e2?.comments &&
        e1?.createDate == e2?.createDate &&
        e1?.newcome == e2?.newcome &&
        e1?.createBy == e2?.createBy &&
        e1?.fiDate == e2?.fiDate &&
        e1?.starDate == e2?.starDate &&
        e1?.lastModif == e2?.lastModif &&
        e1?.integratioin == e2?.integratioin &&
        e1?.hasFi == e2?.hasFi &&
        e1?.hisStar == e2?.hisStar;
  }

  @override
  int hash(TrackingsRecord? e) => const ListEquality().hash([
        e?.integrationEnd,
        e?.impactFamilly,
        e?.star,
        e?.baptism,
        e?.baptismDate,
        e?.comments,
        e?.createDate,
        e?.newcome,
        e?.createBy,
        e?.fiDate,
        e?.starDate,
        e?.lastModif,
        e?.integratioin,
        e?.hasFi,
        e?.hisStar
      ]);

  @override
  bool isValidKey(Object? o) => o is TrackingsRecord;
}
