import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_stake_h_widget.dart' show AddStakeHWidget;
import 'package:flutter/material.dart';

class AddStakeHModel extends FlutterFlowModel<AddStakeHWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for typeIntervenant widget.
  String? typeIntervenantValue;
  FormFieldController<String>? typeIntervenantValueController;
  // State field(s) for dpt widget.
  String? dptValue;
  FormFieldController<String>? dptValueController;
  // Stores action output result for [Custom Action - compareDocIDtoRefID] action in dpt widget.
  DocumentReference? currentDptID;
  // Stores action output result for [Custom Action - nameDocFromRefID] action in dpt widget.
  String? currentDptName;
  // State field(s) for star widget.
  String? starValue;
  FormFieldController<String>? starValueController;
  // Stores action output result for [Custom Action - compareAdvisorIDtoRef] action in star widget.
  DocumentReference? currentSTARID;
  // Stores action output result for [Custom Action - nameAppFromRefID] action in star widget.
  String? currentStarName;
  // State field(s) for nomExterne widget.
  FocusNode? nomExterneFocusNode;
  TextEditingController? nomExterneTextController;
  String? Function(BuildContext, String?)? nomExterneTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EventTasksRecord? currentTask;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomExterneFocusNode?.dispose();
    nomExterneTextController?.dispose();
  }
}
