import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'creat_dpt_widget.dart' show CreatDptWidget;
import 'package:flutter/material.dart';

class CreatDptModel extends FlutterFlowModel<CreatDptWidget> {
  ///  Local state fields for this component.

  MinistriesRecord? ministry;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nomDpt widget.
  FocusNode? nomDptFocusNode;
  TextEditingController? nomDptTextController;
  String? Function(BuildContext, String?)? nomDptTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DepartmentsRecord? recentDpt;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomDptFocusNode?.dispose();
    nomDptTextController?.dispose();
  }
}
