import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navigation_bar_component_model.dart';
export 'navigation_bar_component_model.dart';

class NavigationBarComponentWidget extends StatefulWidget {
  const NavigationBarComponentWidget({
    super.key,
    int? selectedPageIndex,
    bool? hidden,
  })  : this.selectedPageIndex = selectedPageIndex ?? 1,
        this.hidden = hidden ?? false;

  final int selectedPageIndex;
  final bool hidden;

  @override
  State<NavigationBarComponentWidget> createState() =>
      _NavigationBarComponentWidgetState();
}

class _NavigationBarComponentWidgetState
    extends State<NavigationBarComponentWidget> with TickerProviderStateMixin {
  late NavigationBarComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationBarComponentModel());

    animationsMap.addAll({
      'dividerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: Offset(0.6, 1.0),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'dividerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: Offset(0.6, 1.0),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'dividerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: Offset(0.6, 1.0),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'dividerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: Offset(0.6, 1.0),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'dividerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: Offset(0.6, 1.0),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 80.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderRadius: 30.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.home_outlined,
                  color: valueOrDefault<Color>(
                    widget!.selectedPageIndex == 1
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).secondaryText,
                    FlutterFlowTheme.of(context).secondaryText,
                  ),
                  size: 24.0,
                ),
                onPressed: () async {
                  context.goNamed(
                    'Dashboard',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
              ),
              if (widget!.selectedPageIndex == 1)
                SizedBox(
                  width: 30.0,
                  child: Divider(
                    height: 2.0,
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ).animateOnPageLoad(
                    animationsMap['dividerOnPageLoadAnimation1']!),
            ],
          ),
          if ((valueOrDefault(currentUserDocument?.role, '') == 'Staff') ||
              (valueOrDefault(currentUserDocument?.role, '') == 'Admin'))
            AuthUserStreamWidget(
              builder: (context) => Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    buttonSize: 50.0,
                    icon: Icon(
                      Icons.menu_book_outlined,
                      color: valueOrDefault<Color>(
                        widget!.selectedPageIndex == 2
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        FlutterFlowTheme.of(context).secondaryText,
                      ),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.goNamed(
                        'Items',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                  ),
                  if (widget!.selectedPageIndex == 2)
                    SizedBox(
                      width: 30.0,
                      child: Divider(
                        height: 2.0,
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['dividerOnPageLoadAnimation2']!),
                ],
              ),
            ),
          if (valueOrDefault(currentUserDocument?.role, '') == 'User')
            AuthUserStreamWidget(
              builder: (context) => Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    buttonSize: 50.0,
                    icon: Icon(
                      Icons.history_outlined,
                      color: valueOrDefault<Color>(
                        widget!.selectedPageIndex == 3
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        FlutterFlowTheme.of(context).secondaryText,
                      ),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.goNamed(
                        'UserOrderHistory',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                  ),
                  if (widget!.selectedPageIndex == 3)
                    SizedBox(
                      width: 30.0,
                      child: Divider(
                        height: 2.0,
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['dividerOnPageLoadAnimation3']!),
                ],
              ),
            ),
          if ((valueOrDefault(currentUserDocument?.role, '') == 'Staff') ||
              (valueOrDefault(currentUserDocument?.role, '') == 'Admin'))
            AuthUserStreamWidget(
              builder: (context) => Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    buttonSize: 50.0,
                    icon: Icon(
                      Icons.history_outlined,
                      color: valueOrDefault<Color>(
                        widget!.selectedPageIndex == 4
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        FlutterFlowTheme.of(context).secondaryText,
                      ),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.goNamed(
                        'BusinessListOrderHistory',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                  ),
                  if (widget!.selectedPageIndex == 4)
                    SizedBox(
                      width: 30.0,
                      child: Divider(
                        height: 2.0,
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['dividerOnPageLoadAnimation4']!),
                ],
              ),
            ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.admin_panel_settings_outlined,
                  color: valueOrDefault<Color>(
                    widget!.selectedPageIndex == 5
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).secondaryText,
                    FlutterFlowTheme.of(context).secondaryText,
                  ),
                  size: 24.0,
                ),
                onPressed: () async {
                  context.goNamed(
                    'MyAccount',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
              ),
              if (widget!.selectedPageIndex == 5)
                SizedBox(
                  width: 30.0,
                  child: Divider(
                    height: 2.0,
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ).animateOnPageLoad(
                    animationsMap['dividerOnPageLoadAnimation5']!),
            ],
          ),
        ]
            .divide(SizedBox(width: 16.0))
            .addToStart(SizedBox(width: 16.0))
            .addToEnd(SizedBox(width: 16.0)),
      ),
    );
  }
}
