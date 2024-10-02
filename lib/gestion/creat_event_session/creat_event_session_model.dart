import '/flutter_flow/flutter_flow_util.dart';
import 'creat_event_session_widget.dart' show CreatEventSessionWidget;
import 'package:flutter/material.dart';

class CreatEventSessionModel extends FlutterFlowModel<CreatEventSessionWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nomSession widget.
  FocusNode? nomSessionFocusNode;
  TextEditingController? nomSessionTextController;
  String? Function(BuildContext, String?)? nomSessionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomSessionFocusNode?.dispose();
    nomSessionTextController?.dispose();
  }
}
