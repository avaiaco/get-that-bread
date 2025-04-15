import '/flutter_flow/flutter_flow_util.dart';
import '/special/sidebar/sidebar_widget.dart';
import '/index.dart';
import 'faq_widget.dart' show FaqWidget;
import 'package:flutter/material.dart';

class FaqModel extends FlutterFlowModel<FaqWidget> {
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
