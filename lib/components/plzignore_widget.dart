import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'plzignore_model.dart';
export 'plzignore_model.dart';

/// this is just a small change to convince this branch that change occured so
/// that we can merge
class PlzignoreWidget extends StatefulWidget {
  const PlzignoreWidget({super.key});

  @override
  State<PlzignoreWidget> createState() => _PlzignoreWidgetState();
}

class _PlzignoreWidgetState extends State<PlzignoreWidget> {
  late PlzignoreModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlzignoreModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
