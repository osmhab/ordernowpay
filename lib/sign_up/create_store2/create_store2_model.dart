import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/account_blocked_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'create_store2_widget.dart' show CreateStore2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateStore2Model extends FlutterFlowModel<CreateStore2Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for beneficiareName widget.
  FocusNode? beneficiareNameFocusNode;
  TextEditingController? beneficiareNameTextController;
  String? Function(BuildContext, String?)?
      beneficiareNameTextControllerValidator;
  String? _beneficiareNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7g3aewgx' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for beneficiary_adresse widget.
  FocusNode? beneficiaryAdresseFocusNode;
  TextEditingController? beneficiaryAdresseTextController;
  String? Function(BuildContext, String?)?
      beneficiaryAdresseTextControllerValidator;
  String? _beneficiaryAdresseTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pjy6l2y0' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for bank_iban widget.
  FocusNode? bankIbanFocusNode;
  TextEditingController? bankIbanTextController;
  String? Function(BuildContext, String?)? bankIbanTextControllerValidator;
  String? _bankIbanTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ilmdq5yh' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    beneficiareNameTextControllerValidator =
        _beneficiareNameTextControllerValidator;
    beneficiaryAdresseTextControllerValidator =
        _beneficiaryAdresseTextControllerValidator;
    bankIbanTextControllerValidator = _bankIbanTextControllerValidator;
  }

  @override
  void dispose() {
    beneficiareNameFocusNode?.dispose();
    beneficiareNameTextController?.dispose();

    beneficiaryAdresseFocusNode?.dispose();
    beneficiaryAdresseTextController?.dispose();

    bankIbanFocusNode?.dispose();
    bankIbanTextController?.dispose();
  }
}
