import '/flutter_flow/flutter_flow_util.dart';
import 'page2_widget.dart' show Page2Widget;
import 'package:flutter/material.dart';

class Page2Model extends FlutterFlowModel<Page2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
