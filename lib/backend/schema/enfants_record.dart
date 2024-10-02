import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnfantsRecord extends FirestoreRecord {
  EnfantsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "prenom" field.
  String? _prenom;
  String get prenom => _prenom ?? '';
  bool hasPrenom() => _prenom != null;

  // "date_naissance" field.
  DateTime? _dateNaissance;
  DateTime? get dateNaissance => _dateNaissance;
  bool hasDateNaissance() => _dateNaissance != null;

  // "nom_prenom_parent" field.
  String? _nomPrenomParent;
  String get nomPrenomParent => _nomPrenomParent ?? '';
  bool hasNomPrenomParent() => _nomPrenomParent != null;

  // "phone_parent" field.
  String? _phoneParent;
  String get phoneParent => _phoneParent ?? '';
  bool hasPhoneParent() => _phoneParent != null;

  // "email_parent" field.
  String? _emailParent;
  String get emailParent => _emailParent ?? '';
  bool hasEmailParent() => _emailParent != null;

  // "adresse" field.
  String? _adresse;
  String get adresse => _adresse ?? '';
  bool hasAdresse() => _adresse != null;

  // "cree_le" field.
  DateTime? _creeLe;
  DateTime? get creeLe => _creeLe;
  bool hasCreeLe() => _creeLe != null;

  // "commentaires" field.
  String? _commentaires;
  String get commentaires => _commentaires ?? '';
  bool hasCommentaires() => _commentaires != null;

  // "modifie_le" field.
  DateTime? _modifieLe;
  DateTime? get modifieLe => _modifieLe;
  bool hasModifieLe() => _modifieLe != null;

  // "modifie_par" field.
  DocumentReference? _modifiePar;
  DocumentReference? get modifiePar => _modifiePar;
  bool hasModifiePar() => _modifiePar != null;

  // "cree_par" field.
  DocumentReference? _creePar;
  DocumentReference? get creePar => _creePar;
  bool hasCreePar() => _creePar != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _prenom = snapshotData['prenom'] as String?;
    _dateNaissance = snapshotData['date_naissance'] as DateTime?;
    _nomPrenomParent = snapshotData['nom_prenom_parent'] as String?;
    _phoneParent = snapshotData['phone_parent'] as String?;
    _emailParent = snapshotData['email_parent'] as String?;
    _adresse = snapshotData['adresse'] as String?;
    _creeLe = snapshotData['cree_le'] as DateTime?;
    _commentaires = snapshotData['commentaires'] as String?;
    _modifieLe = snapshotData['modifie_le'] as DateTime?;
    _modifiePar = snapshotData['modifie_par'] as DocumentReference?;
    _creePar = snapshotData['cree_par'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('enfants');

  static Stream<EnfantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EnfantsRecord.fromSnapshot(s));

  static Future<EnfantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EnfantsRecord.fromSnapshot(s));

  static EnfantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EnfantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EnfantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EnfantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EnfantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EnfantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEnfantsRecordData({
  String? nom,
  String? prenom,
  DateTime? dateNaissance,
  String? nomPrenomParent,
  String? phoneParent,
  String? emailParent,
  String? adresse,
  DateTime? creeLe,
  String? commentaires,
  DateTime? modifieLe,
  DocumentReference? modifiePar,
  DocumentReference? creePar,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'prenom': prenom,
      'date_naissance': dateNaissance,
      'nom_prenom_parent': nomPrenomParent,
      'phone_parent': phoneParent,
      'email_parent': emailParent,
      'adresse': adresse,
      'cree_le': creeLe,
      'commentaires': commentaires,
      'modifie_le': modifieLe,
      'modifie_par': modifiePar,
      'cree_par': creePar,
    }.withoutNulls,
  );

  return firestoreData;
}

class EnfantsRecordDocumentEquality implements Equality<EnfantsRecord> {
  const EnfantsRecordDocumentEquality();

  @override
  bool equals(EnfantsRecord? e1, EnfantsRecord? e2) {
    return e1?.nom == e2?.nom &&
        e1?.prenom == e2?.prenom &&
        e1?.dateNaissance == e2?.dateNaissance &&
        e1?.nomPrenomParent == e2?.nomPrenomParent &&
        e1?.phoneParent == e2?.phoneParent &&
        e1?.emailParent == e2?.emailParent &&
        e1?.adresse == e2?.adresse &&
        e1?.creeLe == e2?.creeLe &&
        e1?.commentaires == e2?.commentaires &&
        e1?.modifieLe == e2?.modifieLe &&
        e1?.modifiePar == e2?.modifiePar &&
        e1?.creePar == e2?.creePar;
  }

  @override
  int hash(EnfantsRecord? e) => const ListEquality().hash([
        e?.nom,
        e?.prenom,
        e?.dateNaissance,
        e?.nomPrenomParent,
        e?.phoneParent,
        e?.emailParent,
        e?.adresse,
        e?.creeLe,
        e?.commentaires,
        e?.modifieLe,
        e?.modifiePar,
        e?.creePar
      ]);

  @override
  bool isValidKey(Object? o) => o is EnfantsRecord;
}
