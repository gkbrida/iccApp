import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_groupe_widget.dart' show CreateGroupeWidget;
import 'package:flutter/material.dart';

class CreateGroupeModel extends FlutterFlowModel<CreateGroupeWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for group widget.
  FocusNode? groupFocusNode;
  TextEditingController? groupTextController;
  String? Function(BuildContext, String?)? groupTextControllerValidator;
  String? _groupTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

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
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  GroupsRecord? currentGroup;

  @override
  void initState(BuildContext context) {
    groupTextControllerValidator = _groupTextControllerValidator;
  }

  @override
  void dispose() {
    groupFocusNode?.dispose();
    groupTextController?.dispose();
  }
}
