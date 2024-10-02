import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_advisor_group_widget.dart' show AddAdvisorGroupWidget;
import 'package:flutter/material.dart';

class AddAdvisorGroupModel extends FlutterFlowModel<AddAdvisorGroupWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for group widget.
  String? groupValue;
  FormFieldController<String>? groupValueController;
  // Stores action output result for [Custom Action - compareGroupIDtoRef] action in group widget.
  DocumentReference? currentGroupID;
  // Stores action output result for [Custom Action - nameGroupFromRefID] action in group widget.
  String? currentGroupName;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
