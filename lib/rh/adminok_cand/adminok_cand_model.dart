import '/flutter_flow/flutter_flow_util.dart';
import 'adminok_cand_widget.dart' show AdminokCandWidget;
import 'package:flutter/material.dart';

class AdminokCandModel extends FlutterFlowModel<AdminokCandWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
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
