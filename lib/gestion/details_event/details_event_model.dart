import '/flutter_flow/flutter_flow_util.dart';
import 'details_event_widget.dart' show DetailsEventWidget;
import 'package:flutter/material.dart';

class DetailsEventModel extends FlutterFlowModel<DetailsEventWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - searchEventStar] action in IconButton widget.
  List<dynamic>? eventStarFilted;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
