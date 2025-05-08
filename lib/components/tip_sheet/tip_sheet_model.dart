import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'tip_sheet_widget.dart' show TipSheetWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TipSheetModel extends FlutterFlowModel<TipSheetWidget> {
  ///  Local state fields for this component.

  Color? backGroundColor10 = Color(4294967295);

  Color? textColor10 = Color(4283120111);

  Color? borderColor10 = Color(4283120111);

  Color? backGroundColor15 = Color(4294967295);

  Color? textColor15 = Color(4283120111);

  Color? borderColor15 = Color(4283120111);

  Color? backGroundColor20 = Color(4294967295);

  Color? textColor20 = Color(4283120111);

  Color? borderColor20 = Color(4283120111);

  ///  State fields for stateful widgets in this component.

  // State field(s) for tipAmount widget.
  FocusNode? tipAmountFocusNode;
  TextEditingController? tipAmountTextController;
  String? Function(BuildContext, String?)? tipAmountTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tipAmountFocusNode?.dispose();
    tipAmountTextController?.dispose();
  }
}
