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
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateStore2Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for beneficiareName widget.
  TextEditingController? beneficiareNameController;
  String? Function(BuildContext, String?)? beneficiareNameControllerValidator;
  String? _beneficiareNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for beneficiary_adresse widget.
  TextEditingController? beneficiaryAdresseController;
  String? Function(BuildContext, String?)?
      beneficiaryAdresseControllerValidator;
  String? _beneficiaryAdresseControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for bank_iban widget.
  TextEditingController? bankIbanController;
  String? Function(BuildContext, String?)? bankIbanControllerValidator;
  String? _bankIbanControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    beneficiareNameControllerValidator = _beneficiareNameControllerValidator;
    beneficiaryAdresseControllerValidator =
        _beneficiaryAdresseControllerValidator;
    bankIbanControllerValidator = _bankIbanControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    beneficiareNameController?.dispose();
    beneficiaryAdresseController?.dispose();
    bankIbanController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
