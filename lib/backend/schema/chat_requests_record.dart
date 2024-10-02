import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRequestsRecord extends FirestoreRecord {
  ChatRequestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "doc" field.
  String? _doc;
  String get doc => _doc ?? '';
  bool hasDoc() => _doc != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _doc = snapshotData['doc'] as String?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat_requests');

  static Stream<ChatRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRequestsRecord.fromSnapshot(s));

  static Future<ChatRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRequestsRecord.fromSnapshot(s));

  static ChatRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRequestsRecordData({
  String? message,
  String? doc,
  DateTime? createDate,
  DocumentReference? receiver,
  DocumentReference? createBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'doc': doc,
      'create_date': createDate,
      'receiver': receiver,
      'create_by': createBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRequestsRecordDocumentEquality
    implements Equality<ChatRequestsRecord> {
  const ChatRequestsRecordDocumentEquality();

  @override
  bool equals(ChatRequestsRecord? e1, ChatRequestsRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.doc == e2?.doc &&
        e1?.createDate == e2?.createDate &&
        e1?.receiver == e2?.receiver &&
        e1?.createBy == e2?.createBy;
  }

  @override
  int hash(ChatRequestsRecord? e) => const ListEquality()
      .hash([e?.message, e?.doc, e?.createDate, e?.receiver, e?.createBy]);

  @override
  bool isValidKey(Object? o) => o is ChatRequestsRecord;
}
