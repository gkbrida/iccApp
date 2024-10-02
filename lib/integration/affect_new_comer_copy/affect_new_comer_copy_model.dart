import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'affect_new_comer_copy_widget.dart' show AffectNewComerCopyWidget;
import 'package:flutter/material.dart';

class AffectNewComerCopyModel
    extends FlutterFlowModel<AffectNewComerCopyWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for advisor widget.
  String? advisorValue;
  FormFieldController<String>? advisorValueController;
  // Stores action output result for [Custom Action - compareAdvisorIDtoRef] action in advisor widget.
  DocumentReference? currentAdvisorID;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
