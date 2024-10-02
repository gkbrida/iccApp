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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future<String> getDistinctNaNCValues(
  BuildContext context,
) async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('newcomers').get();

  // Initialiser un Map pour stocker les comptages
  //Map<String, int> counts = {};
  String naNc = "f";
  // Parcourir les documents et compter le nombre d'occurrences de chaque modalité
  querySnapshot.docs.forEach((doc) {
    naNc = doc['adress'] ?? 'Unknown';
  });

  // Obtenir les valeurs distinctes de na_nc
  // List<String> labels = counts.keys.toList();
  // List<int> values = counts.values.toList();

  // Créer un objet JSON avec les valeurs requises
  // Map<String, dynamic> result = {
  //   'label': labels,
  //    'valeur': values,
  // };

  return Future.value(naNc);
}
