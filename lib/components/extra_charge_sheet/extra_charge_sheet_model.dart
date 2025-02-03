import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'extra_charge_sheet_widget.dart' show ExtraChargeSheetWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExtraChargeSheetModel extends FlutterFlowModel<ExtraChargeSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for extraChargeAmount widget.
  FocusNode? extraChargeAmountFocusNode;
  TextEditingController? extraChargeAmountTextController;
  String? Function(BuildContext, String?)?
      extraChargeAmountTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    extraChargeAmountFocusNode?.dispose();
    extraChargeAmountTextController?.dispose();
  }
}
