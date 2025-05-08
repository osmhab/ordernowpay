import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/components/action_sheet_simple_widget.dart';
import '/components/apple_pay_widget.dart';
import '/components/discount_sheet/discount_sheet_widget.dart';
import '/components/extra_charge_sheet/extra_charge_sheet_widget.dart';
import '/components/tip_sheet/tip_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'checkout_widget.dart' show CheckoutWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  Map<ItemDetailRecord, bool> checkboxValueMap = {};
  List<ItemDetailRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TablesRecord? tableFound;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
