import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/account_blocked_widget.dart';
import '/components/b_i_g_button_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'team_widget.dart' show TeamWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeamModel extends FlutterFlowModel<TeamWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BIGButtonComponent component.
  late BIGButtonComponentModel bIGButtonComponentModel;

  @override
  void initState(BuildContext context) {
    bIGButtonComponentModel =
        createModel(context, () => BIGButtonComponentModel());
  }

  @override
  void dispose() {
    bIGButtonComponentModel.dispose();
  }
}
