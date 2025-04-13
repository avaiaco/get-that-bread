import '/flutter_flow/flutter_flow_util.dart';
import '/special/sidebar/sidebar_widget.dart';
import 'stats_widget.dart' show StatsWidget;
import 'package:flutter/material.dart';

class StatsModel extends FlutterFlowModel<StatsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sidebar component.
  late SidebarModel sidebarModel;

  @override
  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
  }

  @override
  void dispose() {
    sidebarModel.dispose();
  }
}
