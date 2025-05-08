import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tagbutton_model.dart';
export 'tagbutton_model.dart';

class TagbuttonWidget extends StatefulWidget {
  const TagbuttonWidget({super.key});

  @override
  State<TagbuttonWidget> createState() => _TagbuttonWidgetState();
}

class _TagbuttonWidgetState extends State<TagbuttonWidget> {
  late TagbuttonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagbuttonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.1,
        height: 50.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primary,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              '4fn81jir' /* Hello World */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Manrope',
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ),
    );
  }
}
