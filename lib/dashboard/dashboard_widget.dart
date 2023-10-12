import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/order_list_empty/order_list_empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({
    Key? key,
    this.ordersParams,
    this.tableParams,
    this.itemsParams,
  }) : super(key: key);

  final CartsRecord? ordersParams;
  final TablesRecord? tableParams;
  final MenuItemsRecord? itemsParams;

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

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
        title: 'Dashboard',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                leading: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: AuthUserStreamWidget(
                        builder: (context) => badges.Badge(
                          badgeContent: Text(
                            FFLocalizations.of(context).getText(
                              'pwc11enu' /* ! */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: Colors.white,
                                ),
                          ),
                          showBadge: (valueOrDefault(
                                          currentUserDocument?.beneficiaireName,
                                          '') ==
                                      null ||
                                  valueOrDefault(
                                          currentUserDocument?.beneficiaireName,
                                          '') ==
                                      '') ||
                              (valueOrDefault(
                                          currentUserDocument
                                              ?.beneficiaireAdresse,
                                          '') ==
                                      null ||
                                  valueOrDefault(
                                          currentUserDocument
                                              ?.beneficiaireAdresse,
                                          '') ==
                                      '') ||
                              (valueOrDefault(
                                          currentUserDocument?.bankIBAN, '') ==
                                      null ||
                                  valueOrDefault(
                                          currentUserDocument?.bankIBAN, '') ==
                                      ''),
                          shape: badges.BadgeShape.circle,
                          badgeColor: FlutterFlowTheme.of(context).error,
                          elevation: 4.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 8.0),
                          position: badges.BadgePosition.topEnd(),
                          animationType: badges.BadgeAnimationType.scale,
                          toAnimate: true,
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'MyAccount',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.leftToRight,
                              ),
                            },
                          );
                        },
                        child: Icon(
                          Icons.menu_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 36.0,
                        ),
                      ),
                    ),
                  ],
                ),
                actions: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (valueOrDefault(currentUserDocument?.role, '') ==
                          'User')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 15.0, 5.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                _model.scanResult =
                                    await FlutterBarcodeScanner.scanBarcode(
                                  '#C62828', // scanning line color
                                  FFLocalizations.of(context).getText(
                                    '60cbeqlx' /* Cancel */,
                                  ), // cancel button text
                                  true, // whether to show the flash icon
                                  ScanMode.QR,
                                );

                                _shouldSetState = true;
                                _model.tableFound = await queryCartsRecordOnce(
                                  queryBuilder: (cartsRecord) =>
                                      cartsRecord.where(
                                    'tableID',
                                    isEqualTo: _model.scanResult,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                _shouldSetState = true;
                                if (_model.tableFound!.cartActive) {
                                  context.pushNamed(
                                    'Checkout',
                                    queryParameters: {
                                      'orderParametres': serializeParam(
                                        _model.tableFound,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'orderParametres': _model.tableFound,
                                    },
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Table is not active or invalid QR. Retry please.',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                if (_shouldSetState) setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '0n8cqwso' /* Scan table */,
                              ),
                              icon: Icon(
                                Icons.qr_code_scanner,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 97.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x004B39EF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      if ((valueOrDefault(currentUserDocument?.role, '') ==
                              'Admin') ||
                          (valueOrDefault(currentUserDocument?.role, '') ==
                              'Staff'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 15.0, 5.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'ChooseTable',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'l2bhjwd9' /* New order */,
                              ),
                              options: FFButtonOptions(
                                height: 97.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x004B39EF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
                centerTitle: false,
                elevation: 0.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 44.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AuthUserStreamWidget(
                                          builder: (context) => Container(
                                            width: 40.0,
                                            height: 40.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: currentUserPhoto,
                                              fit: BoxFit.cover,
                                              errorWidget: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 16.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        AuthUserStreamWidget(
                                          builder: (context) => AutoSizeText(
                                            'Hello ${valueOrDefault(currentUserDocument?.name, '')}',
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 16.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '9akdegwo' /* Good to see you. */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ),
                                  if ((valueOrDefault(
                                              currentUserDocument?.role, '') ==
                                          'Admin') ||
                                      (valueOrDefault(
                                              currentUserDocument?.role, '') ==
                                          'Staff'))
                                    Opacity(
                                      opacity: 100.0,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 12.0, 20.0, 12.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) =>
                                              FutureBuilder<int>(
                                            future: queryCartsRecordCount(
                                              queryBuilder: (cartsRecord) =>
                                                  cartsRecord
                                                      .where(
                                                        'userRef',
                                                        isEqualTo:
                                                            currentUserDocument
                                                                ?.userRef,
                                                      )
                                                      .where(
                                                        'cartActive',
                                                        isEqualTo: true,
                                                      ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              int adminOrStaffViewCount =
                                                  snapshot.data!;
                                              return Container(
                                                width: double.infinity,
                                                height: 130.0,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x34090F13),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFF673AB7),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        -1.0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 8.0, 12.0, 8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'vj7v2whv' /* Daily tracker */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                ),
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'pz7n52zr' /* Active orders: */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                formatNumber(
                                                                  adminOrStaffViewCount,
                                                                  formatType:
                                                                      FormatType
                                                                          .custom,
                                                                  format: '##',
                                                                  locale: '',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Visibility(
                                visible: (valueOrDefault(
                                            currentUserDocument?.role, '') ==
                                        'Admin') ||
                                    (valueOrDefault(
                                            currentUserDocument?.role, '') ==
                                        'Staff'),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 20.0, 16.0, 20.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        StreamBuilder<List<CartsRecord>>(
                                      stream: queryCartsRecord(
                                        queryBuilder: (cartsRecord) =>
                                            cartsRecord
                                                .where(
                                                  'userRef',
                                                  isEqualTo: currentUserDocument
                                                      ?.userRef,
                                                )
                                                .where(
                                                  'cartActive',
                                                  isEqualTo: true,
                                                )
                                                .orderBy('created_at',
                                                    descending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<CartsRecord>
                                            listViewCartsRecordList =
                                            snapshot.data!;
                                        if (listViewCartsRecordList.isEmpty) {
                                          return Center(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              child: OrderListEmptyWidget(),
                                            ),
                                          );
                                        }
                                        return ListView.separated(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20.0),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewCartsRecordList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 20.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewCartsRecord =
                                                listViewCartsRecordList[
                                                    listViewIndex];
                                            return Visibility(
                                              visible: (listViewCartsRecord
                                                          .cartActive ==
                                                      true) &&
                                                  (listViewCartsRecord
                                                              .orderID !=
                                                          null &&
                                                      listViewCartsRecord
                                                              .orderID !=
                                                          ''),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'NewOrder',
                                                      queryParameters: {
                                                        'orderParams':
                                                            serializeParam(
                                                          listViewCartsRecord,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'orderParams':
                                                            listViewCartsRecord,
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .rightToLeft,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 470.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 3.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset:
                                                              Offset(0.0, 1.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  16.0,
                                                                  16.0,
                                                                  16.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                            child:
                                                                CachedNetworkImage(
                                                              fadeInDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          500),
                                                              fadeOutDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          500),
                                                              imageUrl:
                                                                  listViewCartsRecord
                                                                      .createdByPhoto,
                                                              width: 60.0,
                                                              height: 60.0,
                                                              fit: BoxFit.cover,
                                                              errorWidget: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                  Image.asset(
                                                                'assets/images/error_image.png',
                                                                width: 60.0,
                                                                height: 60.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        6.0),
                                                            child: Text(
                                                              'Created by ${listViewCartsRecord.createdByName}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        6.0),
                                                            child: Text(
                                                              '${dateTimeFormat(
                                                                'relative',
                                                                listViewCartsRecord
                                                                    .createdAt,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        4.0),
                                                            child: Text(
                                                              'Table ${listViewCartsRecord.cartTable}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLarge,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        12.0),
                                                            child: Text(
                                                              'Order # ${listViewCartsRecord.reference.id}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium,
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  height: 32.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: listViewCartsRecord
                                                                                .total ==
                                                                            0.0
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .secondaryText
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'CHF ${formatNumber(
                                                                        listViewCartsRecord
                                                                            .total,
                                                                        formatType:
                                                                            FormatType.custom,
                                                                        format:
                                                                            '0.00',
                                                                        locale:
                                                                            '',
                                                                      )}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  var confirmDialogResponse =
                                                                      await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Delete Ordrer # ${listViewCartsRecord.reference.id}'),
                                                                                content: Text('Are you sure you want to delete this order?'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancel'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Confirm'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                  if (confirmDialogResponse) {
                                                                    await listViewCartsRecord
                                                                        .reference
                                                                        .delete();
                                                                  } else {
                                                                    return;
                                                                  }
                                                                },
                                                                child: Icon(
                                                                  Icons.delete,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  size: 32.0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
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
              ),
            ),
          ),
        ));
  }
}
