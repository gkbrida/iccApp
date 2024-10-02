import '/components/outtlinebtn/outtlinebtn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for outtlinebtn component.
  late OuttlinebtnModel outtlinebtnModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    outtlinebtnModel = createModel(context, () => OuttlinebtnModel());
  }

  @override
  void dispose() {
    outtlinebtnModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
