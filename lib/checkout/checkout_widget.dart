import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/components/discount_sheet/discount_sheet_widget.dart';
import '/components/extra_charge_sheet/extra_charge_sheet_widget.dart';
import '/components/tip_sheet/tip_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'checkout_model.dart';
export 'checkout_model.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({
    Key? key,
    this.orderParametres,
  }) : super(key: key);

  final CartsRecord? orderParametres;

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  late CheckoutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckoutModel());

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

    return StreamBuilder<List<CartsRecord>>(
      stream: queryCartsRecord(
        queryBuilder: (cartsRecord) => cartsRecord
            .where('orderID', isEqualTo: widget.orderParametres?.orderID)
            .where('tableID', isEqualTo: widget.orderParametres?.tableID),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<CartsRecord> checkoutCartsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final checkoutCartsRecord = checkoutCartsRecordList.isNotEmpty
            ? checkoutCartsRecordList.first
            : null;
        return Title(
            title: 'Checkout',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () =>
                  FocusScope.of(context).requestFocus(_model.unfocusNode),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: NestedScrollView(
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (context, _) => [
                    SliverAppBar(
                      pinned: false,
                      floating: false,
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      automaticallyImplyLeading: false,
                      actions: [],
                      flexibleSpace: FlexibleSpaceBar(
                        title: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.safePop();
                                    },
                                    child: Icon(
                                      Icons.chevron_left,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 36.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        centerTitle: true,
                        expandedTitleScale: 1.0,
                      ),
                      elevation: 0.0,
                    )
                  ],
                  body: Builder(
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 142.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              FlutterFlowTheme.of(context)
                                                  .primaryText
                                            ],
                                            stops: [0.0, 1.0],
                                            begin: AlignmentDirectional(
                                                0.94, -1.0),
                                            end: AlignmentDirectional(
                                                -0.94, 1.0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 15.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          widget.orderParametres
                                                              ?.restaurantName,
                                                          'Restaurant?',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium,
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    'Table: ${widget.orderParametres?.cartTable}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 5.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Icon(
                                                    Icons.payments,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 36.0,
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      checkoutCartsRecord!
                                                          .total,
                                                      formatType:
                                                          FormatType.custom,
                                                      currency: 'CHF ',
                                                      format: '0.00',
                                                      locale: '',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 24.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.00, 0.00),
                                                    child: GradientText(
                                                      'Tip : ${formatNumber(
                                                        checkoutCartsRecord
                                                            ?.tip,
                                                        formatType:
                                                            FormatType.custom,
                                                        format: '0.00',
                                                        locale: '',
                                                      )}',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      colors: [
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary
                                                      ],
                                                      gradientDirection:
                                                          GradientDirection.ltr,
                                                      gradientType:
                                                          GradientType.linear,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child:
                                        StreamBuilder<List<ItemDetailRecord>>(
                                      stream: queryItemDetailRecord(
                                        queryBuilder: (itemDetailRecord) =>
                                            itemDetailRecord.where('cartRef',
                                                isEqualTo: checkoutCartsRecord
                                                    ?.reference),
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
                                        List<ItemDetailRecord>
                                            listViewItemDetailRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewItemDetailRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewItemDetailRecord =
                                                listViewItemDetailRecordList[
                                                    listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 8.0, 16.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x320E151B),
                                                      offset: Offset(0.0, 1.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 8.0, 8.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    '${listViewItemDetailRecord.quantity.toString()} X',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    listViewItemDetailRecord
                                                                        .name,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            if (listViewItemDetailRecord
                                                                        .modifiers !=
                                                                    null &&
                                                                listViewItemDetailRecord
                                                                        .modifiers !=
                                                                    '')
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: Text(
                                                                  listViewItemDetailRecord
                                                                      .modifiers,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                ),
                                                              ),
                                                            Text(
                                                              formatNumber(
                                                                listViewItemDetailRecord
                                                                    .price,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '0.00',
                                                                locale: '',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.role,
                                                              '') !=
                                                          'User')
                                                        AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .delete_outline_rounded,
                                                              color: Color(
                                                                  0xFFE86969),
                                                              size: 20.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await listViewItemDetailRecord
                                                                  .reference
                                                                  .delete();

                                                              await checkoutCartsRecord!
                                                                  .reference
                                                                  .update({
                                                                'subtotal': FieldValue.increment(-(functions.deleteItem(
                                                                    listViewItemDetailRecord
                                                                        .quantity,
                                                                    listViewItemDetailRecord
                                                                        .price))),
                                                                'cartItems':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  widget.orderParametres
                                                                          ?.cartItems?[
                                                                      listViewIndex]
                                                                ]),
                                                                'total': FieldValue.increment(-(functions.totalCalculate(
                                                                    checkoutCartsRecord!
                                                                        .extraCharge,
                                                                    checkoutCartsRecord!
                                                                        .tip,
                                                                    checkoutCartsRecord!
                                                                        .discount,
                                                                    listViewItemDetailRecord
                                                                        .quantity,
                                                                    listViewItemDetailRecord
                                                                        .price))),
                                                                'itemCount': FieldValue
                                                                    .increment(
                                                                        -(listViewItemDetailRecord
                                                                            .quantity)),
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 16.0, 24.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Price Breakdown',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 4.0, 24.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Subtotal',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge,
                                        ),
                                        Text(
                                          formatNumber(
                                            checkoutCartsRecord!.subtotal,
                                            formatType: FormatType.custom,
                                            currency: 'CHF ',
                                            format: '0.00',
                                            locale: '',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 4.0, 24.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Extra charges',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge,
                                        ),
                                        Text(
                                          formatNumber(
                                            checkoutCartsRecord!.extraCharge,
                                            formatType: FormatType.custom,
                                            currency: '+',
                                            format: '0.00',
                                            locale: '',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 4.0, 24.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Discount',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge,
                                        ),
                                        Text(
                                          formatNumber(
                                            checkoutCartsRecord!.discount,
                                            formatType: FormatType.custom,
                                            currency: '-',
                                            format: '0.00',
                                            locale: '',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 4.0, 24.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Tip',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge,
                                        ),
                                        Text(
                                          formatNumber(
                                            checkoutCartsRecord!.tip,
                                            formatType: FormatType.custom,
                                            currency: '+',
                                            format: '0.00',
                                            locale: '',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 4.0, 24.0, 24.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Total',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge,
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 36.0,
                                              icon: Icon(
                                                Icons.info_outlined,
                                                color: Color(0xFF57636C),
                                                size: 18.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ],
                                        ),
                                        Text(
                                          formatNumber(
                                            checkoutCartsRecord!.total,
                                            formatType: FormatType.custom,
                                            currency: 'CHF ',
                                            format: '0.00',
                                            locale: '',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 18.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          if (valueOrDefault(
                                                  currentUserDocument?.role,
                                                  '') ==
                                              'User')
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 16.0, 0.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => FocusScope
                                                                    .of(context)
                                                                .requestFocus(_model
                                                                    .unfocusNode),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  TipSheetWidget(
                                                                orderParameters:
                                                                    checkoutCartsRecord!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    text: 'Tip',
                                                    options: FFButtonOptions(
                                                      height: 70.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if ((valueOrDefault(
                                                      currentUserDocument?.role,
                                                      '') ==
                                                  'Admin') ||
                                              (valueOrDefault(
                                                      currentUserDocument?.role,
                                                      '') ==
                                                  'Staff'))
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 16.0, 0.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => FocusScope
                                                                    .of(context)
                                                                .requestFocus(_model
                                                                    .unfocusNode),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  ExtraChargeSheetWidget(
                                                                orderParameters:
                                                                    checkoutCartsRecord!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    text: '\$',
                                                    options: FFButtonOptions(
                                                      width: 70.0,
                                                      height: 70.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if ((valueOrDefault(
                                                      currentUserDocument?.role,
                                                      '') ==
                                                  'Admin') ||
                                              (valueOrDefault(
                                                      currentUserDocument?.role,
                                                      '') ==
                                                  'Staff'))
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 16.0, 0.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => FocusScope
                                                                    .of(context)
                                                                .requestFocus(_model
                                                                    .unfocusNode),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  DiscountSheetWidget(
                                                                orderParameters:
                                                                    checkoutCartsRecord!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    text: '%',
                                                    options: FFButtonOptions(
                                                      width: 70.0,
                                                      height: 70.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor4,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (valueOrDefault(
                                                  currentUserDocument?.role,
                                                  '') ==
                                              'User')
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 16.0, 0.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                    onPressed: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      final paymentResponse =
                                                          await processStripePayment(
                                                        context,
                                                        amount: functions
                                                            .stripePay(
                                                                checkoutCartsRecord!
                                                                    .total)
                                                            .round(),
                                                        currency: 'CHF',
                                                        customerEmail:
                                                            currentUserEmail,
                                                        customerName:
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.name,
                                                                ''),
                                                        description:
                                                            'OrderNow Pay',
                                                        allowGooglePay: false,
                                                        allowApplePay: true,
                                                        themeStyle:
                                                            ThemeMode.light,
                                                        buttonColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        buttonTextColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      );
                                                      if (paymentResponse
                                                              .paymentId ==
                                                          null) {
                                                        if (paymentResponse
                                                                .errorMessage !=
                                                            null) {
                                                          showSnackbar(
                                                            context,
                                                            'Error: ${paymentResponse.errorMessage}',
                                                          );
                                                        }
                                                        return;
                                                      }
                                                      _model.paymentId =
                                                          paymentResponse
                                                              .paymentId!;

                                                      _shouldSetState = true;
                                                      if (_model.paymentId !=
                                                              null &&
                                                          _model.paymentId !=
                                                              '') {
                                                        await widget
                                                            .orderParametres!
                                                            .reference
                                                            .update(
                                                                createCartsRecordData(
                                                          stripePaymentID:
                                                              _model.paymentId,
                                                          cartActive: false,
                                                          cartPaid: true,
                                                          payerName: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.name,
                                                              ''),
                                                          tableID: '-',
                                                          restaurantPaid: false,
                                                        ));

                                                        context.goNamed(
                                                            'Dashboard');
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .clearSnackBars();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Payment error, please try a valid payment method',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                  ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      }

                                                      if (_shouldSetState)
                                                        setState(() {});
                                                    },
                                                    text: 'Pay',
                                                    options: FFButtonOptions(
                                                      width: 80.0,
                                                      height: 70.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor4,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
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
                        ],
                      );
                    },
                  ),
                ),
              ),
            ));
      },
    );
  }
}
