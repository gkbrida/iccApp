import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccueilRecord extends FirestoreRecord {
  AccueilRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nbHomme" field.
  int? _nbHomme;
  int get nbHomme => _nbHomme ?? 0;
  bool hasNbHomme() => _nbHomme != null;

  // "nbFemme" field.
  int? _nbFemme;
  int get nbFemme => _nbFemme ?? 0;
  bool hasNbFemme() => _nbFemme != null;

  // "nbEnfant" field.
  int? _nbEnfant;
  int get nbEnfant => _nbEnfant ?? 0;
  bool hasNbEnfant() => _nbEnfant != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "cree_par" field.
  DocumentReference? _creePar;
  DocumentReference? get creePar => _creePar;
  bool hasCreePar() => _creePar != null;

  // "cree_le" field.
  DateTime? _creeLe;
  DateTime? get creeLe => _creeLe;
  bool hasCreeLe() => _creeLe != null;

  // "modifie_par" field.
  DocumentReference? _modifiePar;
  DocumentReference? get modifiePar => _modifiePar;
  bool hasModifiePar() => _modifiePar != null;

  // "modifie_le" field.
  DateTime? _modifieLe;
  DateTime? get modifieLe => _modifieLe;
  bool hasModifieLe() => _modifieLe != null;

  // "eventDate" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  bool hasEventDate() => _eventDate != null;

  void _initializeFields() {
    _nbHomme = castToType<int>(snapshotData['nbHomme']);
    _nbFemme = castToType<int>(snapshotData['nbFemme']);
    _nbEnfant = castToType<int>(snapshotData['nbEnfant']);
    _event = snapshotData['event'] as DocumentReference?;
    _creePar = snapshotData['cree_par'] as DocumentReference?;
    _creeLe = snapshotData['cree_le'] as DateTime?;
    _modifiePar = snapshotData['modifie_par'] as DocumentReference?;
    _modifieLe = snapshotData['modifie_le'] as DateTime?;
    _eventDate = snapshotData['eventDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('accueil');

  static Stream<AccueilRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AccueilRecord.fromSnapshot(s));

  static Future<AccueilRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AccueilRecord.fromSnapshot(s));

  static AccueilRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AccueilRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AccueilRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AccueilRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AccueilRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AccueilRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAccueilRecordData({
  int? nbHomme,
  int? nbFemme,
  int? nbEnfant,
  DocumentReference? event,
  DocumentReference? creePar,
  DateTime? creeLe,
  DocumentReference? modifiePar,
  DateTime? modifieLe,
  DateTime? eventDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nbHomme': nbHomme,
      'nbFemme': nbFemme,
      'nbEnfant': nbEnfant,
      'event': event,
      'cree_par': creePar,
      'cree_le': creeLe,
      'modifie_par': modifiePar,
      'modifie_le': modifieLe,
      'eventDate': eventDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class AccueilRecordDocumentEquality implements Equality<AccueilRecord> {
  const AccueilRecordDocumentEquality();

  @override
  bool equals(AccueilRecord? e1, AccueilRecord? e2) {
    return e1?.nbHomme == e2?.nbHomme &&
        e1?.nbFemme == e2?.nbFemme &&
        e1?.nbEnfant == e2?.nbEnfant &&
        e1?.event == e2?.event &&
        e1?.creePar == e2?.creePar &&
        e1?.creeLe == e2?.creeLe &&
        e1?.modifiePar == e2?.modifiePar &&
        e1?.modifieLe == e2?.modifieLe &&
        e1?.eventDate == e2?.eventDate;
  }

  @override
  int hash(AccueilRecord? e) => const ListEquality().hash([
        e?.nbHomme,
        e?.nbFemme,
        e?.nbEnfant,
        e?.event,
        e?.creePar,
        e?.creeLe,
        e?.modifiePar,
        e?.modifieLe,
        e?.eventDate
      ]);

  @override
  bool isValidKey(Object? o) => o is AccueilRecord;
}
