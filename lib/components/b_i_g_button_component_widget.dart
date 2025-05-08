import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'b_i_g_button_component_model.dart';
export 'b_i_g_button_component_model.dart';

class BIGButtonComponentWidget extends StatefulWidget {
  const BIGButtonComponentWidget({
    super.key,
    bool? hidden,
    String? buttonText,
    required this.iconButton,
  })  : this.hidden = hidden ?? false,
        this.buttonText = buttonText ?? 'Hello world';

  final bool hidden;
  final String buttonText;
  final Widget? iconButton;

  @override
  State<BIGButtonComponentWidget> createState() =>
      _BIGButtonComponentWidgetState();
}

class _BIGButtonComponentWidgetState extends State<BIGButtonComponentWidget> {
  late BIGButtonComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BIGButtonComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        width: 380.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget!.iconButton!,
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                widget!.buttonText,
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Manrope',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ].divide(SizedBox(width: 8.0)).around(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
