import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'tip_sheet_widget.dart' show TipSheetWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TipSheetModel extends FlutterFlowModel<TipSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for tipAmount widget.
  TextEditingController? tipAmountController;
  String? Function(BuildContext, String?)? tipAmountControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    tipAmountController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
