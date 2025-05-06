import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'scanner_model.dart';
export 'scanner_model.dart';

/// receipt scanner page
class ScannerWidget extends StatefulWidget {
  const ScannerWidget({super.key});

  static String routeName = 'scanner';
  static String routePath = '/scanner';

  @override
  State<ScannerWidget> createState() => _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerWidget>
    with TickerProviderStateMixin {
  late ScannerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScannerModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'scanner'});
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Text(
                'Receipt Scanner',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.lemon(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 25.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
            ),
            actions: [],
            centerTitle: false,
            toolbarHeight: 50.0,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'SCANNER_PAGE_Container_uw5p60td_ON_TAP');
                      logFirebaseEvent('Container_upload_media_to_firebase');
                      final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                        context: context,
                        imageQuality: 100,
                        allowPhoto: true,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        safeSetState(() => _model.isDataUploading = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];

                        var downloadUrls = <String>[];
                        try {
                          selectedUploadedFiles = selectedMedia
                              .map((m) => FFUploadedFile(
                                    name: m.storagePath.split('/').last,
                                    bytes: m.bytes,
                                    height: m.dimensions?.height,
                                    width: m.dimensions?.width,
                                    blurHash: m.blurHash,
                                  ))
                              .toList();

                          downloadUrls = (await Future.wait(
                            selectedMedia.map(
                              (m) async =>
                                  await uploadData(m.storagePath, m.bytes),
                            ),
                          ))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                        } finally {
                          _model.isDataUploading = false;
                        }
                        if (selectedUploadedFiles.length ==
                                selectedMedia.length &&
                            downloadUrls.length == selectedMedia.length) {
                          safeSetState(() {
                            _model.uploadedLocalFile =
                                selectedUploadedFiles.first;
                            _model.uploadedFileUrl = downloadUrls.first;
                          });
                        } else {
                          safeSetState(() {});
                          return;
                        }
                      }

                      if (_model.uploadedFileUrl != '') {
                        logFirebaseEvent('Container_a_i_agent');
                        await callAiAgent(
                          context: context,
                          prompt:
                              'Get the product names and their prices from this receipt',
                          imageUrl: _model.uploadedFileUrl,
                          threadId: '1234',
                          agentCloudFunctionName: 'receiptAgent',
                          provider: 'GOOGLE',
                          agentJson:
                              "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"receiptAgent\",\"key\":\"66f08\"},\"name\":\"receipt agent\",\"description\":\"The user uploads their receipt and the receipt agent will get the products and prices to display to the user\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.0-flash\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":8192},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"Analyze the receipt image line by line where product information appears. Do not inlcude things like total, subtotal, or tax, only products. For each product found, extract its name as a string and price as a double, and add a gluten free boolean at the end and set it to true. Compile these into a JSON \\n\\nExample JSON format:\\n{\\n  \\\"items\\\": [\\n    { \\\"item\\\": \\\"Apple\\\", \\\"price\\\": 1.50, \\\"gluten_free\\\": true },\\n    { \\\"item\\\": \\\"Banana\\\", \\\"price\\\": 2.00, \\\"gluten_free\\\": true }\\n  ]\\n}\"}]},\"requestOptions\":{\"requestTypes\":[\"IMAGE\",\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"JSON\"}}",
                          responseType: 'JSON',
                        ).then((generatedText) {
                          safeSetState(() =>
                              _model.extractedReceiptInfo = generatedText);
                        });

                        logFirebaseEvent('Container_update_page_state');
                        _model.receiptWrapper =
                            ReceiptWrapperStruct.maybeFromMap(getJsonField(
                          _model.extractedReceiptInfo,
                          r'''$''',
                        ));
                        safeSetState(() {});
                      } else {
                        logFirebaseEvent('Container_show_snack_bar');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Upload failed, please try again.',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      }

                      safeSetState(() {});
                    },
                    child: Container(
                      width: 300.0,
                      height: 304.5,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiary,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryText,
                          width: 3.0,
                        ),
                      ),
                      child: Stack(
                        children: [
                          if (_model.uploadedFileUrl != '')
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  _model.uploadedFileUrl,
                                  width: 300.0,
                                  height: 470.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          if (_model.uploadedFileUrl == '')
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.camera_alt,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 75.0,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ),
              ),
              if (_model.uploadedFileUrl == '')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Text(
                    'Tap above to add receipt',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              if (_model.uploadedFileUrl != '')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Text(
                    'Uncheck items that are not gluten free',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  height: 227.94,
                  decoration: BoxDecoration(),
                  child: Builder(
                    builder: (context) {
                      final itemsListView = _model.receiptWrapper?.items
                              .take(10)
                              .toList()
                              .toList() ??
                          [];

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: itemsListView.length,
                        itemBuilder: (context, itemsListViewIndex) {
                          final itemsListViewItem =
                              itemsListView[itemsListViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    itemsListViewItem.item,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 50.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 50.0,
                                      fillColor:
                                          itemsListViewItem.glutenFree == false
                                              ? Color(0xFF808080)
                                              : FlutterFlowTheme.of(context)
                                                  .primary,
                                      icon: Icon(
                                        Icons.check_circle_sharp,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'SCANNER_check_circle_sharp_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_update_page_state');
                                        _model.updateReceiptWrapperStruct(
                                          (e) => e
                                            ..updateItems(
                                              (e) => e[itemsListViewIndex] =
                                                  ReceiptItemDataTypeStruct(
                                                item: itemsListViewItem.item,
                                                price: itemsListViewItem.price,
                                                glutenFree: itemsListViewItem
                                                            .glutenFree ==
                                                        false
                                                    ? true
                                                    : false,
                                              ),
                                            ),
                                        );
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              if (_model.uploadedFileUrl != '')
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('SCANNER_PAGE_saveReceipt_ON_TAP');
                        logFirebaseEvent('saveReceipt_backend_call');

                        var receiptsRecordReference =
                            ReceiptsRecord.collection.doc();
                        await receiptsRecordReference.set({
                          ...createReceiptsRecordData(
                            receiptImage: _model.uploadedFileUrl,
                            userId: currentUserUid,
                            timeStamp: getCurrentTimestamp,
                          ),
                          ...mapToFirestore(
                            {
                              'receipt_items':
                                  getReceiptItemDataTypeListFirestoreData(
                                _model.receiptWrapper?.items,
                              ),
                            },
                          ),
                        });
                        _model.backendCall =
                            ReceiptsRecord.getDocumentFromData({
                          ...createReceiptsRecordData(
                            receiptImage: _model.uploadedFileUrl,
                            userId: currentUserUid,
                            timeStamp: getCurrentTimestamp,
                          ),
                          ...mapToFirestore(
                            {
                              'receipt_items':
                                  getReceiptItemDataTypeListFirestoreData(
                                _model.receiptWrapper?.items,
                              ),
                            },
                          ),
                        }, receiptsRecordReference);
                        if (_model.backendCall?.reference != null) {
                          logFirebaseEvent('saveReceipt_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Receipt Saved!',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        } else {
                          logFirebaseEvent('saveReceipt_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Receipt Upload Failed, Please Try Again',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        }

                        safeSetState(() {});
                      },
                      text: 'Save Receipt',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['buttonOnPageLoadAnimation']!),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
