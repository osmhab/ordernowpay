import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'switch_availability_item_model.dart';
export 'switch_availability_item_model.dart';

class SwitchAvailabilityItemWidget extends StatefulWidget {
  const SwitchAvailabilityItemWidget({
    Key? key,
    this.parameter1,
    this.parameter2,
  }) : super(key: key);

  final MenuItemsRecord? parameter1;
  final MenuItemsRecord? parameter2;

  @override
  _SwitchAvailabilityItemWidgetState createState() =>
      _SwitchAvailabilityItemWidgetState();
}

class _SwitchAvailabilityItemWidgetState
    extends State<SwitchAvailabilityItemWidget> {
  late SwitchAvailabilityItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitchAvailabilityItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Switch.adaptive(
      value: _model.switchAvailabilityValue ??= widget.parameter1!.isActive,
      onChanged: (newValue) async {
        setState(() => _model.switchAvailabilityValue = newValue!);
        if (newValue!) {
          await widget.parameter1!.reference.update(createMenuItemsRecordData(
            isActive: true,
          ));
        } else {
          await widget.parameter2!.reference.update(createMenuItemsRecordData(
            isActive: false,
          ));
        }
      },
      activeColor: FlutterFlowTheme.of(context).primary,
      activeTrackColor: FlutterFlowTheme.of(context).accent1,
      inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
    );
  }
}
