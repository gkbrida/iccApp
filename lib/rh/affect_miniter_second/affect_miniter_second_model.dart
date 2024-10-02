import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'affect_miniter_second_widget.dart' show AffectMiniterSecondWidget;
import 'package:flutter/material.dart';

class AffectMiniterSecondModel
    extends FlutterFlowModel<AffectMiniterSecondWidget> {
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
