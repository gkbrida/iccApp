import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'details_event_copy_widget.dart' show DetailsEventCopyWidget;
import 'package:flutter/material.dart';

class DetailsEventCopyModel extends FlutterFlowModel<DetailsEventCopyWidget> {
  ///  Local state fields for this page.

  int? indeXGoup;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for Input widget.
  String? inputValue;
  FormFieldController<String>? inputValueController;
  // Stores action output result for [Custom Action - compareGroupIDtoRef] action in Input widget.
  DocumentReference? currentGroupID;
  // Stores action output result for [Custom Action - nameGroupFromRefID] action in Input widget.
  String? currentGroupName;
  // Stores action output result for [Firestore Query - Query a collection] action in Input widget.
  List<GroupAdvisorRecord>? groupSTARs;
  // Stores action output result for [Custom Action - compareServiceIDtoRef] action in Input widget.
  DocumentReference? currentStarID;
  // Stores action output result for [Backend Call - Read Document] action in Input widget.
  ServicesRecord? currentStarService;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
