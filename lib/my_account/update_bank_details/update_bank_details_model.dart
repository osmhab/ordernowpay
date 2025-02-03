import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/account_blocked_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'update_bank_details_widget.dart' show UpdateBankDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateBankDetailsModel extends FlutterFlowModel<UpdateBankDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for beneficiary_adress widget.
  FocusNode? beneficiaryAdressFocusNode1;
  TextEditingController? beneficiaryAdressTextController1;
  String? Function(BuildContext, String?)?
      beneficiaryAdressTextController1Validator;
  String? _beneficiaryAdressTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '66j0kymb' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for beneficiary_adress widget.
  FocusNode? beneficiaryAdressFocusNode2;
  TextEditingController? beneficiaryAdressTextController2;
  String? Function(BuildContext, String?)?
      beneficiaryAdressTextController2Validator;
  String? _beneficiaryAdressTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'itp8fkvt' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for iban widget.
  FocusNode? ibanFocusNode;
  TextEditingController? ibanTextController;
  String? Function(BuildContext, String?)? ibanTextControllerValidator;
  String? _ibanTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ekmybrxm' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    beneficiaryAdressTextController1Validator =
        _beneficiaryAdressTextController1Validator;
    beneficiaryAdressTextController2Validator =
        _beneficiaryAdressTextController2Validator;
    ibanTextControllerValidator = _ibanTextControllerValidator;
  }

  @override
  void dispose() {
    beneficiaryAdressFocusNode1?.dispose();
    beneficiaryAdressTextController1?.dispose();

    beneficiaryAdressFocusNode2?.dispose();
    beneficiaryAdressTextController2?.dispose();

    ibanFocusNode?.dispose();
    ibanTextController?.dispose();
  }
}
