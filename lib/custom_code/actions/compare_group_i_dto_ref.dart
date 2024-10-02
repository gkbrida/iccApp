// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future<DocumentReference?> compareGroupIDtoRef(
  String documentID,
  List<DocumentReference> applicationReferences,
) async {
  Map<String, DocumentReference> referenceMap = {
    for (var ref in applicationReferences) ref.id: ref
  };

  // Use the map for O(1) lookup
  return Future.value(referenceMap[documentID]);
}
