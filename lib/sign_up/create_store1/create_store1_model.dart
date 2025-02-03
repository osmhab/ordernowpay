import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/account_blocked_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'create_store1_widget.dart' show CreateStore1Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateStore1Model extends FlutterFlowModel<CreateStore1Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for store_name widget.
  FocusNode? storeNameFocusNode;
  TextEditingController? storeNameTextController;
  String? Function(BuildContext, String?)? storeNameTextControllerValidator;
  // State field(s) for store_adress widget.
  FocusNode? storeAdressFocusNode;
  TextEditingController? storeAdressTextController;
  String? Function(BuildContext, String?)? storeAdressTextControllerValidator;
  // State field(s) for store_city widget.
  FocusNode? storeCityFocusNode;
  TextEditingController? storeCityTextController;
  String? Function(BuildContext, String?)? storeCityTextControllerValidator;
  // Stores action output result for [Backend Call - API (Welcome email ENG)] action in Button widget.
  ApiCallResponse? apiResulthdy;
  // Stores action output result for [Backend Call - API (Welcome email FRA)] action in Button widget.
  ApiCallResponse? apiResultbrc;
  // Stores action output result for [Backend Call - API (Welcome email DEU)] action in Button widget.
  ApiCallResponse? apiResult7z2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    storeNameFocusNode?.dispose();
    storeNameTextController?.dispose();

    storeAdressFocusNode?.dispose();
    storeAdressTextController?.dispose();

    storeCityFocusNode?.dispose();
    storeCityTextController?.dispose();
  }
}
