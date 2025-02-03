import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'empty_items_model.dart';
export 'empty_items_model.dart';

class EmptyItemsWidget extends StatefulWidget {
  const EmptyItemsWidget({super.key});

  @override
  State<EmptyItemsWidget> createState() => _EmptyItemsWidgetState();
}

class _EmptyItemsWidgetState extends State<EmptyItemsWidget> {
  late EmptyItemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyItemsModel());

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
      width: MediaQuery.sizeOf(context).width * 0.96,
      height: 400.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            FFLocalizations.of(context).getText(
              '8dcj51dm' /* Your menu is empty. To take yo... */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Manrope',
                  letterSpacing: 0.0,
                ),
          ),
          Lottie.asset(
            'assets/jsons/Empty.json',
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 0.43,
            fit: BoxFit.contain,
            animate: true,
          ),
        ],
      ),
    );
  }
}
