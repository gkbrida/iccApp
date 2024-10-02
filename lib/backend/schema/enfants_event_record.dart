import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnfantsEventRecord extends FirestoreRecord {
  EnfantsEventRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "enfant" field.
  DocumentReference? _enfant;
  DocumentReference? get enfant => _enfant;
  bool hasEnfant() => _enfant != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "cree_par" field.
  DocumentReference? _creePar;
  DocumentReference? get creePar => _creePar;
  bool hasCreePar() => _creePar != null;

  // "nom_event" field.
  String? _nomEvent;
  String get nomEvent => _nomEvent ?? '';
  bool hasNomEvent() => _nomEvent != null;

  // "nom_enfant" field.
  String? _nomEnfant;
  String get nomEnfant => _nomEnfant ?? '';
  bool hasNomEnfant() => _nomEnfant != null;

  // "date_naissance" field.
  DateTime? _dateNaissance;
  DateTime? get dateNaissance => _dateNaissance;
  bool hasDateNaissance() => _dateNaissance != null;

  // "statut" field.
  bool? _statut;
  bool get statut => _statut ?? false;
  bool hasStatut() => _statut != null;

  // "sorti_par" field.
  DocumentReference? _sortiPar;
  DocumentReference? get sortiPar => _sortiPar;
  bool hasSortiPar() => _sortiPar != null;

  // "sorti_le" field.
  DateTime? _sortiLe;
  DateTime? get sortiLe => _sortiLe;
  bool hasSortiLe() => _sortiLe != null;

  // "deja" field.
  bool? _deja;
  bool get deja => _deja ?? false;
  bool hasDeja() => _deja != null;

  void _initializeFields() {
    _enfant = snapshotData['enfant'] as DocumentReference?;
    _event = snapshotData['event'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _creePar = snapshotData['cree_par'] as DocumentReference?;
    _nomEvent = snapshotData['nom_event'] as String?;
    _nomEnfant = snapshotData['nom_enfant'] as String?;
    _dateNaissance = snapshotData['date_naissance'] as DateTime?;
    _statut = snapshotData['statut'] as bool?;
    _sortiPar = snapshotData['sorti_par'] as DocumentReference?;
    _sortiLe = snapshotData['sorti_le'] as DateTime?;
    _deja = snapshotData['deja'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('enfants_event');

  static Stream<EnfantsEventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EnfantsEventRecord.fromSnapshot(s));

  static Future<EnfantsEventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EnfantsEventRecord.fromSnapshot(s));

  static EnfantsEventRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EnfantsEventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EnfantsEventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EnfantsEventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EnfantsEventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EnfantsEventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEnfantsEventRecordData({
  DocumentReference? enfant,
  DocumentReference? event,
  DateTime? date,
  DocumentReference? creePar,
  String? nomEvent,
  String? nomEnfant,
  DateTime? dateNaissance,
  bool? statut,
  DocumentReference? sortiPar,
  DateTime? sortiLe,
  bool? deja,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'enfant': enfant,
      'event': event,
      'date': date,
      'cree_par': creePar,
      'nom_event': nomEvent,
      'nom_enfant': nomEnfant,
      'date_naissance': dateNaissance,
      'statut': statut,
      'sorti_par': sortiPar,
      'sorti_le': sortiLe,
      'deja': deja,
    }.withoutNulls,
  );

  return firestoreData;
}

class EnfantsEventRecordDocumentEquality
    implements Equality<EnfantsEventRecord> {
  const EnfantsEventRecordDocumentEquality();

  @override
  bool equals(EnfantsEventRecord? e1, EnfantsEventRecord? e2) {
    return e1?.enfant == e2?.enfant &&
        e1?.event == e2?.event &&
        e1?.date == e2?.date &&
        e1?.creePar == e2?.creePar &&
        e1?.nomEvent == e2?.nomEvent &&
        e1?.nomEnfant == e2?.nomEnfant &&
        e1?.dateNaissance == e2?.dateNaissance &&
        e1?.statut == e2?.statut &&
        e1?.sortiPar == e2?.sortiPar &&
        e1?.sortiLe == e2?.sortiLe &&
        e1?.deja == e2?.deja;
  }

  @override
  int hash(EnfantsEventRecord? e) => const ListEquality().hash([
        e?.enfant,
        e?.event,
        e?.date,
        e?.creePar,
        e?.nomEvent,
        e?.nomEnfant,
        e?.dateNaissance,
        e?.statut,
        e?.sortiPar,
        e?.sortiLe,
        e?.deja
      ]);

  @override
  bool isValidKey(Object? o) => o is EnfantsEventRecord;
}
