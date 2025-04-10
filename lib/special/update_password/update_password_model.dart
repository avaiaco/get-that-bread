import '/flutter_flow/flutter_flow_util.dart';
import 'update_password_widget.dart' show UpdatePasswordWidget;
import 'package:flutter/material.dart';

class UpdatePasswordModel extends FlutterFlowModel<UpdatePasswordWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for NewPass widget.
  FocusNode? newPassFocusNode;
  TextEditingController? newPassTextController;
  late bool newPassVisibility;
  String? Function(BuildContext, String?)? newPassTextControllerValidator;
  // State field(s) for NewPassConfirm widget.
  FocusNode? newPassConfirmFocusNode;
  TextEditingController? newPassConfirmTextController;
  late bool newPassConfirmVisibility;
  String? Function(BuildContext, String?)?
      newPassConfirmTextControllerValidator;

  @override
  void initState(BuildContext context) {
    newPassVisibility = false;
    newPassConfirmVisibility = false;
  }

  @override
  void dispose() {
    newPassFocusNode?.dispose();
    newPassTextController?.dispose();

    newPassConfirmFocusNode?.dispose();
    newPassConfirmTextController?.dispose();
  }
}
