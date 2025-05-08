import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/account_blocked_widget.dart';
import '/components/add_bank_details_widget.dart';
import '/components/add_your_first_item_widget.dart';
import '/components/add_your_first_table_widget.dart';
import '/components/business_table_already_in_use_widget.dart';
import '/components/q_r_code_is_not_valid_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_table_model.dart';
export 'choose_table_model.dart';

class ChooseTableWidget extends StatefulWidget {
  const ChooseTableWidget({super.key});

  @override
  State<ChooseTableWidget> createState() => _ChooseTableWidgetState();
}

class _ChooseTableWidgetState extends State<ChooseTableWidget>
    with TickerProviderStateMixin {
  late ChooseTableModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseTableModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault(currentUserDocument?.invitation, '') == 'Cancelled') {
        // ShowBlockedAccount
        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.8,
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: AccountBlockedWidget(),
              ),
            );
          },
        );
      } else {
        return;
      }
    });

    animationsMap.addAll({
      'addYourFirstTableOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -10.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'addYourFirstItemOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 50.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -10.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'addBankDetailsOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -10.0),
            end: Offset(0.0, 0.0),
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
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => Title(
          title: 'Scan table',
          color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'sn8jl7c2' /* Scan table */,
                  ),
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Manrope',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (FFAppState().tablesCount < 1)
                      wrapWithModel(
                        model: _model.addYourFirstTableModel,
                        updateCallback: () => safeSetState(() {}),
                        child: AddYourFirstTableWidget(),
                      ).animateOnPageLoad(animationsMap[
                          'addYourFirstTableOnPageLoadAnimation']!),
                    if (FFAppState().itemsCount < 1)
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: wrapWithModel(
                          model: _model.addYourFirstItemModel,
                          updateCallback: () => safeSetState(() {}),
                          child: AddYourFirstItemWidget(),
                        ).animateOnPageLoad(animationsMap[
                            'addYourFirstItemOnPageLoadAnimation']!),
                      ),
                    if ((valueOrDefault(currentUserDocument?.bankIBAN, '') ==
                                null ||
                            valueOrDefault(currentUserDocument?.bankIBAN, '') ==
                                '') ||
                        (valueOrDefault(currentUserDocument?.beneficiaireName,
                                    '') ==
                                null ||
                            valueOrDefault(
                                    currentUserDocument?.beneficiaireName,
                                    '') ==
                                '') ||
                        (valueOrDefault(
                                    currentUserDocument?.beneficiaireAdresse,
                                    '') ==
                                null ||
                            valueOrDefault(
                                    currentUserDocument?.beneficiaireAdresse,
                                    '') ==
                                ''))
                      AuthUserStreamWidget(
                        builder: (context) => wrapWithModel(
                          model: _model.addBankDetailsModel,
                          updateCallback: () => safeSetState(() {}),
                          child: AddBankDetailsWidget(),
                        ).animateOnPageLoad(animationsMap[
                            'addBankDetailsOnPageLoadAnimation']!),
                      ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    height: 110.0,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Builder(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 25.0, 36.0),
                              child: FFButtonWidget(
                                onPressed: ((FFAppState().tablesCount < 1) ||
                                        (FFAppState().itemsCount < 1))
                                    ? null
                                    : () async {
                                        var _shouldSetState = false;
                                        _model.scanResult =
                                            await FlutterBarcodeScanner
                                                .scanBarcode(
                                          '#C62828', // scanning line color
                                          FFLocalizations.of(context).getText(
                                            'pxkewsky' /* Cancel */,
                                          ), // cancel button text
                                          true, // whether to show the flash icon
                                          ScanMode.QR,
                                        );

                                        _shouldSetState = true;
                                        // searchTableInMyList
                                        _model.tableFound =
                                            await queryTablesRecordOnce(
                                          queryBuilder: (tablesRecord) =>
                                              tablesRecord
                                                  .where(
                                                    'tableID',
                                                    isEqualTo: functions
                                                        .containsSubstring(
                                                            _model.scanResult,
                                                            '/table/'),
                                                  )
                                                  .where(
                                                    'userRef',
                                                    isEqualTo:
                                                        currentUserDocument
                                                            ?.userRef,
                                                  ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        _shouldSetState = true;
                                        if (functions.containsSubstring(
                                                _model.scanResult, '/table/') !=
                                            _model.tableFound?.tableID) {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.5,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.9,
                                                  child:
                                                      QRCodeIsNotValidWidget(),
                                                ),
                                              );
                                            },
                                          );

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        _model.cartInUseFound =
                                            await queryCartsRecordOnce(
                                          queryBuilder: (cartsRecord) =>
                                              cartsRecord
                                                  .where(
                                                    'cartActive',
                                                    isEqualTo: true,
                                                  )
                                                  .where(
                                                    'tableID',
                                                    isEqualTo: functions
                                                        .containsSubstring(
                                                            _model.scanResult,
                                                            '/table/'),
                                                  ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        _shouldSetState = true;
                                        if (functions.containsSubstring(
                                                _model.scanResult, '/table/') !=
                                            _model.cartInUseFound?.tableID) {
                                          _model.queryUserResult =
                                              await queryUsersRecordOnce(
                                            queryBuilder: (usersRecord) =>
                                                usersRecord.where(
                                              'userRef',
                                              isEqualTo:
                                                  currentUserDocument?.userRef,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          _shouldSetState = true;

                                          var cartsRecordReference =
                                              CartsRecord.collection.doc();
                                          await cartsRecordReference.set({
                                            ...createCartsRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              itemCount: 0,
                                              cartActive: true,
                                              subtotal: 0.0,
                                              total: 0.0,
                                              discount: 0.0,
                                              extraCharge: 0.0,
                                              cartTable:
                                                  _model.tableFound?.tableName,
                                              tableID: _model
                                                  .tableFound?.reference.id,
                                              restaurantName: _model
                                                  .queryUserResult?.storeName,
                                              createdByName: valueOrDefault(
                                                  currentUserDocument?.name,
                                                  ''),
                                              createdByPhoto: currentUserPhoto,
                                              beneficiaryAdress: valueOrDefault(
                                                  currentUserDocument
                                                      ?.beneficiaireAdresse,
                                                  ''),
                                              beneficiaryName: valueOrDefault(
                                                  currentUserDocument
                                                      ?.beneficiaireName,
                                                  ''),
                                              restaurantAdress: _model
                                                  .queryUserResult
                                                  ?.storeLocality,
                                              iban: valueOrDefault(
                                                  currentUserDocument?.bankIBAN,
                                                  ''),
                                              role: valueOrDefault(
                                                  currentUserDocument?.role,
                                                  ''),
                                              storeEmail: valueOrDefault(
                                                  currentUserDocument
                                                      ?.storeEmail,
                                                  ''),
                                              storeBenefName: _model
                                                  .queryUserResult
                                                  ?.beneficiaireName,
                                              storeBenefAdress: _model
                                                  .queryUserResult
                                                  ?.beneficiaireAdresse,
                                              storeBenefIBAN: _model
                                                  .queryUserResult?.bankIBAN,
                                              createdByEmail: currentUserEmail,
                                              read: false,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'created_at': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          _model.createdOrder =
                                              CartsRecord.getDocumentFromData({
                                            ...createCartsRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              itemCount: 0,
                                              cartActive: true,
                                              subtotal: 0.0,
                                              total: 0.0,
                                              discount: 0.0,
                                              extraCharge: 0.0,
                                              cartTable:
                                                  _model.tableFound?.tableName,
                                              tableID: _model
                                                  .tableFound?.reference.id,
                                              restaurantName: _model
                                                  .queryUserResult?.storeName,
                                              createdByName: valueOrDefault(
                                                  currentUserDocument?.name,
                                                  ''),
                                              createdByPhoto: currentUserPhoto,
                                              beneficiaryAdress: valueOrDefault(
                                                  currentUserDocument
                                                      ?.beneficiaireAdresse,
                                                  ''),
                                              beneficiaryName: valueOrDefault(
                                                  currentUserDocument
                                                      ?.beneficiaireName,
                                                  ''),
                                              restaurantAdress: _model
                                                  .queryUserResult
                                                  ?.storeLocality,
                                              iban: valueOrDefault(
                                                  currentUserDocument?.bankIBAN,
                                                  ''),
                                              role: valueOrDefault(
                                                  currentUserDocument?.role,
                                                  ''),
                                              storeEmail: valueOrDefault(
                                                  currentUserDocument
                                                      ?.storeEmail,
                                                  ''),
                                              storeBenefName: _model
                                                  .queryUserResult
                                                  ?.beneficiaireName,
                                              storeBenefAdress: _model
                                                  .queryUserResult
                                                  ?.beneficiaireAdresse,
                                              storeBenefIBAN: _model
                                                  .queryUserResult?.bankIBAN,
                                              createdByEmail: currentUserEmail,
                                              read: false,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'created_at': DateTime.now(),
                                              },
                                            ),
                                          }, cartsRecordReference);
                                          _shouldSetState = true;

                                          await _model.createdOrder!.reference
                                              .update(createCartsRecordData(
                                            orderID: _model
                                                .createdOrder?.reference.id,
                                          ));
                                          await queryCartsRecordOnce(
                                            queryBuilder: (cartsRecord) =>
                                                cartsRecord.where(
                                              'orderID',
                                              isEqualTo: _model
                                                  .createdOrder?.reference.id,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);

                                          context.pushNamed('Dashboard');
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.5,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.9,
                                                  child:
                                                      BusinessTableAlreadyInUseWidget(),
                                                ),
                                              );
                                            },
                                          );

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                text: FFLocalizations.of(context).getText(
                                  '4w77qrpw' /* Scan table QR */,
                                ),
                                icon: Icon(
                                  Icons.qr_code,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 60.0,
                                  padding: EdgeInsets.all(8.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  disabledColor:
                                      FlutterFlowTheme.of(context).grayIcon,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
