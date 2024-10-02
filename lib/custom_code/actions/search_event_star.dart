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

Future<List<dynamic>> searchEventStar(
    BuildContext context, String searchTerm, DocumentReference event) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('event_star')
      .where('dpt_name', isEqualTo: searchTerm)
      .where('event', isEqualTo: event)
      .get();

  // Convertir les documents en liste de JSON
  List<Map<String, dynamic>> resultList = querySnapshot.docs.map((doc) {
    return doc.data() as Map<String, dynamic>;
  }).toList();

  return Future.value(resultList);
  // Add your function code here!
}
