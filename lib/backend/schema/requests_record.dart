import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestsRecord extends FirestoreRecord {
  RequestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "quotation" field.
  String? _quotation;
  String get quotation => _quotation ?? '';
  bool hasQuotation() => _quotation != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  // "emitter" field.
  DocumentReference? _emitter;
  DocumentReference? get emitter => _emitter;
  bool hasEmitter() => _emitter != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _comment = snapshotData['comment'] as String?;
    _quotation = snapshotData['quotation'] as String?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _emitter = snapshotData['emitter'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('requests');

  static Stream<RequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestsRecord.fromSnapshot(s));

  static Future<RequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestsRecord.fromSnapshot(s));

  static RequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestsRecordData({
  String? title,
  String? comment,
  String? quotation,
  DocumentReference? receiver,
  DocumentReference? emitter,
  String? status,
  DateTime? createDate,
  DocumentReference? createBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'comment': comment,
      'quotation': quotation,
      'receiver': receiver,
      'emitter': emitter,
      'status': status,
      'create_date': createDate,
      'create_by': createBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestsRecordDocumentEquality implements Equality<RequestsRecord> {
  const RequestsRecordDocumentEquality();

  @override
  bool equals(RequestsRecord? e1, RequestsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.comment == e2?.comment &&
        e1?.quotation == e2?.quotation &&
        e1?.receiver == e2?.receiver &&
        e1?.emitter == e2?.emitter &&
        e1?.status == e2?.status &&
        e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy;
  }

  @override
  int hash(RequestsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.comment,
        e?.quotation,
        e?.receiver,
        e?.emitter,
        e?.status,
        e?.createDate,
        e?.createBy
      ]);

  @override
  bool isValidKey(Object? o) => o is RequestsRecord;
}
