import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'recipies_widget.dart' show RecipiesWidget;
import 'package:flutter/material.dart';

class RecipiesModel extends FlutterFlowModel<RecipiesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Choices widget.
  FormFieldController<List<String>>? choicesValueController;
  String? get choicesValue => choicesValueController?.value?.firstOrNull;
  set choicesValue(String? val) =>
      choicesValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
