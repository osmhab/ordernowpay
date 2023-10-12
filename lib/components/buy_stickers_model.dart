import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'buy_stickers_widget.dart' show BuyStickersWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuyStickersModel extends FlutterFlowModel<BuyStickersWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for Adress widget.
  TextEditingController? adressController;
  String? Function(BuildContext, String?)? adressControllerValidator;
  // State field(s) for City widget.
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;
  // Stores action output result for [Backend Call - API (Print tables email)] action in Button widget.
  ApiCallResponse? apiResultztf;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nameController?.dispose();
    adressController?.dispose();
    cityController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
