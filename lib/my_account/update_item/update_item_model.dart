import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'update_item_widget.dart' show UpdateItemWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateItemModel extends FlutterFlowModel<UpdateItemWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for item_name widget.
  TextEditingController? itemNameController;
  String? Function(BuildContext, String?)? itemNameControllerValidator;
  String? _itemNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6zebc9yi' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for item_price widget.
  TextEditingController? itemPriceController;
  String? Function(BuildContext, String?)? itemPriceControllerValidator;
  String? _itemPriceControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yk6mnfla' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for item_description widget.
  TextEditingController? itemDescriptionController;
  String? Function(BuildContext, String?)? itemDescriptionControllerValidator;
  // State field(s) for item_specifics widget.
  TextEditingController? itemSpecificsController;
  String? Function(BuildContext, String?)? itemSpecificsControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    itemNameControllerValidator = _itemNameControllerValidator;
    itemPriceControllerValidator = _itemPriceControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    itemNameController?.dispose();
    itemPriceController?.dispose();
    itemDescriptionController?.dispose();
    itemSpecificsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
