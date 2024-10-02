import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'indispo_s_t_a_r_widget.dart' show IndispoSTARWidget;
import 'package:flutter/material.dart';

class IndispoSTARModel extends FlutterFlowModel<IndispoSTARWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for namger widget.
  String? namgerValue;
  FormFieldController<String>? namgerValueController;
  // Stores action output result for [Custom Action - compareDocIDtoRefID] action in namger widget.
  DocumentReference? currentDptID;
  // Stores action output result for [Backend Call - Read Document] action in namger widget.
  DepartmentsRecord? dpt;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IndisposRecord? indispo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
