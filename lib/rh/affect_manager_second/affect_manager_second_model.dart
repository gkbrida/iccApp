import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'affect_manager_second_widget.dart' show AffectManagerSecondWidget;
import 'package:flutter/material.dart';

class AffectManagerSecondModel
    extends FlutterFlowModel<AffectManagerSecondWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for star widget.
  String? starValue;
  FormFieldController<String>? starValueController;
  // Stores action output result for [Custom Action - compareAdvisorIDtoRef] action in star widget.
  DocumentReference? currentSTARID;
  // Stores action output result for [Custom Action - nameAppFromRefID] action in star widget.
  String? currentSTARName;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
