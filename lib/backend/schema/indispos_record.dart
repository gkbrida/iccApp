import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IndisposRecord extends FirestoreRecord {
  IndisposRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "star" field.
  DocumentReference? _star;
  DocumentReference? get star => _star;
  bool hasStar() => _star != null;

  // "dpt" field.
  DocumentReference? _dpt;
  DocumentReference? get dpt => _dpt;
  bool hasDpt() => _dpt != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "nom_dpt" field.
  String? _nomDpt;
  String get nomDpt => _nomDpt ?? '';
  bool hasNomDpt() => _nomDpt != null;

  void _initializeFields() {
    _star = snapshotData['star'] as DocumentReference?;
    _dpt = snapshotData['dpt'] as DocumentReference?;
    _event = snapshotData['event'] as DocumentReference?;
    _nomDpt = snapshotData['nom_dpt'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('indispos');

  static Stream<IndisposRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IndisposRecord.fromSnapshot(s));

  static Future<IndisposRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IndisposRecord.fromSnapshot(s));

  static IndisposRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IndisposRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IndisposRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IndisposRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IndisposRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IndisposRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIndisposRecordData({
  DocumentReference? star,
  DocumentReference? dpt,
  DocumentReference? event,
  String? nomDpt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'star': star,
      'dpt': dpt,
      'event': event,
      'nom_dpt': nomDpt,
    }.withoutNulls,
  );

  return firestoreData;
}

class IndisposRecordDocumentEquality implements Equality<IndisposRecord> {
  const IndisposRecordDocumentEquality();

  @override
  bool equals(IndisposRecord? e1, IndisposRecord? e2) {
    return e1?.star == e2?.star &&
        e1?.dpt == e2?.dpt &&
        e1?.event == e2?.event &&
        e1?.nomDpt == e2?.nomDpt;
  }

  @override
  int hash(IndisposRecord? e) =>
      const ListEquality().hash([e?.star, e?.dpt, e?.event, e?.nomDpt]);

  @override
  bool isValidKey(Object? o) => o is IndisposRecord;
}
