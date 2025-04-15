import '/flutter_flow/flutter_flow_util.dart';
import 'editprofile_widget.dart' show EditprofileWidget;
import 'package:flutter/material.dart';

class EditprofileModel extends FlutterFlowModel<EditprofileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for prefNameBox widget.
  FocusNode? prefNameBoxFocusNode;
  TextEditingController? prefNameBoxTextController;
  String? Function(BuildContext, String?)? prefNameBoxTextControllerValidator;
  // State field(s) for emailBox widget.
  FocusNode? emailBoxFocusNode;
  TextEditingController? emailBoxTextController;
  String? Function(BuildContext, String?)? emailBoxTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    prefNameBoxFocusNode?.dispose();
    prefNameBoxTextController?.dispose();

    emailBoxFocusNode?.dispose();
    emailBoxTextController?.dispose();
  }
}
