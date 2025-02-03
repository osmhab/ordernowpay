import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/navigation_bar_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'user_order_history_widget.dart' show UserOrderHistoryWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserOrderHistoryModel extends FlutterFlowModel<UserOrderHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavigationBarComponent component.
  late NavigationBarComponentModel navigationBarComponentModel;

  @override
  void initState(BuildContext context) {
    navigationBarComponentModel =
        createModel(context, () => NavigationBarComponentModel());
  }

  @override
  void dispose() {
    navigationBarComponentModel.dispose();
  }
}
