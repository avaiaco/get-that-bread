import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'shop_list_item_model.dart';
export 'shop_list_item_model.dart';

class ShopListItemWidget extends StatefulWidget {
  const ShopListItemWidget({super.key});

  @override
  State<ShopListItemWidget> createState() => _ShopListItemWidgetState();
}

class _ShopListItemWidgetState extends State<ShopListItemWidget> {
  late ShopListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShopListItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.68,
      height: 302.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
    );
  }
}
