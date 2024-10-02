import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompteRenduRecord extends FirestoreRecord {
  CompteRenduRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "obs" field.
  bool? _obs;
  bool get obs => _obs ?? false;
  bool hasObs() => _obs != null;

  // "obsStr" field.
  String? _obsStr;
  String get obsStr => _obsStr ?? '';
  bool hasObsStr() => _obsStr != null;

  // "difficulte" field.
  bool? _difficulte;
  bool get difficulte => _difficulte ?? false;
  bool hasDifficulte() => _difficulte != null;

  // "difcStr" field.
  String? _difcStr;
  String get difcStr => _difcStr ?? '';
  bool hasDifcStr() => _difcStr != null;

  // "ameli" field.
  bool? _ameli;
  bool get ameli => _ameli ?? false;
  bool hasAmeli() => _ameli != null;

  // "amelistr" field.
  String? _amelistr;
  String get amelistr => _amelistr ?? '';
  bool hasAmelistr() => _amelistr != null;

  // "cree_par" field.
  DocumentReference? _creePar;
  DocumentReference? get creePar => _creePar;
  bool hasCreePar() => _creePar != null;

  // "cree_le" field.
  DateTime? _creeLe;
  DateTime? get creeLe => _creeLe;
  bool hasCreeLe() => _creeLe != null;

  // "modif_par" field.
  DocumentReference? _modifPar;
  DocumentReference? get modifPar => _modifPar;
  bool hasModifPar() => _modifPar != null;

  // "modil_le" field.
  DateTime? _modilLe;
  DateTime? get modilLe => _modilLe;
  bool hasModilLe() => _modilLe != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "dpt" field.
  DocumentReference? _dpt;
  DocumentReference? get dpt => _dpt;
  bool hasDpt() => _dpt != null;

  // "nom_dpt" field.
  String? _nomDpt;
  String get nomDpt => _nomDpt ?? '';
  bool hasNomDpt() => _nomDpt != null;

  void _initializeFields() {
    _obs = snapshotData['obs'] as bool?;
    _obsStr = snapshotData['obsStr'] as String?;
    _difficulte = snapshotData['difficulte'] as bool?;
    _difcStr = snapshotData['difcStr'] as String?;
    _ameli = snapshotData['ameli'] as bool?;
    _amelistr = snapshotData['amelistr'] as String?;
    _creePar = snapshotData['cree_par'] as DocumentReference?;
    _creeLe = snapshotData['cree_le'] as DateTime?;
    _modifPar = snapshotData['modif_par'] as DocumentReference?;
    _modilLe = snapshotData['modil_le'] as DateTime?;
    _event = snapshotData['event'] as DocumentReference?;
    _dpt = snapshotData['dpt'] as DocumentReference?;
    _nomDpt = snapshotData['nom_dpt'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('compte_rendu');

  static Stream<CompteRenduRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompteRenduRecord.fromSnapshot(s));

  static Future<CompteRenduRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompteRenduRecord.fromSnapshot(s));

  static CompteRenduRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompteRenduRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompteRenduRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompteRenduRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompteRenduRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompteRenduRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompteRenduRecordData({
  bool? obs,
  String? obsStr,
  bool? difficulte,
  String? difcStr,
  bool? ameli,
  String? amelistr,
  DocumentReference? creePar,
  DateTime? creeLe,
  DocumentReference? modifPar,
  DateTime? modilLe,
  DocumentReference? event,
  DocumentReference? dpt,
  String? nomDpt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'obs': obs,
      'obsStr': obsStr,
      'difficulte': difficulte,
      'difcStr': difcStr,
      'ameli': ameli,
      'amelistr': amelistr,
      'cree_par': creePar,
      'cree_le': creeLe,
      'modif_par': modifPar,
      'modil_le': modilLe,
      'event': event,
      'dpt': dpt,
      'nom_dpt': nomDpt,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompteRenduRecordDocumentEquality implements Equality<CompteRenduRecord> {
  const CompteRenduRecordDocumentEquality();

  @override
  bool equals(CompteRenduRecord? e1, CompteRenduRecord? e2) {
    return e1?.obs == e2?.obs &&
        e1?.obsStr == e2?.obsStr &&
        e1?.difficulte == e2?.difficulte &&
        e1?.difcStr == e2?.difcStr &&
        e1?.ameli == e2?.ameli &&
        e1?.amelistr == e2?.amelistr &&
        e1?.creePar == e2?.creePar &&
        e1?.creeLe == e2?.creeLe &&
        e1?.modifPar == e2?.modifPar &&
        e1?.modilLe == e2?.modilLe &&
        e1?.event == e2?.event &&
        e1?.dpt == e2?.dpt &&
        e1?.nomDpt == e2?.nomDpt;
  }

  @override
  int hash(CompteRenduRecord? e) => const ListEquality().hash([
        e?.obs,
        e?.obsStr,
        e?.difficulte,
        e?.difcStr,
        e?.ameli,
        e?.amelistr,
        e?.creePar,
        e?.creeLe,
        e?.modifPar,
        e?.modilLe,
        e?.event,
        e?.dpt,
        e?.nomDpt
      ]);

  @override
  bool isValidKey(Object? o) => o is CompteRenduRecord;
}
