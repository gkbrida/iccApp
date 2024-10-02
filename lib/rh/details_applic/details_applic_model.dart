import '/flutter_flow/flutter_flow_util.dart';
import 'details_applic_widget.dart' show DetailsApplicWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DetailsApplicModel extends FlutterFlowModel<DetailsApplicWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
