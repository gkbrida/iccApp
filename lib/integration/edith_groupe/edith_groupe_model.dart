import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edith_groupe_widget.dart' show EdithGroupeWidget;
import 'package:flutter/material.dart';

class EdithGroupeModel extends FlutterFlowModel<EdithGroupeWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for group widget.
  FocusNode? groupFocusNode;
  TextEditingController? groupTextController;
  String? Function(BuildContext, String?)? groupTextControllerValidator;
  // State field(s) for namger widget.
  String? namgerValue;
  FormFieldController<String>? namgerValueController;
  // Stores action output result for [Custom Action - compareAdvisorIDtoRef] action in namger widget.
  DocumentReference? currentManagerID;
  // Stores action output result for [Custom Action - nameAppFromRefID] action in namger widget.
  String? currentManagerName;
  // State field(s) for second widget.
  String? secondValue;
  FormFieldController<String>? secondValueController;
  // Stores action output result for [Custom Action - compareAdvisorIDtoRef] action in second widget.
  DocumentReference? currentSecondID;
  // Stores action output result for [Custom Action - nameAppFromRefID] action in second widget.
  String? currentSecondName;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    groupFocusNode?.dispose();
    groupTextController?.dispose();
  }
}
