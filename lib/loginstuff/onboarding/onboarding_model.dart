import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_widget.dart' show OnboardingWidget;
import 'package:flutter/material.dart';

class OnboardingModel extends FlutterFlowModel<OnboardingWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in onboarding widget.
  UsersRecord? userinfo;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for LegalFirstNameBox widget.
  FocusNode? legalFirstNameBoxFocusNode;
  TextEditingController? legalFirstNameBoxTextController;
  String? Function(BuildContext, String?)?
      legalFirstNameBoxTextControllerValidator;
  // State field(s) for MiddleNameBox widget.
  FocusNode? middleNameBoxFocusNode;
  TextEditingController? middleNameBoxTextController;
  String? Function(BuildContext, String?)? middleNameBoxTextControllerValidator;
  // State field(s) for LegalLastNameBox widget.
  FocusNode? legalLastNameBoxFocusNode;
  TextEditingController? legalLastNameBoxTextController;
  String? Function(BuildContext, String?)?
      legalLastNameBoxTextControllerValidator;
  // State field(s) for prefNameBox widget.
  FocusNode? prefNameBoxFocusNode;
  TextEditingController? prefNameBoxTextController;
  String? Function(BuildContext, String?)? prefNameBoxTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    legalFirstNameBoxFocusNode?.dispose();
    legalFirstNameBoxTextController?.dispose();

    middleNameBoxFocusNode?.dispose();
    middleNameBoxTextController?.dispose();

    legalLastNameBoxFocusNode?.dispose();
    legalLastNameBoxTextController?.dispose();

    prefNameBoxFocusNode?.dispose();
    prefNameBoxTextController?.dispose();
  }
}
