import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateStore2Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for bank_name widget.
  TextEditingController? bankNameController;
  String? Function(BuildContext, String?)? bankNameControllerValidator;
  // State field(s) for bank_adresse widget.
  TextEditingController? bankAdresseController;
  String? Function(BuildContext, String?)? bankAdresseControllerValidator;
  // State field(s) for bank_iban widget.
  TextEditingController? bankIbanController;
  String? Function(BuildContext, String?)? bankIbanControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    bankNameController?.dispose();
    bankAdresseController?.dispose();
    bankIbanController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
