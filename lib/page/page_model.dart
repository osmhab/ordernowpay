import '/components/buy_stickers_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'page_widget.dart' show PageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageModel extends FlutterFlowModel<PageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BuyStickers component.
  late BuyStickersModel buyStickersModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    buyStickersModel = createModel(context, () => BuyStickersModel());
  }

  void dispose() {
    unfocusNode.dispose();
    buyStickersModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
