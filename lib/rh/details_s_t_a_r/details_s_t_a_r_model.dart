import '/flutter_flow/flutter_flow_util.dart';
import 'details_s_t_a_r_widget.dart' show DetailsSTARWidget;
import 'package:flutter/material.dart';

class DetailsSTARModel extends FlutterFlowModel<DetailsSTARWidget> {
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
