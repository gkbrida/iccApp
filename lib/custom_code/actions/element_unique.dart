// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future<List<String>> elementUnique(
  List<String> lists,
) async {
  Map<String, int> occurrences = {};
  for (String element in lists) {
    if (occurrences.containsKey(element)) {
      occurrences[element] = occurrences[element]! + 1;
    } else {
      occurrences[element] = 1;
    }
  }
  List<String> result = [];
  occurrences.forEach((element, count) {
    result.add('$element $count');
  });
  return Future.value(result);
}
