import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/account_blocked_widget.dart';
import '/components/add_bank_details_widget.dart';
import '/components/add_your_first_item_widget.dart';
import '/components/add_your_first_table_widget.dart';
import '/components/business_table_already_in_use_widget.dart';
import '/components/q_r_code_is_not_valid_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'choose_table_widget.dart' show ChooseTableWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChooseTableModel extends FlutterFlowModel<ChooseTableWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AddYourFirstTable component.
  late AddYourFirstTableModel addYourFirstTableModel;
  // Model for AddYourFirstItem component.
  late AddYourFirstItemModel addYourFirstItemModel;
  // Model for AddBankDetails component.
  late AddBankDetailsModel addBankDetailsModel;
  var scanResult = '';
  // Stores action output result for [Firestore Query - Query a collection] action in Scan_button widget.
  TablesRecord? tableFound;
  // Stores action output result for [Firestore Query - Query a collection] action in Scan_button widget.
  CartsRecord? cartInUseFound;
  // Stores action output result for [Firestore Query - Query a collection] action in Scan_button widget.
  UsersRecord? queryUserResult;
  // Stores action output result for [Backend Call - Create Document] action in Scan_button widget.
  CartsRecord? createdOrder;

  @override
  void initState(BuildContext context) {
    addYourFirstTableModel =
        createModel(context, () => AddYourFirstTableModel());
    addYourFirstItemModel = createModel(context, () => AddYourFirstItemModel());
    addBankDetailsModel = createModel(context, () => AddBankDetailsModel());
  }

  @override
  void dispose() {
    addYourFirstTableModel.dispose();
    addYourFirstItemModel.dispose();
    addBankDetailsModel.dispose();
  }
}
