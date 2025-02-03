import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'invitation_page_copy_link_widget.dart'
    show InvitationPageCopyLinkWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InvitationPageCopyLinkModel
    extends FlutterFlowModel<InvitationPageCopyLinkWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for codeInvitation widget.
  FocusNode? codeInvitationFocusNode;
  TextEditingController? codeInvitationTextController;
  String? Function(BuildContext, String?)?
      codeInvitationTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    codeInvitationFocusNode?.dispose();
    codeInvitationTextController?.dispose();
  }
}
