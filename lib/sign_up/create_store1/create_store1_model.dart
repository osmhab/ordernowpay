import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'create_store1_widget.dart' show CreateStore1Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateStore1Model extends FlutterFlowModel<CreateStore1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for store_name widget.
  TextEditingController? storeNameController;
  String? Function(BuildContext, String?)? storeNameControllerValidator;
  // State field(s) for store_adress widget.
  TextEditingController? storeAdressController;
  String? Function(BuildContext, String?)? storeAdressControllerValidator;
  // State field(s) for store_city widget.
  TextEditingController? storeCityController;
  String? Function(BuildContext, String?)? storeCityControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    storeNameController?.dispose();
    storeAdressController?.dispose();
    storeCityController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
