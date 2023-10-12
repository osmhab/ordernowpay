import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/components/discount_sheet/discount_sheet_widget.dart';
import '/components/extra_charge_sheet/extra_charge_sheet_widget.dart';
import '/components/tip_sheet/tip_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'checkout_widget.dart' show CheckoutWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;
  // Stores action output result for [Backend Call - API (Facture Restaurant)] action in Button widget.
  ApiCallResponse? apiResult25k;
  // Stores action output result for [Backend Call - API (Confirmation payment to Users)] action in Button widget.
  ApiCallResponse? apiConfirmUsers;
  // Stores action output result for [Backend Call - API (Facture Staff Tips)] action in Button widget.
  ApiCallResponse? apiResultavm;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
