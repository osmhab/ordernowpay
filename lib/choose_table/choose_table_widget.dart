import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_table_model.dart';
export 'choose_table_model.dart';

class ChooseTableWidget extends StatefulWidget {
  const ChooseTableWidget({Key? key}) : super(key: key);

  @override
  _ChooseTableWidgetState createState() => _ChooseTableWidgetState();
}

class _ChooseTableWidgetState extends State<ChooseTableWidget> {
  late ChooseTableModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseTableModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Scan table',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                context.pushNamed('Dashboard');
              },
            ),
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'op19v9hx' /* Cancel */,
                ),
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Open Sans',
                      fontSize: 16.0,
                    ),
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.00, -1.00),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 150.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '42apecf9' /* Scan table */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 25.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'n6uyvtcn' /* If you want to take a new orde... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 25.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var _shouldSetState = false;
                      _model.scanResult =
                          await FlutterBarcodeScanner.scanBarcode(
                        '#C62828', // scanning line color
                        FFLocalizations.of(context).getText(
                          'pxkewsky' /* Cancel */,
                        ), // cancel button text
                        true, // whether to show the flash icon
                        ScanMode.QR,
                      );

                      _shouldSetState = true;
                      _model.tableFound = await queryTablesRecordOnce(
                        queryBuilder: (tablesRecord) => tablesRecord.where(
                          'tableID',
                          isEqualTo: _model.scanResult,
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      _shouldSetState = true;
                      if ((_model.scanResult == _model.tableFound?.tableID) &&
                          (_model.tableFound?.tableInUse == false)) {
                        _model.queryUserResult = await queryUsersRecordOnce(
                          queryBuilder: (usersRecord) => usersRecord.where(
                            'userRef',
                            isEqualTo: currentUserDocument?.userRef,
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        _shouldSetState = true;

                        var cartsRecordReference = CartsRecord.collection.doc();
                        await cartsRecordReference.set({
                          ...createCartsRecordData(
                            userRef: currentUserDocument?.userRef,
                            itemCount: 0,
                            cartActive: true,
                            subtotal: 0.0,
                            total: 0.0,
                            discount: 0.0,
                            extraCharge: 0.0,
                            cartTable: _model.tableFound?.tableName,
                            tableID: _model.tableFound?.reference.id,
                            restaurantName: _model.queryUserResult?.storeName,
                            createdByName:
                                valueOrDefault(currentUserDocument?.name, ''),
                            createdByPhoto: currentUserPhoto,
                            beneficiaryAdress:
                                _model.queryUserResult?.beneficiaireAdresse,
                            beneficiaryName:
                                _model.queryUserResult?.beneficiaireName,
                            restaurantAdress:
                                _model.queryUserResult?.storeLocality,
                            iban: _model.queryUserResult?.bankIBAN,
                            role: valueOrDefault(currentUserDocument?.role, ''),
                            staffBenefName: valueOrDefault(
                                currentUserDocument?.beneficiaireName, ''),
                            staffBenefAdress: valueOrDefault(
                                currentUserDocument?.beneficiaireAdresse, ''),
                            staffBenefIBAN: valueOrDefault(
                                currentUserDocument?.bankIBAN, ''),
                          ),
                          ...mapToFirestore(
                            {
                              'created_at': FieldValue.serverTimestamp(),
                            },
                          ),
                        });
                        _model.createdOrder = CartsRecord.getDocumentFromData({
                          ...createCartsRecordData(
                            userRef: currentUserDocument?.userRef,
                            itemCount: 0,
                            cartActive: true,
                            subtotal: 0.0,
                            total: 0.0,
                            discount: 0.0,
                            extraCharge: 0.0,
                            cartTable: _model.tableFound?.tableName,
                            tableID: _model.tableFound?.reference.id,
                            restaurantName: _model.queryUserResult?.storeName,
                            createdByName:
                                valueOrDefault(currentUserDocument?.name, ''),
                            createdByPhoto: currentUserPhoto,
                            beneficiaryAdress:
                                _model.queryUserResult?.beneficiaireAdresse,
                            beneficiaryName:
                                _model.queryUserResult?.beneficiaireName,
                            restaurantAdress:
                                _model.queryUserResult?.storeLocality,
                            iban: _model.queryUserResult?.bankIBAN,
                            role: valueOrDefault(currentUserDocument?.role, ''),
                            staffBenefName: valueOrDefault(
                                currentUserDocument?.beneficiaireName, ''),
                            staffBenefAdress: valueOrDefault(
                                currentUserDocument?.beneficiaireAdresse, ''),
                            staffBenefIBAN: valueOrDefault(
                                currentUserDocument?.bankIBAN, ''),
                          ),
                          ...mapToFirestore(
                            {
                              'created_at': DateTime.now(),
                            },
                          ),
                        }, cartsRecordReference);
                        _shouldSetState = true;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Table not found or already in use',
                              style: TextStyle(
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: FlutterFlowTheme.of(context).error,
                          ),
                        );
                        if (_shouldSetState) setState(() {});
                        return;
                      }

                      context.goNamed(
                        'Dashboard',
                        queryParameters: {
                          'ordersParams': serializeParam(
                            _model.createdOrder,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'ordersParams': _model.createdOrder,
                        },
                      );

                      if (_shouldSetState) setState(() {});
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
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context).titleSmall,
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
