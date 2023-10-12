import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'update_bank_details_widget.dart' show UpdateBankDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateBankDetailsModel extends FlutterFlowModel<UpdateBankDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for beneficiary_adress widget.
  TextEditingController? beneficiaryAdressController1;
  String? Function(BuildContext, String?)?
      beneficiaryAdressController1Validator;
  // State field(s) for beneficiary_adress widget.
  TextEditingController? beneficiaryAdressController2;
  String? Function(BuildContext, String?)?
      beneficiaryAdressController2Validator;
  // State field(s) for iban widget.
  TextEditingController? ibanController;
  String? Function(BuildContext, String?)? ibanControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    beneficiaryAdressController1?.dispose();
    beneficiaryAdressController2?.dispose();
    ibanController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
