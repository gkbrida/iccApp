import '/flutter_flow/flutter_flow_util.dart';
import 'creatchurch_widget.dart' show CreatchurchWidget;
import 'package:flutter/material.dart';

class CreatchurchModel extends FlutterFlowModel<CreatchurchWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nomMinistere widget.
  FocusNode? nomMinistereFocusNode;
  TextEditingController? nomMinistereTextController;
  String? Function(BuildContext, String?)? nomMinistereTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomMinistereFocusNode?.dispose();
    nomMinistereTextController?.dispose();
  }
}
