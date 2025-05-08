import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/account_blocked_widget.dart';
import '/components/action_sheet_simple_widget.dart';
import '/components/b_i_g_button_component_widget.dart';
import '/components/finalize_registration_widget.dart';
import '/components/navigation_bar_component_widget.dart';
import '/components/no_order_for_this_table_widget.dart';
import '/components/q_r_code_is_not_valid_widget.dart';
import '/components/read_widget.dart';
import '/components/subscription_needed_to_pay_widget.dart';
import '/components/unread_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BIGButtonComponent component.
  late BIGButtonComponentModel bIGButtonComponentModel1;
  // Model for BIGButtonComponent component.
  late BIGButtonComponentModel bIGButtonComponentModel2;
  var scanResult = '';
  // Stores action output result for [Firestore Query - Query a collection] action in BIGButtonComponent widget.
  TablesRecord? tableFound;
  // Stores action output result for [Firestore Query - Query a collection] action in BIGButtonComponent widget.
  CartsRecord? tableFounded;
  // Model for NavigationBarComponent component.
  late NavigationBarComponentModel navigationBarComponentModel;

  @override
  void initState(BuildContext context) {
    bIGButtonComponentModel1 =
        createModel(context, () => BIGButtonComponentModel());
    bIGButtonComponentModel2 =
        createModel(context, () => BIGButtonComponentModel());
    navigationBarComponentModel =
        createModel(context, () => NavigationBarComponentModel());
  }

  @override
  void dispose() {
    bIGButtonComponentModel1.dispose();
    bIGButtonComponentModel2.dispose();
    navigationBarComponentModel.dispose();
  }
}
