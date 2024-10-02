import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? testPairImpair(int? index) {
  // test whether index is odd or not
  if (index == null) {
    return null;
  }
  return index % 2 == 0;
}

bool? checkStarInListCopy(
  String star,
  List<String> stars,
) {
  // check if star is in stars
// check if star is in stars

  return stars.contains(star);
}

bool? checkgroupInList(
  DocumentReference star,
  List<DocumentReference> stars,
) {
  // check if star is in stars
// check if star is in stars

  return stars.contains(star);
}

bool? checkEnfantInList(
  DocumentReference star,
  List<DocumentReference> stars,
) {
  // check if star is in stars
// check if star is in stars

  return stars.contains(star);
}

int? decrement(String? duree) {
  // remove 1 from duree if duree is greater than 0
  if (duree == null) {
    return null;
  }
  int parsedDuree = int.tryParse(duree) ?? 0;
  if (parsedDuree > 0) {
    return parsedDuree - 1;
  } else {
    return parsedDuree;
  }
}

bool? checkServiceInList(
  DocumentReference star,
  List<DocumentReference> stars,
) {
  // check if star is in stars
// check if star is in stars

  return stars.contains(star);
}

int? increment(String? duree) {
  // add 1 to duree
  if (duree == null) {
    return 1;
  }
  int parsedDuree = int.tryParse(duree) ?? 0;
  return parsedDuree + 1;
}

DateTime? computeLastDate(
  DateTime? dateStart,
  int? duree,
) {
  // add "duree" to "dateStart" in minutes
  if (dateStart == null || duree == null) {
    return null;
  }
  return dateStart.add(Duration(minutes: duree));
}

int? intConvert(String? duree) {
  // convert duree to int
  if (duree == null) {
    return null;
  }
  return int.tryParse(duree);
}

List<String> newCustomFunction(List<String> lists) {
  // a list of elements distinct from lists
  List<String> distinctElements = [];

  for (String list in lists) {
    if (!list.startsWith('[') || !list.endsWith(']')) {
      distinctElements.add(list);
    }
  }

  return distinctElements.toSet().toList();
}

bool? checkStarInList(
  DocumentReference star,
  List<DocumentReference> stars,
) {
  // check if star is in stars
// check if star is in stars

  return stars.contains(star);
}

String? newCustomFunction2(
  DocumentReference? star,
  List<GroupAdvisorRecord>? adGroup,
) {
  // check if attribut "ad" of one element of adGroup is equal to star and return attribut "na" else null
  for (final group in adGroup ?? []) {
    final ad = group["advisor"];
    if (star == ad) {
      return group["advisor_name"];
    }
  }
  return null;
}

int calculAge(DateTime dateNaissance) {
  // return age from dateNaissance
  final now = DateTime.now();
  final age = now.year - dateNaissance.year;
  if (now.month < dateNaissance.month ||
      (now.month == dateNaissance.month && now.day < dateNaissance.day)) {
    return age - 1;
  }
  return age;
}

List<int>? newCustomFunction3(
  List<EventsRecord>? event,
  List<EventStarRecord>? eventStar,
) {
  // for each event in events list, count event_star where event_star.event == event.id
  if (event == null || eventStar == null) {
    return null;
  }

  List<int> eventStarCountList = [];

  for (EventsRecord eventRecord in event) {
    int count = eventStar
        .where(
            (eventStarRecord) => eventStarRecord.event == eventRecord.reference)
        .length;
    eventStarCountList.add(count);
  }

  return eventStarCountList;
}

List<int>? newCustomFunction3Copy(
  List<EventsRecord>? event,
  List<NewcomersRecord>? eventStar,
) {
  // for each event in events list, count event_star where event_star.event == event.id
  if (event == null || eventStar == null) {
    return null;
  }

  List<int> eventStarCountList = [];

  for (EventsRecord eventRecord in event) {
    int count = eventStar
        .where((eventStarRecord) =>
            eventStarRecord.recuAu == eventRecord.reference &&
            eventStarRecord.ncNa == "NA")
        .length;
    eventStarCountList.add(count);
  }

  return eventStarCountList;
}

List<int>? convertis(
  List<EventsRecord>? event,
  List<NewcomersRecord>? eventStar,
) {
  // for each event in events list, count event_star where event_star.event == event.id
  if (event == null || eventStar == null) {
    return null;
  }

  List<int> eventStarCountList = [];

  for (EventsRecord eventRecord in event) {
    int count = eventStar
        .where((eventStarRecord) =>
            eventStarRecord.recuAu == eventRecord.reference &&
            eventStarRecord.ncNa == "NC")
        .length;
    eventStarCountList.add(count);
  }

  return eventStarCountList;
}

List<int>? newCustomFunction4(List<AccueilRecord>? events) {
  // for each event, add the variables nbEnfant, nbFemme  and nbHomme and put the result in a list
  if (events == null || events.isEmpty) {
    return null;
  }

  List<int> results = [];

  for (var event in events) {
    int total = event.nbEnfant + event.nbFemme + event.nbHomme;
    results.add(total);
  }

  return results;
}

int? newCustomFunction5(List<NewcomersRecord>? newcomers) {
  // number of newcomer documents whose create_date variable is maximum in dd/mm/yyyy format
  if (newcomers == null || newcomers.isEmpty) {
    return null;
  }

  DateTime? maxCreateDate;
  int count = 0;

  for (var newcomer in newcomers) {
    if (newcomer.hasCreateDate()) {
      if (maxCreateDate == null ||
          newcomer.createDate!.isAfter(maxCreateDate)) {
        maxCreateDate = newcomer.createDate;
        count = 1;
      } else if (newcomer.createDate == maxCreateDate) {
        count++;
      }
    }
  }

  return count;
}

List<String>? newCustomFunction6(List<EventsRecord>? events) {
  // for each event concatenate the title and start_date, add the result to a list that returns
  if (events == null || events.isEmpty) {
    return null;
  }

  List<String> resultList = [];
  for (EventsRecord event in events) {
    if (event.hasTitle() && event.hasStartDate()) {
      String eventInfo =
          '${event.title} - ${DateFormat('dd/MM/yyyy').format(event.startDate!)}';
      resultList.add(eventInfo);
    }
  }

  return resultList;
}

DateTime? formatDate(DateTime? today) {
  // format today to dd/mm/yyyy
  // format today to dd/mm/yyyy
  if (today == null) {
    return null;
  }
  return DateTime(today.year, today.month, today.day);
}
