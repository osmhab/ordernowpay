import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/account_blocked_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'update_item_widget.dart' show UpdateItemWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateItemModel extends FlutterFlowModel<UpdateItemWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for item_name widget.
  FocusNode? itemNameFocusNode;
  TextEditingController? itemNameTextController;
  String? Function(BuildContext, String?)? itemNameTextControllerValidator;
  // State field(s) for item_price widget.
  FocusNode? itemPriceFocusNode;
  TextEditingController? itemPriceTextController;
  String? Function(BuildContext, String?)? itemPriceTextControllerValidator;
  String? _itemPriceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yk6mnfla' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for item_description widget.
  FocusNode? itemDescriptionFocusNode;
  TextEditingController? itemDescriptionTextController;
  String? Function(BuildContext, String?)?
      itemDescriptionTextControllerValidator;
  // State field(s) for item_specifics widget.
  FocusNode? itemSpecificsFocusNode;
  TextEditingController? itemSpecificsTextController;
  String? Function(BuildContext, String?)? itemSpecificsTextControllerValidator;

  @override
  void initState(BuildContext context) {
    itemPriceTextControllerValidator = _itemPriceTextControllerValidator;
  }

  @override
  void dispose() {
    itemNameFocusNode?.dispose();
    itemNameTextController?.dispose();

    itemPriceFocusNode?.dispose();
    itemPriceTextController?.dispose();

    itemDescriptionFocusNode?.dispose();
    itemDescriptionTextController?.dispose();

    itemSpecificsFocusNode?.dispose();
    itemSpecificsTextController?.dispose();
  }
}
