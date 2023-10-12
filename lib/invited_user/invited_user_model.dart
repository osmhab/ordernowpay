import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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

  final unfocusNode = FocusNode();
  // State field(s) for codeInvitation widget.
  TextEditingController? codeInvitationController;
  String? Function(BuildContext, String?)? codeInvitationControllerValidator;
  // State field(s) for name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for passwordConfirm widget.
  TextEditingController? passwordConfirmController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)? passwordConfirmControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in joinInviter widget.
  UsersRecord? resultQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in joinInviter widget.
  InvitationsRecord? resultQueryInvitation;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordConfirmVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    codeInvitationController?.dispose();
    nameController?.dispose();
    emailAddressController?.dispose();
    passwordController?.dispose();
    passwordConfirmController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
