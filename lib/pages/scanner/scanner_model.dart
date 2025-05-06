import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'scanner_widget.dart' show ScannerWidget;
import 'package:flutter/material.dart';

class ScannerModel extends FlutterFlowModel<ScannerWidget> {
  ///  Local state fields for this page.

  ReceiptWrapperStruct? receiptWrapper;
  void updateReceiptWrapperStruct(Function(ReceiptWrapperStruct) updateFn) {
    updateFn(receiptWrapper ??= ReceiptWrapperStruct());
  }

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [AI Agent - Send Message to receipt agent] action in Container widget.
  Map<String, dynamic>? extractedReceiptInfo;
  // Stores action output result for [Backend Call - Create Document] action in saveReceipt widget.
  ReceiptsRecord? backendCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
