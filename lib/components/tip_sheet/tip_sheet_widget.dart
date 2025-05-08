import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tip_sheet_model.dart';
export 'tip_sheet_model.dart';

class TipSheetWidget extends StatefulWidget {
  const TipSheetWidget({
    super.key,
    required this.orderParameters,
  });

  final CartsRecord? orderParameters;

  @override
  State<TipSheetWidget> createState() => _TipSheetWidgetState();
}

class _TipSheetWidgetState extends State<TipSheetWidget> {
  late TipSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TipSheetModel());

    _model.tipAmountTextController ??= TextEditingController(
        text: formatNumber(
      widget!.orderParameters?.tip,
      formatType: FormatType.custom,
      format: '0.00',
      locale: '',
    ));
    _model.tipAmountFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'a2402x3l' /* Tip */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'lvw6iwcu' /* You have been served by: */,
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.network(
                        widget!.orderParameters!.createdByPhoto,
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget!.orderParameters?.createdByName,
                          'ServedByname?',
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.backGroundColor10 =
                              FlutterFlowTheme.of(context).primary;
                          _model.textColor10 =
                              FlutterFlowTheme.of(context).white;
                          _model.borderColor10 = Color(0x00000000);
                          _model.backGroundColor15 =
                              FlutterFlowTheme.of(context).secondaryBackground;
                          _model.textColor15 =
                              FlutterFlowTheme.of(context).primary;
                          _model.borderColor15 =
                              FlutterFlowTheme.of(context).primary;
                          _model.backGroundColor20 =
                              FlutterFlowTheme.of(context).secondaryBackground;
                          _model.textColor20 =
                              FlutterFlowTheme.of(context).primary;
                          _model.borderColor20 =
                              FlutterFlowTheme.of(context).primary;
                          safeSetState(() {});
                          safeSetState(() {
                            _model.tipAmountTextController?.text = formatNumber(
                              widget!.orderParameters!.subtotal * 10 / 100,
                              formatType: FormatType.custom,
                              format: '0.00',
                              locale: '',
                            );
                          });
                        },
                        text: FFLocalizations.of(context).getText(
                          'irmmt4qo' /* 10% */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 24.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            _model.backGroundColor10,
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Manrope',
                                    color: valueOrDefault<Color>(
                                      _model.textColor10,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                          borderSide: BorderSide(
                            color: valueOrDefault<Color>(
                              _model.borderColor10,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.backGroundColor10 =
                              FlutterFlowTheme.of(context).secondaryBackground;
                          _model.textColor10 =
                              FlutterFlowTheme.of(context).primary;
                          _model.borderColor10 =
                              FlutterFlowTheme.of(context).primary;
                          _model.backGroundColor15 =
                              FlutterFlowTheme.of(context).primary;
                          _model.textColor15 =
                              FlutterFlowTheme.of(context).secondaryBackground;
                          _model.borderColor15 = Color(0x00000000);
                          _model.backGroundColor20 =
                              FlutterFlowTheme.of(context).secondaryBackground;
                          _model.textColor20 =
                              FlutterFlowTheme.of(context).primary;
                          _model.borderColor20 =
                              FlutterFlowTheme.of(context).primary;
                          safeSetState(() {});
                          safeSetState(() {
                            _model.tipAmountTextController?.text = formatNumber(
                              widget!.orderParameters!.subtotal * 15 / 100,
                              formatType: FormatType.custom,
                              format: '0.00',
                              locale: '',
                            );
                          });
                        },
                        text: FFLocalizations.of(context).getText(
                          'lsw6l5f1' /* 15% */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 24.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            _model.backGroundColor15,
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Manrope',
                                    color: valueOrDefault<Color>(
                                      _model.textColor15,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                          borderSide: BorderSide(
                            color: valueOrDefault<Color>(
                              _model.borderColor15,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.backGroundColor10 =
                              FlutterFlowTheme.of(context).secondaryBackground;
                          _model.textColor10 =
                              FlutterFlowTheme.of(context).primary;
                          _model.borderColor10 =
                              FlutterFlowTheme.of(context).primary;
                          _model.backGroundColor15 =
                              FlutterFlowTheme.of(context).secondaryBackground;
                          _model.textColor15 =
                              FlutterFlowTheme.of(context).primary;
                          _model.borderColor15 =
                              FlutterFlowTheme.of(context).primary;
                          _model.backGroundColor20 =
                              FlutterFlowTheme.of(context).primary;
                          _model.textColor20 =
                              FlutterFlowTheme.of(context).secondaryBackground;
                          _model.borderColor20 = Color(0x00000000);
                          safeSetState(() {});
                          safeSetState(() {
                            _model.tipAmountTextController?.text = formatNumber(
                              widget!.orderParameters!.subtotal * 20 / 100,
                              formatType: FormatType.custom,
                              format: '0.00',
                              locale: '',
                            );
                          });
                        },
                        text: FFLocalizations.of(context).getText(
                          'kda6uge1' /* 20% */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 24.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            _model.backGroundColor20,
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Manrope',
                                    color: valueOrDefault<Color>(
                                      _model.textColor20,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                          borderSide: BorderSide(
                            color: valueOrDefault<Color>(
                              _model.borderColor20,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                child: TextFormField(
                  controller: _model.tipAmountTextController,
                  focusNode: _model.tipAmountFocusNode,
                  textInputAction: TextInputAction.done,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: FFLocalizations.of(context).getText(
                      'mqb3zuyg' /* CHF 0.00 (Comma [ , ] not allo... */,
                    ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 32.0, 20.0, 12.0),
                  ),
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                  textAlign: TextAlign.start,
                  validator: _model.tipAmountTextControllerValidator
                      .asValidator(context),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('^([0-9]+\\.?[0-9]*|[0-9]*\\.?[0-9]+)\$'))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await widget!.orderParameters!.reference
                              .update(createCartsRecordData(
                            tip: double.tryParse(
                                _model.tipAmountTextController.text),
                            total: functions.tipCalculate(
                                widget!.orderParameters!.subtotal,
                                double.parse(
                                    _model.tipAmountTextController.text),
                                widget!.orderParameters!.discount,
                                widget!.orderParameters!.extraCharge),
                          ));
                          Navigator.pop(context);
                        },
                        text: FFLocalizations.of(context).getText(
                          'h9xjt5sp' /* Add */,
                        ),
                        options: FFButtonOptions(
                          width: 200.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Manrope',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    if (widget!.orderParameters!.tip > 0.0)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 24.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await widget!.orderParameters!.reference
                                .update(createCartsRecordData(
                              tip: 0.0,
                              total: functions.tipCalculate(
                                  widget!.orderParameters!.subtotal,
                                  0.0,
                                  widget!.orderParameters!.discount,
                                  widget!.orderParameters!.extraCharge),
                            ));
                            Navigator.pop(context);
                          },
                          text: FFLocalizations.of(context).getText(
                            'qnih1ex7' /* Remove */,
                          ),
                          options: FFButtonOptions(
                            width: 115.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).customColor3,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                  ].divide(SizedBox(width: 10.0)).around(SizedBox(width: 10.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
