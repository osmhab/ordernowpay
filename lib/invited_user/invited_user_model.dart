import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'invited_user_widget.dart' show InvitedUserWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InvitedUserModel extends FlutterFlowModel<InvitedUserWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for codeInvitation widget.
  FocusNode? codeInvitationFocusNode;
  TextEditingController? codeInvitationTextController;
  String? Function(BuildContext, String?)?
      codeInvitationTextControllerValidator;
  // State field(s) for invitedName widget.
  FocusNode? invitedNameFocusNode;
  TextEditingController? invitedNameTextController;
  String? Function(BuildContext, String?)? invitedNameTextControllerValidator;
  // State field(s) for InvitedEmailAddress widget.
  FocusNode? invitedEmailAddressFocusNode;
  TextEditingController? invitedEmailAddressTextController;
  String? Function(BuildContext, String?)?
      invitedEmailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for passwordConfirm widget.
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmTextController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in joinInviter widget.
  UsersRecord? resultQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in joinInviter widget.
  InvitationsRecord? resultQueryInvitation;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordConfirmVisibility = false;
  }

  @override
  void dispose() {
    codeInvitationFocusNode?.dispose();
    codeInvitationTextController?.dispose();

    invitedNameFocusNode?.dispose();
    invitedNameTextController?.dispose();

    invitedEmailAddressFocusNode?.dispose();
    invitedEmailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    passwordConfirmFocusNode?.dispose();
    passwordConfirmTextController?.dispose();
  }
}
