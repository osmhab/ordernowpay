import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tags_model.dart';
export 'tags_model.dart';

class TagsWidget extends StatefulWidget {
  const TagsWidget({
    Key? key,
    this.tagName,
  }) : super(key: key);

  final String? tagName;

  @override
  _TagsWidgetState createState() => _TagsWidgetState();
}

class _TagsWidgetState extends State<TagsWidget> {
  late TagsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagsModel());

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

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<MenuItemsRecord>>(
        stream: queryMenuItemsRecord(
          queryBuilder: (menuItemsRecord) => menuItemsRecord.where('userRef',
              isEqualTo: currentUserDocument?.userRef),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitDoubleBounce(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            );
          }
          List<MenuItemsRecord> rowMenuItemsRecordList = snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final rowMenuItemsRecord = rowMenuItemsRecordList.isNotEmpty
              ? rowMenuItemsRecordList.first
              : null;
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.065,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).customColor4,
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                    child: Text(
                      widget.tagName!,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: badges.Badge(
                  badgeContent: Text(
                    'X',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                  ),
                  showBadge: true,
                  shape: badges.BadgeShape.circle,
                  badgeColor: FlutterFlowTheme.of(context).customColor3,
                  elevation: 3.0,
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                  position: badges.BadgePosition.topStart(),
                  animationType: badges.BadgeAnimationType.scale,
                  toAnimate: true,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
