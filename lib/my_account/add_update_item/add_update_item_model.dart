import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/account_blocked_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'add_update_item_widget.dart' show AddUpdateItemWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddUpdateItemModel extends FlutterFlowModel<AddUpdateItemWidget> {
  ///  Local state fields for this page.

  String imageToShow =
      'https://firebasestorage.googleapis.com/v0/b/ordernowpay-58d66.appspot.com/o/users%2FitemsIcons%2FaddIcon.png?alt=media&token=253e64d5-7d55-48a4-ab0c-861bc07fc3dc';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for item_name widget.
  FocusNode? itemNameFocusNode;
  TextEditingController? itemNameTextController;
  String? Function(BuildContext, String?)? itemNameTextControllerValidator;
  String? _itemNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ei5ix61l' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for item_price widget.
  FocusNode? itemPriceFocusNode;
  TextEditingController? itemPriceTextController;
  String? Function(BuildContext, String?)? itemPriceTextControllerValidator;
  String? _itemPriceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'j1ju5w4i' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for item_description widget.
  FocusNode? itemDescriptionFocusNode;
  TextEditingController? itemDescriptionTextController;
  String? Function(BuildContext, String?)?
      itemDescriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {
    itemNameTextControllerValidator = _itemNameTextControllerValidator;
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
  }
}
