import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tags_component_model.dart';
export 'tags_component_model.dart';

class TagsComponentWidget extends StatefulWidget {
  const TagsComponentWidget({
    super.key,
    this.tagsParams,
  });

  final List<TagsRecord>? tagsParams;

  @override
  State<TagsComponentWidget> createState() => _TagsComponentWidgetState();
}

class _TagsComponentWidgetState extends State<TagsComponentWidget> {
  late TagsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagsComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowChoiceChips(
      options: widget!.tagsParams!
          .map((e) => e.name)
          .toList()
          .map((label) => ChipData(label))
          .toList(),
      onChanged: (val) =>
          safeSetState(() => _model.choiceChipsValue = val?.firstOrNull),
      selectedChipStyle: ChipStyle(
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Manrope',
              color: FlutterFlowTheme.of(context).primaryText,
              letterSpacing: 0.0,
            ),
        iconColor: FlutterFlowTheme.of(context).primaryText,
        iconSize: 18.0,
        elevation: 4.0,
        borderRadius: BorderRadius.circular(16.0),
      ),
      unselectedChipStyle: ChipStyle(
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Manrope',
              color: FlutterFlowTheme.of(context).secondaryText,
              letterSpacing: 0.0,
            ),
        iconColor: FlutterFlowTheme.of(context).secondaryText,
        iconSize: 18.0,
        elevation: 0.0,
        borderRadius: BorderRadius.circular(16.0),
      ),
      chipSpacing: 12.0,
      rowSpacing: 12.0,
      multiselect: false,
      alignment: WrapAlignment.start,
      controller: _model.choiceChipsValueController ??=
          FormFieldController<List<String>>(
        [],
      ),
      wrapped: true,
    );
  }
}
