import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_list_empty_model.dart';
export 'order_list_empty_model.dart';

class OrderListEmptyWidget extends StatefulWidget {
  const OrderListEmptyWidget({super.key});

  @override
  State<OrderListEmptyWidget> createState() => _OrderListEmptyWidgetState();
}

class _OrderListEmptyWidgetState extends State<OrderListEmptyWidget> {
  late OrderListEmptyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderListEmptyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                FFLocalizations.of(context).getText(
                  '5out5q08' /* Seems you don’t have 
any orde... */
                  ,
                ),
                textAlign: TextAlign.center,
                minFontSize: 14.0,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Manrope',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  FFLocalizations.of(context).getText(
                    'bzbv6h5c' /* To create a new order, start b... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 0.635,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: Image.asset(
                  'assets/images/Scan_table.png',
                ).image,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
