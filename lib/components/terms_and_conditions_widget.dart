import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'terms_and_conditions_model.dart';
export 'terms_and_conditions_model.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  late TermsAndConditionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsAndConditionsModel());

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
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                child: Container(
                  width: double.infinity,
                  height: 53.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/iconBlackandWhite.png',
                          width: 30.0,
                          height: 30.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: FFLocalizations.of(context).getText(
                            '7b115as3' /* Close */,
                          ),
                          icon: Icon(
                            Icons.close_outlined,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Manrope',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'ei5cmdev' /* Terms and conditions of use */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Manrope',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'hd1q22xd' /* These terms of use (the "Terms... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          '86055e4q' /* 1. Use of the Application

1.1... */
                          ,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'r5ohbu1y' /* Free users ("Free Users") are ... */,
                        ),
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'e6i1xc89' /* 1.2 Business Users
 */
                          ,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'cn87ilzp' /* Business users ("Business User... */,
                        ),
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          '1iqhrfbq' /* 2. User Responsibilities

 */
                          ,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'nqfpuiqm' /* 2.1 Free Users
 */
                          ,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'm0zqof1g' /* As a free user, you are respon... */,
                        ),
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'sgf233gl' /* 2.2 Business Users
 */
                          ,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'xteuwebp' /* As a business user, you are re... */,
                        ),
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          '3s3nsxfc' /* 3. Ownership and License

 */
                          ,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'h5wy315x' /* OrderNow owns all intellectual... */,
                        ),
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'wmzu3oar' /* 4. Limitation of Liability

 */
                          ,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'ke1g2700' /* OrderNow is not responsible fo... */,
                        ),
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'iggleg7a' /* 5. Changes to the Terms

 */
                          ,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'hobzrgjs' /* We reserve the right to modify... */,
                        ),
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'iha3rra1' /* 6. Confidentiality of the Appl... */,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'xl2xqpvj' /* At OrderNow, we prioritize the... */,
                        ),
                        style: TextStyle(),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Divider(
                height: 30.0,
                thickness: 1.0,
                indent: 16.0,
                endIndent: 16.0,
                color: FlutterFlowTheme.of(context).grayIcon,
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '46u8pv90' /* OrderNow Sàrl, 2024 */,
                    ),
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).grayIcon,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
