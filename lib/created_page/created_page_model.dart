import '/components/created_account_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'created_page_widget.dart' show CreatedPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatedPageModel extends FlutterFlowModel<CreatedPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CreatedAccount component.
  late CreatedAccountModel createdAccountModel;

  @override
  void initState(BuildContext context) {
    createdAccountModel = createModel(context, () => CreatedAccountModel());
  }

  @override
  void dispose() {
    createdAccountModel.dispose();
  }
}
