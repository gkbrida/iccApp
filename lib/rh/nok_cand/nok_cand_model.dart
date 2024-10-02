import '/flutter_flow/flutter_flow_util.dart';
import 'nok_cand_widget.dart' show NokCandWidget;
import 'package:flutter/material.dart';

class NokCandModel extends FlutterFlowModel<NokCandWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
