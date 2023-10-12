import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
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
            .where(
              'orderID',
              isEqualTo: widget.orderParametres?.orderID,
            )
            .where(
              'tableID',
              isEqualTo: widget.orderParametres?.tableID,
            )
            .where(
              'cartActive',
              isEqualTo: true,
            ),
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
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child:
                                        StreamBuilder<List<ItemDetailRecord>>(
                                      stream: queryItemDetailRecord(
                                        queryBuilder: (itemDetailRecord) =>
                                            itemDetailRecord.where(
                                          'cartRef',
                                          isEqualTo:
                                              checkoutCartsRecord?.reference,
                                        ),
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
                                                                ...mapToFirestore(
                                                                  {
                                                                    'subtotal': FieldValue.increment(-(functions.deleteItem(
                                                                        listViewItemDetailRecord
                                                                            .quantity,
                                                                        listViewItemDetailRecord
                                                                            .price))),
                                                                    'cartItems':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      widget
                                                                          .orderParametres
                                                                          ?.cartItems?[listViewIndex]
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
                                                                    'itemCount':
                                                                        FieldValue.increment(
                                                                            -(listViewItemDetailRecord.quantity)),
                                                                  },
                                                                ),
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
                                      children: [],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 4.0, 24.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Table ${checkoutCartsRecord?.cartTable}',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${checkoutCartsRecord?.restaurantName}',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            checkoutCartsRecord
                                                ?.restaurantAdress,
                                            'adress?',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          21.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'hflxqq6b' /* Price Breakdown */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
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
                                          FFLocalizations.of(context).getText(
                                            '5ercb35x' /* Subtotal */,
                                          ),
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
                                  if (checkoutCartsRecord!.extraCharge > 0.0)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 4.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'jr1t9dhk' /* Extra charges */,
                                            ),
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
                                  if (checkoutCartsRecord!.discount > 0.0)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 4.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'lliu3wtb' /* Discount */,
                                            ),
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
                                  if (checkoutCartsRecord!.tip > 0.0)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 4.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'rhz0gmgt' /* Tip */,
                                            ),
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
                                  if (checkoutCartsRecord!.tip > 0.0)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 4.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'j33amz85' /* OrderNow Pay fees */,
                                            ),
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
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'afcy56k9' /* Total */,
                                              ),
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
                                            .primaryBtnText,
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
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
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
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
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '5whot6tx' /* Tip */,
                                                      ),
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
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if ((valueOrDefault(
                                                        currentUserDocument
                                                            ?.role,
                                                        '') ==
                                                    'Admin') ||
                                                (valueOrDefault(
                                                        currentUserDocument
                                                            ?.role,
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
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
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
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'hhnblemg' /* Extra charges */,
                                                      ),
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
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if ((valueOrDefault(
                                                        currentUserDocument
                                                            ?.role,
                                                        '') ==
                                                    'Admin') ||
                                                (valueOrDefault(
                                                        currentUserDocument
                                                            ?.role,
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
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
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
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ldhts9xe' /* Discount */,
                                                      ),
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
                                                                .customColor4,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium,
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                                                null &&
                                                            paymentResponse
                                                                    .errorMessage !=
                                                                null) {
                                                          showSnackbar(
                                                            context,
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '68ud3bzc' /* Payment error! Check your paym... */,
                                                            ),
                                                          );
                                                        }
                                                        _model.paymentId =
                                                            paymentResponse
                                                                    .paymentId ??
                                                                '';

                                                        _shouldSetState = true;
                                                        if (_model.paymentId !=
                                                                null &&
                                                            _model.paymentId !=
                                                                '') {
                                                          context.goNamed(
                                                              'SuccessPage');

                                                          await widget
                                                              .orderParametres!
                                                              .reference
                                                              .update(
                                                                  createCartsRecordData(
                                                            stripePaymentID:
                                                                _model
                                                                    .paymentId,
                                                            cartActive: false,
                                                            cartPaid: true,
                                                            payerName:
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.name,
                                                                    ''),
                                                            tableID: '-',
                                                            restaurantPaid:
                                                                false,
                                                            employePaid: false,
                                                          ));
                                                          _model.apiResult25k =
                                                              await FactureRestaurantCall
                                                                  .call(
                                                            orderId:
                                                                valueOrDefault<
                                                                    String>(
                                                              widget
                                                                  .orderParametres
                                                                  ?.orderID,
                                                              'orderID?',
                                                            ),
                                                            date:
                                                                valueOrDefault<
                                                                    int>(
                                                              getCurrentTimestamp
                                                                  .secondsSinceEpoch,
                                                              1234,
                                                            ),
                                                            subtotal:
                                                                valueOrDefault<
                                                                    double>(
                                                              widget
                                                                  .orderParametres
                                                                  ?.subtotal,
                                                              1234.0,
                                                            ),
                                                            fraisSuppl:
                                                                valueOrDefault<
                                                                    double>(
                                                              widget
                                                                  .orderParametres
                                                                  ?.extraCharge,
                                                              1234.0,
                                                            ),
                                                            tips:
                                                                valueOrDefault<
                                                                    double>(
                                                              widget
                                                                  .orderParametres
                                                                  ?.tip,
                                                              1234.0,
                                                            ),
                                                            discount:
                                                                valueOrDefault<
                                                                    double>(
                                                              widget
                                                                  .orderParametres
                                                                  ?.discount,
                                                              1234.0,
                                                            ),
                                                            total:
                                                                valueOrDefault<
                                                                    double>(
                                                              widget
                                                                  .orderParametres
                                                                  ?.total,
                                                              1234.0,
                                                            ),
                                                            emailTo:
                                                                valueOrDefault<
                                                                    String>(
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.storeEmail,
                                                                  ''),
                                                              'email ?',
                                                            ),
                                                            iban:
                                                                valueOrDefault<
                                                                    String>(
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.storeBankBenefIBAN,
                                                                  ''),
                                                              'IBAN?',
                                                            ),
                                                            beneficiaryName:
                                                                valueOrDefault<
                                                                    String>(
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.storeBankBenefName,
                                                                  ''),
                                                              'NAME?',
                                                            ),
                                                            beneficiaryAdress:
                                                                valueOrDefault<
                                                                    String>(
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.storeBankBenefAdress,
                                                                  ''),
                                                              'ADRESS??',
                                                            ),
                                                            netTotal:
                                                                valueOrDefault<
                                                                    double>(
                                                              () {
                                                                if (widget
                                                                        .orderParametres
                                                                        ?.role ==
                                                                    'Staff') {
                                                                  return functions.fraisStripeEtOrderNowCreatedByStaff(
                                                                      widget
                                                                          .orderParametres!
                                                                          .total,
                                                                      3.9,
                                                                      0.30,
                                                                      widget
                                                                          .orderParametres!
                                                                          .tip);
                                                                } else if (widget
                                                                        .orderParametres
                                                                        ?.role ==
                                                                    'Admin') {
                                                                  return functions.fraisStripeEtOrderNowCreatedByAdmin(
                                                                      checkoutCartsRecord!
                                                                          .total,
                                                                      3.9,
                                                                      0.30,
                                                                      checkoutCartsRecord!
                                                                          .tip);
                                                                } else {
                                                                  return 0.0;
                                                                }
                                                              }(),
                                                              1234.0,
                                                            ),
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if ((_model
                                                                  .apiResult25k
                                                                  ?.succeeded ??
                                                              true)) {
                                                            _model.apiConfirmUsers =
                                                                await ConfirmationPaymentToUsersCall
                                                                    .call(
                                                              orderId: widget
                                                                  .orderParametres
                                                                  ?.orderID,
                                                              transactionID:
                                                                  _model
                                                                      .paymentId,
                                                              date: getCurrentTimestamp
                                                                  .secondsSinceEpoch,
                                                              emailTo:
                                                                  currentUserEmail,
                                                              storeName: widget
                                                                  .orderParametres
                                                                  ?.restaurantName,
                                                              subtotal: widget
                                                                  .orderParametres
                                                                  ?.subtotal,
                                                              fraisSuppl: widget
                                                                  .orderParametres
                                                                  ?.extraCharge,
                                                              tips: widget
                                                                  .orderParametres
                                                                  ?.tip,
                                                              discount: widget
                                                                  .orderParametres
                                                                  ?.discount,
                                                              total: widget
                                                                  .orderParametres
                                                                  ?.total,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .apiConfirmUsers
                                                                    ?.succeeded ??
                                                                true)) {
                                                              if ((checkoutCartsRecord
                                                                          ?.role ==
                                                                      'Staff') &&
                                                                  (checkoutCartsRecord!
                                                                          .tip >
                                                                      0.0)) {
                                                                _model.apiResultavm =
                                                                    await FactureStaffTipsCall
                                                                        .call(
                                                                  orderId: widget
                                                                      .orderParametres
                                                                      ?.orderID,
                                                                  date: getCurrentTimestamp
                                                                      .secondsSinceEpoch,
                                                                  storeName: widget
                                                                      .orderParametres
                                                                      ?.restaurantName,
                                                                  tips: widget
                                                                      .orderParametres
                                                                      ?.tip,
                                                                  netTotal: functions
                                                                      .fraisStripeEtOrderNowStaff(
                                                                          3.9,
                                                                          0.30,
                                                                          widget
                                                                              .orderParametres!
                                                                              .tip),
                                                                );
                                                                _shouldSetState =
                                                                    true;
                                                                if ((_model
                                                                        .apiResultavm
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Toutes les API sont OK',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBtnText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .customColor1,
                                                                    ),
                                                                  );
                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                  return;
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'L\'API  facture pour les pourboires n\'a pas été déclenchée',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBtnText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .customColor3,
                                                                    ),
                                                                  );
                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                  return;
                                                                }
                                                              } else {
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'API pour confirmation Users non déclenchée',
                                                                    style:
                                                                        TextStyle(
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
                                                                          .customColor3,
                                                                ),
                                                              );
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'API Facture restaurant non déclenchée',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor3,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                              ),
                                                            );
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Payment error !',
                                                                style:
                                                                    TextStyle(
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
                                                                      .customColor3,
                                                            ),
                                                          );
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'vnriltvf' /* Pay */,
                                                      ),
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
                                                                .customColor4,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium,
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
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
