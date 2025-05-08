import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/account_blocked_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_store2_model.dart';
export 'create_store2_model.dart';

class CreateStore2Widget extends StatefulWidget {
  const CreateStore2Widget({super.key});

  @override
  State<CreateStore2Widget> createState() => _CreateStore2WidgetState();
}

class _CreateStore2WidgetState extends State<CreateStore2Widget> {
  late CreateStore2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateStore2Model());

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
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: AccountBlockedWidget(),
                ),
              ),
            );
          },
        );
      } else {
        return;
      }
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.beneficiareNameTextController ??= TextEditingController();
    _model.beneficiareNameFocusNode ??= FocusNode();

    _model.beneficiaryAdresseTextController ??= TextEditingController();
    _model.beneficiaryAdresseFocusNode ??= FocusNode();

    _model.bankIbanTextController ??= TextEditingController();
    _model.bankIbanFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Title(
          title: 'CreateStore2',
          color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: SafeArea(
                top: true,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 670.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 32.0, 0.0, 8.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'lt0pxa0q' /* Your bank details */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .displayMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 16.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 12.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'pw3ins32' /* For payments and refunds */,
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .gray600,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 12.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'hp3wfn6x' /* Create your store 2/2 */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Form(
                                    key: _model.formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 12.0, 16.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .beneficiareNameTextController,
                                            focusNode:
                                                _model.beneficiareNameFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'tzrt8vsu' /* Beneficiary name */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'sn0ho2nz' /* Company name / Private name */,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 16.0, 8.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                  lineHeight: 3.0,
                                                ),
                                            validator: _model
                                                .beneficiareNameTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 12.0, 16.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .beneficiaryAdresseTextController,
                                            focusNode: _model
                                                .beneficiaryAdresseFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '4n06jm1b' /* Beneficiary adress */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'm2zocnwe' /* Zip code & City */,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 16.0, 8.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                  lineHeight: 3.0,
                                                ),
                                            validator: _model
                                                .beneficiaryAdresseTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 12.0, 16.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                _model.bankIbanTextController,
                                            focusNode: _model.bankIbanFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'qen8lga0' /* IBAN */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '7uv5eubo' /* CH */,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 16.0, 8.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                  lineHeight: 3.0,
                                                ),
                                            validator: _model
                                                .bankIbanTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (!(isWeb
                                      ? MediaQuery.viewInsetsOf(context)
                                              .bottom >
                                          0
                                      : _isKeyboardVisible))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 24.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            bankIBAN: _model
                                                .bankIbanTextController.text,
                                            userRef: currentUserReference,
                                            beneficiaireAdresse: _model
                                                .beneficiaryAdresseTextController
                                                .text,
                                            beneficiaireName: _model
                                                .beneficiareNameTextController
                                                .text,
                                            invitation: 'Accepted',
                                            subscriptionFinished: true,
                                          ));
                                          // table1

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '01',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table2

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '02',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table3

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '03',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table4

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '04',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table5

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '05',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table6

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '06',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table7

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '07',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table8

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '08',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table9

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '09',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table10

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '10',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table11

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '11',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table12

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '12',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table13

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '13',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table14

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '14',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table15

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '15',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table16

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '16',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table17

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '17',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table18

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '18',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table19

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '19',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table20

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '20',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table21

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '21',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table22

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '22',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table23

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '23',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table24

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '24',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table25

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '25',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table26

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '26',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table27

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '27',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table28

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '28',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table29

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '29',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table30

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '30',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table31

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '31',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table32

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '32',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table33

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '33',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table34

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '34',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table35

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '35',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          // table36

                                          await TablesRecord.collection
                                              .doc()
                                              .set({
                                            ...createTablesRecordData(
                                              userRef:
                                                  currentUserDocument?.userRef,
                                              tableName: '36',
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'createdAt': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          FFAppState().tablesCount = 36;
                                          FFAppState().itemsCount = 0;
                                          safeSetState(() {});

                                          context.pushNamed('createdPage');
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'wrdmdcgp' /* Continue */,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 60.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 4.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
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
              ),
            ),
          )),
    );
  }
}
