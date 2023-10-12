import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/switch_availability_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'items_widget.dart' show ItemsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemsModel extends FlutterFlowModel<ItemsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for switchAvailabilityItem dynamic component.
  late FlutterFlowDynamicModels<SwitchAvailabilityItemModel>
      switchAvailabilityItemModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    switchAvailabilityItemModels =
        FlutterFlowDynamicModels(() => SwitchAvailabilityItemModel());
  }

  void dispose() {
    unfocusNode.dispose();
    switchAvailabilityItemModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
