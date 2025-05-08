import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/account_blocked_widget.dart';
import '/components/b_i_g_button_component_widget.dart';
import '/components/items_empty_list_order_widget.dart';
import '/components/navigation_bar_component_widget.dart';
import '/components/switch_availability_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'items_widget.dart' show ItemsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class ItemsModel extends FlutterFlowModel<ItemsWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for switchAvailabilityItem dynamic component.
  late FlutterFlowDynamicModels<SwitchAvailabilityItemModel>
      switchAvailabilityItemModels;
  AudioPlayer? soundPlayer;
  // Model for BIGButtonComponent component.
  late BIGButtonComponentModel bIGButtonComponentModel;
  // Model for NavigationBarComponent component.
  late NavigationBarComponentModel navigationBarComponentModel;

  @override
  void initState(BuildContext context) {
    switchAvailabilityItemModels =
        FlutterFlowDynamicModels(() => SwitchAvailabilityItemModel());
    bIGButtonComponentModel =
        createModel(context, () => BIGButtonComponentModel());
    navigationBarComponentModel =
        createModel(context, () => NavigationBarComponentModel());
  }

  @override
  void dispose() {
    switchAvailabilityItemModels.dispose();
    bIGButtonComponentModel.dispose();
    navigationBarComponentModel.dispose();
  }
}
