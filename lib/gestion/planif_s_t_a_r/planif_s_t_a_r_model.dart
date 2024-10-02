import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'planif_s_t_a_r_widget.dart' show PlanifSTARWidget;
import 'package:flutter/material.dart';

class PlanifSTARModel extends FlutterFlowModel<PlanifSTARWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for typeIntervenant widget.
  String? typeIntervenantValue;
  FormFieldController<String>? typeIntervenantValueController;
  // State field(s) for group widget.
  String? groupValue;
  FormFieldController<String>? groupValueController;
  // Stores action output result for [Custom Action - compareGroupIDtoRef] action in group widget.
  DocumentReference? currentGroupID;
  // Stores action output result for [Custom Action - nameGroupFromRefID] action in group widget.
  String? currentGroupName;
  // State field(s) for star widget.
  String? starValue;
  FormFieldController<String>? starValueController;
  // Stores action output result for [Custom Action - compareAdvisorIDtoRef] action in star widget.
  DocumentReference? currentSTARID;
  // Stores action output result for [Custom Action - nameAppFromRefID] action in star widget.
  String? currentStarName;
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
