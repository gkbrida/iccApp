import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'affect_s_t_a_r_dpt_widget.dart' show AffectSTARDptWidget;
import 'package:flutter/material.dart';

class AffectSTARDptModel extends FlutterFlowModel<AffectSTARDptWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for sstar widget.
  String? sstarValue;
  FormFieldController<String>? sstarValueController;
  // Stores action output result for [Custom Action - compareAdvisorIDtoRef] action in sstar widget.
  DocumentReference? currentAppID;
  // Stores action output result for [Custom Action - nameAppFromRefID] action in sstar widget.
  String? currentAppName;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
