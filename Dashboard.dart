import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget>
    with TickerProviderStateMixin {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Dashboard'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 40.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).matcha1,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 44, 16, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Hello, ',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 27,
                            letterSpacing: 0,
                          ),
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => Text(
                        currentUserDisplayName,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: 27,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 15, 0, 0),
                child: Text(
                  'Your Feed',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 15),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x34090F13),
                              offset: Offset(
                                0.0,
                                2,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onFieldSubmitted: (_) async {
                              logFirebaseEvent(
                                  'DASHBOARD_TextField_yiaydjt2_ON_TEXTFIEL');
                              logFirebaseEvent('TextField_navigate_to');

                              context.pushNamed(
                                'searchResults',
                                queryParameters: {
                                  'keyword': serializeParam(
                                    _model.textController.text,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            textInputAction: TextInputAction.search,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Search for your next Matcha...',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Noto Sans JP',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0,
                                  ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  24, 12, 12, 12),
                              prefixIcon: Icon(
                                Icons.search_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0,
                                ),
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 847,
                  decoration: BoxDecoration(
                    color: Color(0xFFEDF4ED),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        color: Color(0x1B090F13),
                        offset: Offset(
                          0.0,
                          -2,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0, 0),
                          child: TabBar(
                            isScrollable: true,
                            labelColor: FlutterFlowTheme.of(context).matcha1,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto Sans JP',
                                  letterSpacing: 0,
                                ),
                            unselectedLabelStyle: TextStyle(),
                            indicatorColor:
                                FlutterFlowTheme.of(context).matcha2,
                            indicatorWeight: 2,
                            tabs: [
                              Tab(
                                text: 'Following',
                              ),
                              Tab(
                                text: 'Explore',
                              ),
                              Tab(
                                text: 'Favorites',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 12),
                                child: StreamBuilder<List<PostRecord>>(
                                  stream: queryPostRecord(
                                    queryBuilder: (postRecord) =>
                                        postRecord.where(
                                      'following',
                                      isEqualTo: true,
                                      isNull: (true) == null,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<PostRecord> listViewPostRecordList =
                                        snapshot.data!;

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewPostRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewPostRecord =
                                            listViewPostRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 12),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'DASHBOARD_PAGE_Text_jat6er9l_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Text_navigate_to');

                                                          context.pushNamed(
                                                            'User_profile',
                                                            queryParameters: {
                                                              'userid':
                                                                  serializeParam(
                                                                listViewPostRecord
                                                                    .userId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Text(
                                                          listViewPostRecord
                                                              .username,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans JP',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0,
                                                              ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 84,
                                                        height: 39,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            StreamBuilder<
                                                                List<
                                                                    PostRecord>>(
                                                              stream:
                                                                  queryPostRecord(
                                                                singleRecord:
                                                                    true,
                                                              )..listen((snapshot) {
                                                                      List<PostRecord>
                                                                          toggleIconPostRecordList =
                                                                          snapshot;
                                                                      final toggleIconPostRecord = toggleIconPostRecordList
                                                                              .isNotEmpty
                                                                          ? toggleIconPostRecordList
                                                                              .first
                                                                          : null;
                                                                      if (_model.toggleIconPreviousSnapshot1 !=
                                                                              null &&
                                                                          !const ListEquality(PostRecordDocumentEquality()).equals(
                                                                              toggleIconPostRecordList,
                                                                              _model.toggleIconPreviousSnapshot1)) {
                                                                        () async {
                                                                          logFirebaseEvent(
                                                                              'DASHBOARD_ToggleIcon_6poq15ip_ON_DATA_CH');
                                                                          logFirebaseEvent(
                                                                              'ToggleIcon_backend_call');

                                                                          await toggleIconPostRecord!
                                                                              .reference
                                                                              .update(createPostRecordData(
                                                                            favorite:
                                                                                false,
                                                                          ));

                                                                          setState(
                                                                              () {});
                                                                        }();
                                                                      }
                                                                      _model.toggleIconPreviousSnapshot1 =
                                                                          snapshot;
                                                                    }),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<PostRecord>
                                                                    toggleIconPostRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                // Return an empty Container when the item does not exist.
                                                                if (snapshot
                                                                    .data!
                                                                    .isEmpty) {
                                                                  return Container();
                                                                }
                                                                final toggleIconPostRecord =
                                                                    toggleIconPostRecordList
                                                                            .isNotEmpty
                                                                        ? toggleIconPostRecordList
                                                                            .first
                                                                        : null;

                                                                return ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    await listViewPostRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'favorite':
                                                                              !listViewPostRecord.favorite,
                                                                        },
                                                                      ),
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'DASHBOARD_ToggleIcon_6poq15ip_ON_TOGGLE');
                                                                    logFirebaseEvent(
                                                                        'ToggleIcon_backend_call');

                                                                    await toggleIconPostRecord!
                                                                        .reference
                                                                        .update(
                                                                            createPostRecordData(
                                                                      favorite:
                                                                          true,
                                                                    ));
                                                                  },
                                                                  value: listViewPostRecord
                                                                      .favorite,
                                                                  onIcon: Icon(
                                                                    Icons
                                                                        .favorite_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .matcha1,
                                                                    size: 25,
                                                                  ),
                                                                  offIcon: Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .matcha1,
                                                                    size: 25,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                            StreamBuilder<
                                                                List<
                                                                    PostRecord>>(
                                                              stream:
                                                                  queryPostRecord(
                                                                singleRecord:
                                                                    true,
                                                              )..listen((snapshot) {
                                                                      List<PostRecord>
                                                                          toggleIconPostRecordList =
                                                                          snapshot;
                                                                      final toggleIconPostRecord = toggleIconPostRecordList
                                                                              .isNotEmpty
                                                                          ? toggleIconPostRecordList
                                                                              .first
                                                                          : null;
                                                                      if (_model.toggleIconPreviousSnapshot2 !=
                                                                              null &&
                                                                          !const ListEquality(PostRecordDocumentEquality()).equals(
                                                                              toggleIconPostRecordList,
                                                                              _model.toggleIconPreviousSnapshot2)) {
                                                                        () async {
                                                                          logFirebaseEvent(
                                                                              'DASHBOARD_ToggleIcon_embzcl67_ON_DATA_CH');
                                                                          logFirebaseEvent(
                                                                              'ToggleIcon_backend_call');

                                                                          await toggleIconPostRecord!
                                                                              .reference
                                                                              .update(createPostRecordData(
                                                                            following:
                                                                                false,
                                                                          ));

                                                                          setState(
                                                                              () {});
                                                                        }();
                                                                      }
                                                                      _model.toggleIconPreviousSnapshot2 =
                                                                          snapshot;
                                                                    }),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<PostRecord>
                                                                    toggleIconPostRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                // Return an empty Container when the item does not exist.
                                                                if (snapshot
                                                                    .data!
                                                                    .isEmpty) {
                                                                  return Container();
                                                                }
                                                                final toggleIconPostRecord =
                                                                    toggleIconPostRecordList
                                                                            .isNotEmpty
                                                                        ? toggleIconPostRecordList
                                                                            .first
                                                                        : null;

                                                                return ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    await listViewPostRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'following':
                                                                              !listViewPostRecord.following,
                                                                        },
                                                                      ),
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'DASHBOARD_ToggleIcon_embzcl67_ON_TOGGLE');
                                                                    logFirebaseEvent(
                                                                        'ToggleIcon_backend_call');

                                                                    await toggleIconPostRecord!
                                                                        .reference
                                                                        .update(
                                                                            createPostRecordData(
                                                                      following:
                                                                          true,
                                                                    ));
                                                                  },
                                                                  value: listViewPostRecord
                                                                      .following,
                                                                  onIcon: Icon(
                                                                    Icons
                                                                        .person_add,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .matcha1,
                                                                    size: 25,
                                                                  ),
                                                                  offIcon: Icon(
                                                                    Icons
                                                                        .person_add_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .matcha1,
                                                                    size: 25,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    listViewPostRecord.title,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .matcha1,
                                                          letterSpacing: 0,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Matcha level:',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans JP',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .matcha1,
                                                                  fontSize: 17,
                                                                  letterSpacing:
                                                                      0,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          listViewPostRecord
                                                              .matchaLevel
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF506D4D),
                                                                fontSize: 17,
                                                                letterSpacing:
                                                                    0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    dateTimeFormat(
                                                      'yMMMd',
                                                      listViewPostRecord
                                                          .timestamp!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans JP',
                                                          letterSpacing: 0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Text(
                                                      listViewPostRecord
                                                          .content,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans JP',
                                                            letterSpacing: 0,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image.network(
                                                        listViewPostRecord
                                                            .imageURL,
                                                        width: 300,
                                                        height: 276,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 24,
                                                    thickness: 1,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          width: 100,
                                                          height: 32,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .matcha1,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: StreamBuilder<
                                                              PostRecord>(
                                                            stream: PostRecord
                                                                .getDocument(
                                                                    listViewPostRecord
                                                                        .reference),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }

                                                              final textPostRecord =
                                                                  snapshot
                                                                      .data!;

                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'DASHBOARD_PAGE_Text_t2chcrh8_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Text_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'Post',
                                                                    queryParameters:
                                                                        {
                                                                      'title':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .title,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'content':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .content,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'date':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .timestamp,
                                                                        ParamType
                                                                            .DateTime,
                                                                      ),
                                                                      'userid':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .userId,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'favorite':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .favorite,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'username':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .username,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'following':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .following,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'image':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .imageURL,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'matchaLevel':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .matchaLevel,
                                                                        ParamType
                                                                            .double,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Text(
                                                                  'Check it out',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans JP',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0,
                                                                      ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation1']!),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 12),
                                child: StreamBuilder<List<PostRecord>>(
                                  stream: queryPostRecord(
                                    queryBuilder: (postRecord) => postRecord
                                        .orderBy('timestamp', descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<PostRecord> listViewPostRecordList =
                                        snapshot.data!;

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewPostRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewPostRecord =
                                            listViewPostRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 12),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'DASHBOARD_PAGE_Text_72jv2700_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Text_navigate_to');

                                                          context.pushNamed(
                                                            'User_profile',
                                                            queryParameters: {
                                                              'userid':
                                                                  serializeParam(
                                                                listViewPostRecord
                                                                    .userId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Text(
                                                          listViewPostRecord
                                                              .username,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans JP',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0,
                                                              ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 84,
                                                        height: 39,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            StreamBuilder<
                                                                List<
                                                                    PostRecord>>(
                                                              stream:
                                                                  queryPostRecord(
                                                                singleRecord:
                                                                    true,
                                                              )..listen((snapshot) {
                                                                      List<PostRecord>
                                                                          toggleIconPostRecordList =
                                                                          snapshot;
                                                                      final toggleIconPostRecord = toggleIconPostRecordList
                                                                              .isNotEmpty
                                                                          ? toggleIconPostRecordList
                                                                              .first
                                                                          : null;
                                                                      if (_model.toggleIconPreviousSnapshot3 !=
                                                                              null &&
                                                                          !const ListEquality(PostRecordDocumentEquality()).equals(
                                                                              toggleIconPostRecordList,
                                                                              _model.toggleIconPreviousSnapshot3)) {
                                                                        () async {
                                                                          logFirebaseEvent(
                                                                              'DASHBOARD_ToggleIcon_f5t9qeyi_ON_DATA_CH');
                                                                          logFirebaseEvent(
                                                                              'ToggleIcon_backend_call');

                                                                          await toggleIconPostRecord!
                                                                              .reference
                                                                              .update(createPostRecordData(
                                                                            favorite:
                                                                                false,
                                                                          ));

                                                                          setState(
                                                                              () {});
                                                                        }();
                                                                      }
                                                                      _model.toggleIconPreviousSnapshot3 =
                                                                          snapshot;
                                                                    }),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<PostRecord>
                                                                    toggleIconPostRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                // Return an empty Container when the item does not exist.
                                                                if (snapshot
                                                                    .data!
                                                                    .isEmpty) {
                                                                  return Container();
                                                                }
                                                                final toggleIconPostRecord =
                                                                    toggleIconPostRecordList
                                                                            .isNotEmpty
                                                                        ? toggleIconPostRecordList
                                                                            .first
                                                                        : null;

                                                                return ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    await listViewPostRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'favorite':
                                                                              !listViewPostRecord.favorite,
                                                                        },
                                                                      ),
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'DASHBOARD_ToggleIcon_f5t9qeyi_ON_TOGGLE');
                                                                    logFirebaseEvent(
                                                                        'ToggleIcon_backend_call');

                                                                    await toggleIconPostRecord!
                                                                        .reference
                                                                        .update(
                                                                            createPostRecordData(
                                                                      favorite:
                                                                          true,
                                                                    ));
                                                                  },
                                                                  value: listViewPostRecord
                                                                      .favorite,
                                                                  onIcon: Icon(
                                                                    Icons
                                                                        .favorite_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .matcha1,
                                                                    size: 25,
                                                                  ),
                                                                  offIcon: Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .matcha1,
                                                                    size: 25,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                            StreamBuilder<
                                                                List<
                                                                    PostRecord>>(
                                                              stream:
                                                                  queryPostRecord(
                                                                singleRecord:
                                                                    true,
                                                              )..listen((snapshot) {
                                                                      List<PostRecord>
                                                                          toggleIconPostRecordList =
                                                                          snapshot;
                                                                      final toggleIconPostRecord = toggleIconPostRecordList
                                                                              .isNotEmpty
                                                                          ? toggleIconPostRecordList
                                                                              .first
                                                                          : null;
                                                                      if (_model.toggleIconPreviousSnapshot4 !=
                                                                              null &&
                                                                          !const ListEquality(PostRecordDocumentEquality()).equals(
                                                                              toggleIconPostRecordList,
                                                                              _model.toggleIconPreviousSnapshot4)) {
                                                                        () async {
                                                                          logFirebaseEvent(
                                                                              'DASHBOARD_ToggleIcon_69fjndqh_ON_DATA_CH');
                                                                          logFirebaseEvent(
                                                                              'ToggleIcon_backend_call');

                                                                          await toggleIconPostRecord!
                                                                              .reference
                                                                              .update(createPostRecordData(
                                                                            following:
                                                                                false,
                                                                          ));

                                                                          setState(
                                                                              () {});
                                                                        }();
                                                                      }
                                                                      _model.toggleIconPreviousSnapshot4 =
                                                                          snapshot;
                                                                    }),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<PostRecord>
                                                                    toggleIconPostRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                // Return an empty Container when the item does not exist.
                                                                if (snapshot
                                                                    .data!
                                                                    .isEmpty) {
                                                                  return Container();
                                                                }
                                                                final toggleIconPostRecord =
                                                                    toggleIconPostRecordList
                                                                            .isNotEmpty
                                                                        ? toggleIconPostRecordList
                                                                            .first
                                                                        : null;

                                                                return ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    await listViewPostRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'following':
                                                                              !listViewPostRecord.following,
                                                                        },
                                                                      ),
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'DASHBOARD_ToggleIcon_69fjndqh_ON_TOGGLE');
                                                                    logFirebaseEvent(
                                                                        'ToggleIcon_backend_call');

                                                                    await toggleIconPostRecord!
                                                                        .reference
                                                                        .update(
                                                                            createPostRecordData(
                                                                      following:
                                                                          true,
                                                                    ));
                                                                  },
                                                                  value: listViewPostRecord
                                                                      .following,
                                                                  onIcon: Icon(
                                                                    Icons
                                                                        .person_add,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .matcha1,
                                                                    size: 25,
                                                                  ),
                                                                  offIcon: Icon(
                                                                    Icons
                                                                        .person_add_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .matcha1,
                                                                    size: 25,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    listViewPostRecord.title,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .matcha1,
                                                          letterSpacing: 0,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Matcha level:',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans JP',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .matcha1,
                                                                  fontSize: 17,
                                                                  letterSpacing:
                                                                      0,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          listViewPostRecord
                                                              .matchaLevel
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF506D4D),
                                                                fontSize: 17,
                                                                letterSpacing:
                                                                    0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    dateTimeFormat(
                                                      'yMMMd',
                                                      listViewPostRecord
                                                          .timestamp!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans JP',
                                                          letterSpacing: 0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Text(
                                                      listViewPostRecord
                                                          .content,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans JP',
                                                            letterSpacing: 0,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image.network(
                                                        listViewPostRecord
                                                            .imageURL,
                                                        width: 300,
                                                        height: 276,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 24,
                                                    thickness: 1,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          width: 100,
                                                          height: 32,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .matcha1,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: StreamBuilder<
                                                              PostRecord>(
                                                            stream: PostRecord
                                                                .getDocument(
                                                                    listViewPostRecord
                                                                        .reference),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }

                                                              final textPostRecord =
                                                                  snapshot
                                                                      .data!;

                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'DASHBOARD_PAGE_Text_wnat7aap_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Text_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'Post',
                                                                    queryParameters:
                                                                        {
                                                                      'title':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .title,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'content':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .content,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'date':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .timestamp,
                                                                        ParamType
                                                                            .DateTime,
                                                                      ),
                                                                      'userid':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .userId,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'favorite':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .favorite,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'username':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .username,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'following':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .following,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'image':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .imageURL,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'matchaLevel':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .matchaLevel,
                                                                        ParamType
                                                                            .double,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Text(
                                                                  'Check it out',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans JP',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0,
                                                                      ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation3']!),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 12),
                                child: StreamBuilder<List<PostRecord>>(
                                  stream: queryPostRecord(
                                    queryBuilder: (postRecord) =>
                                        postRecord.where(
                                      'favorite',
                                      isEqualTo: true,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<PostRecord> listViewPostRecordList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewPostRecordList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 5),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewPostRecord =
                                            listViewPostRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 12),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'DASHBOARD_PAGE_Text_edff3sns_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Text_navigate_to');

                                                          context.pushNamed(
                                                            'User_profile',
                                                            queryParameters: {
                                                              'userid':
                                                                  serializeParam(
                                                                listViewPostRecord
                                                                    .userId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Text(
                                                          listViewPostRecord
                                                              .username,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans JP',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0,
                                                              ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 84,
                                                        height: 39,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            StreamBuilder<
                                                                List<
                                                                    PostRecord>>(
                                                              stream:
                                                                  queryPostRecord(
                                                                singleRecord:
                                                                    true,
                                                              )..listen((snapshot) {
                                                                      List<PostRecord>
                                                                          toggleIconPostRecordList =
                                                                          snapshot;
                                                                      final toggleIconPostRecord = toggleIconPostRecordList
                                                                              .isNotEmpty
                                                                          ? toggleIconPostRecordList
                                                                              .first
                                                                          : null;
                                                                      if (_model.toggleIconPreviousSnapshot5 !=
                                                                              null &&
                                                                          !const ListEquality(PostRecordDocumentEquality()).equals(
                                                                              toggleIconPostRecordList,
                                                                              _model.toggleIconPreviousSnapshot5)) {
                                                                        () async {
                                                                          logFirebaseEvent(
                                                                              'DASHBOARD_ToggleIcon_qwqb7jjj_ON_DATA_CH');
                                                                          logFirebaseEvent(
                                                                              'ToggleIcon_backend_call');

                                                                          await toggleIconPostRecord!
                                                                              .reference
                                                                              .update(createPostRecordData(
                                                                            favorite:
                                                                                false,
                                                                          ));

                                                                          setState(
                                                                              () {});
                                                                        }();
                                                                      }
                                                                      _model.toggleIconPreviousSnapshot5 =
                                                                          snapshot;
                                                                    }),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<PostRecord>
                                                                    toggleIconPostRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                // Return an empty Container when the item does not exist.
                                                                if (snapshot
                                                                    .data!
                                                                    .isEmpty) {
                                                                  return Container();
                                                                }
                                                                final toggleIconPostRecord =
                                                                    toggleIconPostRecordList
                                                                            .isNotEmpty
                                                                        ? toggleIconPostRecordList
                                                                            .first
                                                                        : null;

                                                                return ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    await listViewPostRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'favorite':
                                                                              !listViewPostRecord.favorite,
                                                                        },
                                                                      ),
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'DASHBOARD_ToggleIcon_qwqb7jjj_ON_TOGGLE');
                                                                    logFirebaseEvent(
                                                                        'ToggleIcon_backend_call');

                                                                    await toggleIconPostRecord!
                                                                        .reference
                                                                        .update(
                                                                            createPostRecordData(
                                                                      favorite:
                                                                          true,
                                                                    ));
                                                                  },
                                                                  value: listViewPostRecord
                                                                      .favorite,
                                                                  onIcon: Icon(
                                                                    Icons
                                                                        .favorite_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .matcha1,
                                                                    size: 25,
                                                                  ),
                                                                  offIcon: Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .matcha1,
                                                                    size: 25,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                            StreamBuilder<
                                                                List<
                                                                    PostRecord>>(
                                                              stream:
                                                                  queryPostRecord(
                                                                singleRecord:
                                                                    true,
                                                              )..listen((snapshot) {
                                                                      List<PostRecord>
                                                                          toggleIconPostRecordList =
                                                                          snapshot;
                                                                      final toggleIconPostRecord = toggleIconPostRecordList
                                                                              .isNotEmpty
                                                                          ? toggleIconPostRecordList
                                                                              .first
                                                                          : null;
                                                                      if (_model.toggleIconPreviousSnapshot6 !=
                                                                              null &&
                                                                          !const ListEquality(PostRecordDocumentEquality()).equals(
                                                                              toggleIconPostRecordList,
                                                                              _model.toggleIconPreviousSnapshot6)) {
                                                                        () async {
                                                                          logFirebaseEvent(
                                                                              'DASHBOARD_ToggleIcon_sk28tjpr_ON_DATA_CH');
                                                                          logFirebaseEvent(
                                                                              'ToggleIcon_backend_call');

                                                                          await toggleIconPostRecord!
                                                                              .reference
                                                                              .update(createPostRecordData(
                                                                            following:
                                                                                false,
                                                                          ));

                                                                          setState(
                                                                              () {});
                                                                        }();
                                                                      }
                                                                      _model.toggleIconPreviousSnapshot6 =
                                                                          snapshot;
                                                                    }),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<PostRecord>
                                                                    toggleIconPostRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                // Return an empty Container when the item does not exist.
                                                                if (snapshot
                                                                    .data!
                                                                    .isEmpty) {
                                                                  return Container();
                                                                }
                                                                final toggleIconPostRecord =
                                                                    toggleIconPostRecordList
                                                                            .isNotEmpty
                                                                        ? toggleIconPostRecordList
                                                                            .first
                                                                        : null;

                                                                return ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    await listViewPostRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'following':
                                                                              !listViewPostRecord.following,
                                                                        },
                                                                      ),
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'DASHBOARD_ToggleIcon_sk28tjpr_ON_TOGGLE');
                                                                    logFirebaseEvent(
                                                                        'ToggleIcon_backend_call');

                                                                    await toggleIconPostRecord!
                                                                        .reference
                                                                        .update(
                                                                            createPostRecordData(
                                                                      following:
                                                                          true,
                                                                    ));
                                                                  },
                                                                  value: listViewPostRecord
                                                                      .following,
                                                                  onIcon: Icon(
                                                                    Icons
                                                                        .person_add,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .matcha1,
                                                                    size: 25,
                                                                  ),
                                                                  offIcon: Icon(
                                                                    Icons
                                                                        .person_add_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .matcha1,
                                                                    size: 25,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    listViewPostRecord.title,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .matcha1,
                                                          letterSpacing: 0,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Matcha level:',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans JP',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .matcha1,
                                                                  fontSize: 17,
                                                                  letterSpacing:
                                                                      0,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          listViewPostRecord
                                                              .matchaLevel
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF506D4D),
                                                                fontSize: 17,
                                                                letterSpacing:
                                                                    0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    dateTimeFormat(
                                                      'yMMMd',
                                                      listViewPostRecord
                                                          .timestamp!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans JP',
                                                          letterSpacing: 0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Text(
                                                      listViewPostRecord
                                                          .content,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans JP',
                                                            letterSpacing: 0,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image.network(
                                                        listViewPostRecord
                                                            .imageURL,
                                                        width: 336,
                                                        height: 276,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 24,
                                                    thickness: 1,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 129,
                                                          height: 38,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 100,
                                                          height: 32,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .matcha1,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: StreamBuilder<
                                                              PostRecord>(
                                                            stream: PostRecord
                                                                .getDocument(
                                                                    listViewPostRecord
                                                                        .reference),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }

                                                              final textPostRecord =
                                                                  snapshot
                                                                      .data!;

                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'DASHBOARD_PAGE_Text_nnnfqjqy_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Text_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'Post',
                                                                    queryParameters:
                                                                        {
                                                                      'title':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .title,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'content':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .content,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'date':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .timestamp,
                                                                        ParamType
                                                                            .DateTime,
                                                                      ),
                                                                      'userid':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .userId,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'favorite':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .favorite,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'username':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .username,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'following':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .following,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'image':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .imageURL,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'matchaLevel':
                                                                          serializeParam(
                                                                        textPostRecord
                                                                            .matchaLevel,
                                                                        ParamType
                                                                            .double,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Text(
                                                                  'Check it out',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans JP',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0,
                                                                      ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation4']!),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
