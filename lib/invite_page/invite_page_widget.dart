import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'invite_page_model.dart';
export 'invite_page_model.dart';

class InvitePageWidget extends StatefulWidget {
  const InvitePageWidget({
    Key? key,
    this.invitedUserParams,
  }) : super(key: key);

  final InvitationsRecord? invitedUserParams;

  @override
  _InvitePageWidgetState createState() => _InvitePageWidgetState();
}

class _InvitePageWidgetState extends State<InvitePageWidget> {
  late InvitePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvitePageModel());

    _model.emailAddressController ??= TextEditingController();
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
        title: 'InvitePage',
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
                context.pop();
              },
            ),
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'f06ta97j' /* Back */,
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
          body: Align(
            alignment: AlignmentDirectional(0.00, -1.00),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 25.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '2k7kes4i' /* Invite your staff */,
                      ),
                      style: FlutterFlowTheme.of(context).headlineMedium,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'wwwl8k90' /* Invite your team to join Order... */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.emailAddressController,
                        autofillHints: [AutofillHints.email],
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            '1d2bbl6g' /* Email adress */,
                          ),
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: FFLocalizations.of(context).getText(
                            'jkvbo883' /* Enter email */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 20.0, 24.0),
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge,
                        maxLines: null,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator: _model.emailAddressControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var _shouldSetState = false;

                          var invitationsRecordReference =
                              InvitationsRecord.collection.doc();
                          await invitationsRecordReference
                              .set(createInvitationsRecordData(
                            inviterId: currentUserReference,
                            invitedEmail: _model.emailAddressController.text,
                            role: 'Staff',
                            status: 'Sent',
                            userRef: currentUserReference,
                            inviterID: currentUserUid,
                            restaurantName: currentUserDocument?.userRef,
                          ));
                          _model.invitationResult =
                              InvitationsRecord.getDocumentFromData(
                                  createInvitationsRecordData(
                                    inviterId: currentUserReference,
                                    invitedEmail:
                                        _model.emailAddressController.text,
                                    role: 'Staff',
                                    status: 'Sent',
                                    userRef: currentUserReference,
                                    inviterID: currentUserUid,
                                    restaurantName:
                                        currentUserDocument?.userRef,
                                  ),
                                  invitationsRecordReference);
                          _shouldSetState = true;
                          _model.invitationQuery =
                              await queryInvitationsRecordOnce(
                            queryBuilder: (invitationsRecord) =>
                                invitationsRecord.where(
                              'userRef',
                              isEqualTo: currentUserReference,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          _shouldSetState = true;
                          _model.apiResult1p4 =
                              await InvitationSendGridCall.call(
                            invitedEmail: _model.emailAddressController.text,
                            restaurantEmail: currentUserEmail,
                            restaurantName: valueOrDefault(
                                currentUserDocument?.storeName, ''),
                            invitationId: currentUserUid,
                          );
                          _shouldSetState = true;
                          if ((_model.apiResult1p4?.succeeded ?? true)) {
                            context.safePop();
                          } else {
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          if (_shouldSetState) setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          '01rr0i4l' /* Send invitation */,
                        ),
                        options: FFButtonOptions(
                          width: 270.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                  Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'Team',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.topToBottom,
                              ),
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'hkvxz1zg' /* Cancel */,
                        ),
                        options: FFButtonOptions(
                          width: 270.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryText,
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
            ),
          ),
        ));
  }
}
