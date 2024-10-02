import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'departments_widget.dart' show DepartmentsWidget;
import 'package:flutter/material.dart';

class DepartmentsModel extends FlutterFlowModel<DepartmentsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Checkbox widget.
  Map<ServicesRecord, bool> checkboxValueMap = {};
  List<ServicesRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
