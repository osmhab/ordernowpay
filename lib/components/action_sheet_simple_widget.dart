import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'action_sheet_simple_model.dart';
export 'action_sheet_simple_model.dart';

class ActionSheetSimpleWidget extends StatefulWidget {
  const ActionSheetSimpleWidget({
    super.key,
    required this.order,
    this.revenues,
  });

  final CartsRecord? order;
  final RevenuesRecord? revenues;

  @override
  State<ActionSheetSimpleWidget> createState() =>
      _ActionSheetSimpleWidgetState();
}

class _ActionSheetSimpleWidgetState extends State<ActionSheetSimpleWidget> {
  late ActionSheetSimpleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionSheetSimpleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x3B1D2429),
              offset: Offset(
                0.0,
                -3.0,
              ),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '8nrly5sf' /* Complete the payment manually */,
                  ),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  await widget!.order!.reference.update({
                    ...createCartsRecordData(
                      cartActive: false,
                      cartPaid: true,
                      paymentMethod: 'Card',
                      photoPaidBy:
                          'https://firebasestorage.googleapis.com/v0/b/ordernowpay-58d66.appspot.com/o/LogoColorIconApp.png?alt=media&token=f2e996ba-9a73-4bb5-99e1-96207637f819',
                    ),
                    ...mapToFirestore(
                      {
                        'paidAt': FieldValue.serverTimestamp(),
                      },
                    ),
                  });

                  await RevenuesRecord.collection.doc().set({
                    ...createRevenuesRecordData(
                      userRef: currentUserDocument?.userRef,
                      amount: widget!.order?.total,
                    ),
                    ...mapToFirestore(
                      {
                        'Date': FieldValue.serverTimestamp(),
                      },
                    ),
                  });
                  Navigator.pop(context);

                  context.goNamed(
                    'Dashboard',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.topToBottom,
                        duration: Duration(milliseconds: 250),
                      ),
                    },
                  );
                },
                text: FFLocalizations.of(context).getText(
                  'ltdut29n' /* Process card payment */,
                ),
                icon: Icon(
                  Icons.credit_card,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Manrope',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 1.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await widget!.order!.reference.update({
                      ...createCartsRecordData(
                        cartActive: false,
                        cartPaid: true,
                        paymentMethod: 'Cash',
                        photoPaidBy:
                            'https://firebasestorage.googleapis.com/v0/b/ordernowpay-58d66.appspot.com/o/LogoColorIconApp.png?alt=media&token=f2e996ba-9a73-4bb5-99e1-96207637f819',
                      ),
                      ...mapToFirestore(
                        {
                          'paidAt': FieldValue.serverTimestamp(),
                        },
                      ),
                    });

                    await RevenuesRecord.collection.doc().set({
                      ...createRevenuesRecordData(
                        userRef: currentUserDocument?.userRef,
                        amount: widget!.order?.total,
                      ),
                      ...mapToFirestore(
                        {
                          'Date': FieldValue.serverTimestamp(),
                        },
                      ),
                    });
                    Navigator.pop(context);

                    context.goNamed(
                      'Dashboard',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.topToBottom,
                          duration: Duration(milliseconds: 250),
                        ),
                      },
                    );
                  },
                  text: FFLocalizations.of(context).getText(
                    'e9zeehlo' /* Process cash payment */,
                  ),
                  icon: FaIcon(
                    FontAwesomeIcons.coins,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: FFLocalizations.of(context).getText(
                    '3gnyzlxn' /* Cancel */,
                  ),
                  icon: Icon(
                    Icons.arrow_downward_outlined,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
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
