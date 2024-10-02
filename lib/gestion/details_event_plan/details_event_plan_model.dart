import '/flutter_flow/flutter_flow_util.dart';
import 'details_event_plan_widget.dart' show DetailsEventPlanWidget;
import 'package:flutter/material.dart';

class DetailsEventPlanModel extends FlutterFlowModel<DetailsEventPlanWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
