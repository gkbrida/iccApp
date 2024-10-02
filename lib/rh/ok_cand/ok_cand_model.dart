import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'ok_cand_widget.dart' show OkCandWidget;
import 'package:flutter/material.dart';

class OkCandModel extends FlutterFlowModel<OkCandWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for dpart widget.
  String? dpartValue;
  FormFieldController<String>? dpartValueController;
  // Stores action output result for [Custom Action - compareDocIDtoRefID] action in dpart widget.
  DocumentReference? currentDptID;
  // Stores action output result for [Custom Action - nameDocFromRefID] action in dpart widget.
  String? currentDptName;
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
