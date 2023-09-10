import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_details_model.dart';
export 'product_details_model.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({
    Key? key,
    this.productSelection,
    this.orderparam,
    this.tablesParams,
  }) : super(key: key);

  final MenuItemsRecord? productSelection;
  final CartsRecord? orderparam;
  final TablesRecord? tablesParams;

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  late ProductDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailsModel());

    _model.textController ??= TextEditingController();
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

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<CartsRecord>>(
        stream: queryCartsRecord(
          queryBuilder: (cartsRecord) => cartsRecord.where('userRef',
              isEqualTo: currentUserDocument?.userRef),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
          List<CartsRecord> productDetailsCartsRecordList = snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final productDetailsCartsRecord =
              productDetailsCartsRecordList.isNotEmpty
                  ? productDetailsCartsRecordList.first
                  : null;
          return Title(
              title: 'ProductDetails',
              color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
              child: GestureDetector(
                onTap: () =>
                    FocusScope.of(context).requestFocus(_model.unfocusNode),
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  appBar: AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                    actions: [],
                    centerTitle: false,
                    elevation: 0.0,
                  ),
                  body: SafeArea(
                    top: true,
                    child: StreamBuilder<List<CartsRecord>>(
                      stream: queryCartsRecord(
                        queryBuilder: (cartsRecord) => cartsRecord.where(
                            'userRef',
                            isEqualTo: currentUserDocument?.userRef),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<CartsRecord> parentContentCartsRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final parentContentCartsRecord =
                            parentContentCartsRecordList.isNotEmpty
                                ? parentContentCartsRecordList.first
                                : null;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://images.unsplash.com/photo-1576237934915-c716cf54b24d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxraXRjaGVuJTIwcmVzdGF1cmFudHxlbnwwfHx8fDE2OTI3MzUxOTl8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                          width: double.infinity,
                                          height: 150.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.productSelection?.name,
                                          'Product name ?',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        formatNumber(
                                          widget.productSelection!.price,
                                          formatType: FormatType.custom,
                                          currency: 'CHF ',
                                          format: '0.00',
                                          locale: '',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge,
                                      ),
                                    ),
                                    Divider(
                                      height: 20.0,
                                      thickness: 2.0,
                                      indent: 16.0,
                                      endIndent: 16.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    if (widget.productSelection?.description !=
                                            null &&
                                        widget.productSelection?.description !=
                                            '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Description',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                      ),
                                    if (widget.productSelection?.description !=
                                            null &&
                                        widget.productSelection?.description !=
                                            '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget
                                                .productSelection?.description,
                                            'Description ?',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    if (widget.productSelection
                                                ?.specification !=
                                            null &&
                                        widget.productSelection
                                                ?.specification !=
                                            '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget.productSelection
                                                ?.specification,
                                            'specification?',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  -0.90, 0.00),
                                              child: Text(
                                                'Extra comments',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText:
                                                      'e.g. without mushrooms',
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                maxLines: 3,
                                                validator: _model
                                                    .textControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 12.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  -0.90, 0.00),
                                              child: Text(
                                                'Quanity',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 24.0),
                                            child: Container(
                                              width: 160.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: FlutterFlowCountController(
                                                decrementIconBuilder:
                                                    (enabled) => Icon(
                                                  Icons.remove_rounded,
                                                  color: enabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  size: 20.0,
                                                ),
                                                incrementIconBuilder:
                                                    (enabled) => Icon(
                                                  Icons.add_rounded,
                                                  color: enabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  size: 20.0,
                                                ),
                                                countBuilder: (count) => Text(
                                                  count.toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall,
                                                ),
                                                count: _model
                                                    .countControllerValue ??= 1,
                                                updateCount: (count) =>
                                                    setState(() => _model
                                                            .countControllerValue =
                                                        count),
                                                stepSize: 1,
                                                minimum: 1,
                                                maximum: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 16.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var itemDetailRecordReference =
                                      ItemDetailRecord.collection.doc();
                                  await itemDetailRecordReference
                                      .set(createItemDetailRecordData(
                                    userRef: currentUserDocument?.userRef,
                                    name: widget.productSelection?.name,
                                    description:
                                        widget.productSelection?.description,
                                    modifiers: _model.textController.text,
                                    specifications: '',
                                    price: widget.productSelection?.price,
                                    quantity: _model.countControllerValue,
                                    menuItemRef:
                                        widget.productSelection?.reference,
                                    cartRef: widget.orderparam?.reference,
                                  ));
                                  _model.itemsInCart =
                                      ItemDetailRecord.getDocumentFromData(
                                          createItemDetailRecordData(
                                            userRef:
                                                currentUserDocument?.userRef,
                                            name: widget.productSelection?.name,
                                            description: widget
                                                .productSelection?.description,
                                            modifiers:
                                                _model.textController.text,
                                            specifications: '',
                                            price:
                                                widget.productSelection?.price,
                                            quantity:
                                                _model.countControllerValue,
                                            menuItemRef: widget
                                                .productSelection?.reference,
                                            cartRef:
                                                widget.orderparam?.reference,
                                          ),
                                          itemDetailRecordReference);
                                  _model.orderIDFound =
                                      await queryCartsRecordOnce(
                                    queryBuilder: (cartsRecord) => cartsRecord
                                        .where('userRef',
                                            isEqualTo:
                                                currentUserDocument?.userRef)
                                        .where('orderID',
                                            isEqualTo: widget
                                                .orderparam?.reference.id),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);

                                  await _model.orderIDFound!.reference.update({
                                    'itemCount': FieldValue.increment(
                                        _model.countControllerValue!),
                                    'subtotal': FieldValue.increment(
                                        functions.newCustomFunction(
                                            _model.countControllerValue!,
                                            widget.productSelection!.price)),
                                    'cartItems': FieldValue.arrayUnion(
                                        [_model.itemsInCart?.reference]),
                                    'total': FieldValue.increment(
                                        functions.totalCalculate(
                                            _model.orderIDFound!.extraCharge,
                                            _model.orderIDFound!.tip,
                                            _model.orderIDFound!.discount,
                                            _model.countControllerValue!,
                                            _model.itemsInCart!.price)),
                                  });

                                  context.pushNamed(
                                    'NewOrder',
                                    queryParameters: {
                                      'orderParams': serializeParam(
                                        widget.orderparam,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'orderParams': widget.orderparam,
                                    },
                                  );

                                  setState(() {});
                                },
                                text: 'Add To Cart',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
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
      ),
    );
  }
}
