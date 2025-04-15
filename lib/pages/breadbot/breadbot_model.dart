import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'breadbot_widget.dart' show BreadbotWidget;
import 'package:flutter/material.dart';

class BreadbotModel extends FlutterFlowModel<BreadbotWidget> {
  ///  Local state fields for this page.

  String geminiFnc = ' ';

  ///  State fields for stateful widgets in this page.

  // State field(s) for ChatPrompt widget.
  FocusNode? chatPromptFocusNode;
  TextEditingController? chatPromptTextController;
  String? Function(BuildContext, String?)? chatPromptTextControllerValidator;
  // Stores action output result for [Backend Call - API (chatbotAPI)] action in IconButton widget.
  ApiCallResponse? apiResultebl;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    chatPromptFocusNode?.dispose();
    chatPromptTextController?.dispose();
  }
}
