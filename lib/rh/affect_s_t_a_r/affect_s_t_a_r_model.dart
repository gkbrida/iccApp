import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'affect_s_t_a_r_widget.dart' show AffectSTARWidget;
import 'package:flutter/material.dart';

class AffectSTARModel extends FlutterFlowModel<AffectSTARWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for dpt widget.
  String? dptValue;
  FormFieldController<String>? dptValueController;
  // Stores action output result for [Custom Action - compareDocIDtoRefID] action in dpt widget.
  DocumentReference? currentDptID;
  // Stores action output result for [Custom Action - nameDocFromRefID] action in dpt widget.
  String? currentDptName;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
