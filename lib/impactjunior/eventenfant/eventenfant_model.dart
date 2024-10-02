import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'eventenfant_widget.dart' show EventenfantWidget;
import 'package:flutter/material.dart';

class EventenfantModel extends FlutterFlowModel<EventenfantWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - compareEnfantIDtoRef] action in DropDown widget.
  DocumentReference? currentEnfantID;
  // Stores action output result for [Backend Call - Read Document] action in DropDown widget.
  EnfantsRecord? currentEnfant;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
