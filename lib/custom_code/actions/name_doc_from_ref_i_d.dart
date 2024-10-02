// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<String?> nameDocFromRefID(
  BuildContext context,
  String documentID,
) async {
  DocumentSnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection('departments')
      .doc(documentID)
      .get();

  return Future.value(querySnapshot["name"]);
  // Add your function code here!
}
