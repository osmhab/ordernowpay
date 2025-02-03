import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/account_blocked_widget.dart';
import '/components/change_name_widget.dart';
import '/components/change_phone_number_widget.dart';
import '/components/delete_account_widget.dart';
import '/components/language_widget.dart';
import '/components/navigation_bar_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'dart:ui';
import 'my_account_widget.dart' show MyAccountWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyAccountModel extends FlutterFlowModel<MyAccountWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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
