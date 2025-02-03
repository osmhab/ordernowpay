import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'language_model.dart';
export 'language_model.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({super.key});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  late LanguageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LanguageModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.language,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 34.0,
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'qe6un6bj' /* Select language */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Manrope',
                    color: FlutterFlowTheme.of(context).gray600,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                setAppLanguage(context, 'en');
                Navigator.pop(context);
              },
              text: FFLocalizations.of(context).getText(
                '7j69lbou' /* English */,
              ),
              options: FFButtonOptions(
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryBtnText,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Manrope',
                      color: FFLocalizations.of(context).languageCode == 'en'
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                elevation: 1.0,
                borderSide: BorderSide(
                  color: FFLocalizations.of(context).languageCode == 'en'
                      ? FlutterFlowTheme.of(context).primary
                      : Colors.transparent,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                setAppLanguage(context, 'fr');
                Navigator.pop(context);
              },
              text: FFLocalizations.of(context).getText(
                '5yu9m6hr' /* Français */,
              ),
              options: FFButtonOptions(
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryBtnText,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Manrope',
                      color: FFLocalizations.of(context).languageCode == 'fr'
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                elevation: 1.0,
                borderSide: BorderSide(
                  color: FFLocalizations.of(context).languageCode == 'fr'
                      ? FlutterFlowTheme.of(context).primary
                      : Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                setAppLanguage(context, 'de');
                Navigator.pop(context);
              },
              text: FFLocalizations.of(context).getText(
                'qkdi8tkd' /* Deutsch */,
              ),
              options: FFButtonOptions(
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryBtnText,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Manrope',
                      color: FFLocalizations.of(context).languageCode == 'de'
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                elevation: 1.0,
                borderSide: BorderSide(
                  color: FFLocalizations.of(context).languageCode == 'de'
                      ? FlutterFlowTheme.of(context).primary
                      : Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ].divide(SizedBox(height: 20.0)),
      ),
    );
  }
}
