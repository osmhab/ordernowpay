import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'add_table_widget.dart' show AddTableWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddTableModel extends FlutterFlowModel<AddTableWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for table_name widget.
  FocusNode? tableNameFocusNode;
  TextEditingController? tableNameTextController;
  String? Function(BuildContext, String?)? tableNameTextControllerValidator;
  // State field(s) for table_description widget.
  FocusNode? tableDescriptionFocusNode;
  TextEditingController? tableDescriptionTextController;
  String? Function(BuildContext, String?)?
      tableDescriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tableNameFocusNode?.dispose();
    tableNameTextController?.dispose();

    tableDescriptionFocusNode?.dispose();
    tableDescriptionTextController?.dispose();
  }
}
