import '/flutter_flow/flutter_flow_util.dart';
import 'creat_ministry_widget.dart' show CreatMinistryWidget;
import 'package:flutter/material.dart';

class CreatMinistryModel extends FlutterFlowModel<CreatMinistryWidget> {
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
