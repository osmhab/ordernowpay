import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'add_tag_component_widget.dart' show AddTagComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddTagComponentModel extends FlutterFlowModel<AddTagComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for tagName widget.
  FocusNode? tagNameFocusNode;
  TextEditingController? tagNameTextController;
  String? Function(BuildContext, String?)? tagNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tagNameFocusNode?.dispose();
    tagNameTextController?.dispose();
  }
}
