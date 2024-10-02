import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'mondepartment_widget.dart' show MondepartmentWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MondepartmentModel extends FlutterFlowModel<MondepartmentWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  /// Query cache managers for this widget.

  final _myGroupsManager = StreamRequestManager<List<GroupsRecord>>();
  Stream<List<GroupsRecord>> myGroups({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<GroupsRecord>> Function() requestFn,
  }) =>
      _myGroupsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMyGroupsCache() => _myGroupsManager.clear();
  void clearMyGroupsCacheKey(String? uniqueKey) =>
      _myGroupsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    expandableExpandableController1.dispose();

    /// Dispose query cache managers for this widget.

    clearMyGroupsCache();
  }
}
