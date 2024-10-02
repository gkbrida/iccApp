import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _appChurch = prefs.getString('ff_appChurch')?.ref ?? _appChurch;
    });
    _safeInit(() {
      _myChurchName = prefs.getString('ff_myChurchName') ?? _myChurchName;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _application = '';
  String get application => _application;
  set application(String value) {
    _application = value;
  }

  DocumentReference? _appChurch;
  DocumentReference? get appChurch => _appChurch;
  set appChurch(DocumentReference? value) {
    _appChurch = value;
    value != null
        ? prefs.setString('ff_appChurch', value.path)
        : prefs.remove('ff_appChurch');
  }

  DocumentReference? _appDepartment;
  DocumentReference? get appDepartment => _appDepartment;
  set appDepartment(DocumentReference? value) {
    _appDepartment = value;
  }

  DocumentReference? _userAppInfo;
  DocumentReference? get userAppInfo => _userAppInfo;
  set userAppInfo(DocumentReference? value) {
    _userAppInfo = value;
  }

  int _index = 0;
  int get index => _index;
  set index(int value) {
    _index = value;
  }

  List<DocumentReference> _myMinistries = [];
  List<DocumentReference> get myMinistries => _myMinistries;
  set myMinistries(List<DocumentReference> value) {
    _myMinistries = value;
  }

  void addToMyMinistries(DocumentReference value) {
    myMinistries.add(value);
  }

  void removeFromMyMinistries(DocumentReference value) {
    myMinistries.remove(value);
  }

  void removeAtIndexFromMyMinistries(int index) {
    myMinistries.removeAt(index);
  }

  void updateMyMinistriesAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    myMinistries[index] = updateFn(_myMinistries[index]);
  }

  void insertAtIndexInMyMinistries(int index, DocumentReference value) {
    myMinistries.insert(index, value);
  }

  List<DocumentReference> _myAdvisor = [];
  List<DocumentReference> get myAdvisor => _myAdvisor;
  set myAdvisor(List<DocumentReference> value) {
    _myAdvisor = value;
  }

  void addToMyAdvisor(DocumentReference value) {
    myAdvisor.add(value);
  }

  void removeFromMyAdvisor(DocumentReference value) {
    myAdvisor.remove(value);
  }

  void removeAtIndexFromMyAdvisor(int index) {
    myAdvisor.removeAt(index);
  }

  void updateMyAdvisorAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    myAdvisor[index] = updateFn(_myAdvisor[index]);
  }

  void insertAtIndexInMyAdvisor(int index, DocumentReference value) {
    myAdvisor.insert(index, value);
  }

  DocumentReference? _myGroup;
  DocumentReference? get myGroup => _myGroup;
  set myGroup(DocumentReference? value) {
    _myGroup = value;
  }

  String _myChurchName = '';
  String get myChurchName => _myChurchName;
  set myChurchName(String value) {
    _myChurchName = value;
    prefs.setString('ff_myChurchName', value);
  }

  List<String> _stakeholders = [];
  List<String> get stakeholders => _stakeholders;
  set stakeholders(List<String> value) {
    _stakeholders = value;
  }

  void addToStakeholders(String value) {
    stakeholders.add(value);
  }

  void removeFromStakeholders(String value) {
    stakeholders.remove(value);
  }

  void removeAtIndexFromStakeholders(int index) {
    stakeholders.removeAt(index);
  }

  void updateStakeholdersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    stakeholders[index] = updateFn(_stakeholders[index]);
  }

  void insertAtIndexInStakeholders(int index, String value) {
    stakeholders.insert(index, value);
  }

  List<DocumentReference> _interveantDptID = [];
  List<DocumentReference> get interveantDptID => _interveantDptID;
  set interveantDptID(List<DocumentReference> value) {
    _interveantDptID = value;
  }

  void addToInterveantDptID(DocumentReference value) {
    interveantDptID.add(value);
  }

  void removeFromInterveantDptID(DocumentReference value) {
    interveantDptID.remove(value);
  }

  void removeAtIndexFromInterveantDptID(int index) {
    interveantDptID.removeAt(index);
  }

  void updateInterveantDptIDAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    interveantDptID[index] = updateFn(_interveantDptID[index]);
  }

  void insertAtIndexInInterveantDptID(int index, DocumentReference value) {
    interveantDptID.insert(index, value);
  }

  List<String> _interveantDptName = [];
  List<String> get interveantDptName => _interveantDptName;
  set interveantDptName(List<String> value) {
    _interveantDptName = value;
  }

  void addToInterveantDptName(String value) {
    interveantDptName.add(value);
  }

  void removeFromInterveantDptName(String value) {
    interveantDptName.remove(value);
  }

  void removeAtIndexFromInterveantDptName(int index) {
    interveantDptName.removeAt(index);
  }

  void updateInterveantDptNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    interveantDptName[index] = updateFn(_interveantDptName[index]);
  }

  void insertAtIndexInInterveantDptName(int index, String value) {
    interveantDptName.insert(index, value);
  }

  List<DocumentReference> _interveantStarID = [];
  List<DocumentReference> get interveantStarID => _interveantStarID;
  set interveantStarID(List<DocumentReference> value) {
    _interveantStarID = value;
  }

  void addToInterveantStarID(DocumentReference value) {
    interveantStarID.add(value);
  }

  void removeFromInterveantStarID(DocumentReference value) {
    interveantStarID.remove(value);
  }

  void removeAtIndexFromInterveantStarID(int index) {
    interveantStarID.removeAt(index);
  }

  void updateInterveantStarIDAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    interveantStarID[index] = updateFn(_interveantStarID[index]);
  }

  void insertAtIndexInInterveantStarID(int index, DocumentReference value) {
    interveantStarID.insert(index, value);
  }

  List<String> _interveantStarName = [];
  List<String> get interveantStarName => _interveantStarName;
  set interveantStarName(List<String> value) {
    _interveantStarName = value;
  }

  void addToInterveantStarName(String value) {
    interveantStarName.add(value);
  }

  void removeFromInterveantStarName(String value) {
    interveantStarName.remove(value);
  }

  void removeAtIndexFromInterveantStarName(int index) {
    interveantStarName.removeAt(index);
  }

  void updateInterveantStarNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    interveantStarName[index] = updateFn(_interveantStarName[index]);
  }

  void insertAtIndexInInterveantStarName(int index, String value) {
    interveantStarName.insert(index, value);
  }

  bool _eventStarFilted = false;
  bool get eventStarFilted => _eventStarFilted;
  set eventStarFilted(bool value) {
    _eventStarFilted = value;
  }

  List<DocumentReference> _userChurchs = [];
  List<DocumentReference> get userChurchs => _userChurchs;
  set userChurchs(List<DocumentReference> value) {
    _userChurchs = value;
  }

  void addToUserChurchs(DocumentReference value) {
    userChurchs.add(value);
  }

  void removeFromUserChurchs(DocumentReference value) {
    userChurchs.remove(value);
  }

  void removeAtIndexFromUserChurchs(int index) {
    userChurchs.removeAt(index);
  }

  void updateUserChurchsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    userChurchs[index] = updateFn(_userChurchs[index]);
  }

  void insertAtIndexInUserChurchs(int index, DocumentReference value) {
    userChurchs.insert(index, value);
  }

  List<DocumentReference> _myEventStat = [];
  List<DocumentReference> get myEventStat => _myEventStat;
  set myEventStat(List<DocumentReference> value) {
    _myEventStat = value;
  }

  void addToMyEventStat(DocumentReference value) {
    myEventStat.add(value);
  }

  void removeFromMyEventStat(DocumentReference value) {
    myEventStat.remove(value);
  }

  void removeAtIndexFromMyEventStat(int index) {
    myEventStat.removeAt(index);
  }

  void updateMyEventStatAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    myEventStat[index] = updateFn(_myEventStat[index]);
  }

  void insertAtIndexInMyEventStat(int index, DocumentReference value) {
    myEventStat.insert(index, value);
  }

  List<DocumentReference> _myEventstar2 = [];
  List<DocumentReference> get myEventstar2 => _myEventstar2;
  set myEventstar2(List<DocumentReference> value) {
    _myEventstar2 = value;
  }

  void addToMyEventstar2(DocumentReference value) {
    myEventstar2.add(value);
  }

  void removeFromMyEventstar2(DocumentReference value) {
    myEventstar2.remove(value);
  }

  void removeAtIndexFromMyEventstar2(int index) {
    myEventstar2.removeAt(index);
  }

  void updateMyEventstar2AtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    myEventstar2[index] = updateFn(_myEventstar2[index]);
  }

  void insertAtIndexInMyEventstar2(int index, DocumentReference value) {
    myEventstar2.insert(index, value);
  }

  List<String> _listEnfants = [];
  List<String> get listEnfants => _listEnfants;
  set listEnfants(List<String> value) {
    _listEnfants = value;
  }

  void addToListEnfants(String value) {
    listEnfants.add(value);
  }

  void removeFromListEnfants(String value) {
    listEnfants.remove(value);
  }

  void removeAtIndexFromListEnfants(int index) {
    listEnfants.removeAt(index);
  }

  void updateListEnfantsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listEnfants[index] = updateFn(_listEnfants[index]);
  }

  void insertAtIndexInListEnfants(int index, String value) {
    listEnfants.insert(index, value);
  }

  List<DateTime> _listDnenf = [];
  List<DateTime> get listDnenf => _listDnenf;
  set listDnenf(List<DateTime> value) {
    _listDnenf = value;
  }

  void addToListDnenf(DateTime value) {
    listDnenf.add(value);
  }

  void removeFromListDnenf(DateTime value) {
    listDnenf.remove(value);
  }

  void removeAtIndexFromListDnenf(int index) {
    listDnenf.removeAt(index);
  }

  void updateListDnenfAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    listDnenf[index] = updateFn(_listDnenf[index]);
  }

  void insertAtIndexInListDnenf(int index, DateTime value) {
    listDnenf.insert(index, value);
  }

  final _servStarDptManager = StreamRequestManager<List<ServicesRecord>>();
  Stream<List<ServicesRecord>> servStarDpt({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ServicesRecord>> Function() requestFn,
  }) =>
      _servStarDptManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearServStarDptCache() => _servStarDptManager.clear();
  void clearServStarDptCacheKey(String? uniqueKey) =>
      _servStarDptManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
