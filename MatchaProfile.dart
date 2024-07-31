import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'matcha_profile_model.dart';
export 'matcha_profile_model.dart';

class MatchaProfileWidget extends StatefulWidget {
  const MatchaProfileWidget({super.key});

  @override
  State<MatchaProfileWidget> createState() => _MatchaProfileWidgetState();
}

class _MatchaProfileWidgetState extends State<MatchaProfileWidget>
    with TickerProviderStateMixin {
  late MatchaProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchaProfileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MatchaProfile'});
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).matcha1,
        body: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 25, 0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MATCHA_PROFILE_PAGE_Icon_5vt6d6pw_ON_TAP');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed('setting');
                    },
                    child: Icon(
                      Icons.settings_sharp,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 35,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 140,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.network(
                                              currentUserPhoto,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'MATCHA_PROFILE_PAGE_badge_ON_TAP');
                                        logFirebaseEvent(
                                            'badge_upload_media_to_firebase');
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .matcha1,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        logFirebaseEvent('badge_backend_call');

                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          photoUrl: _model.uploadedFileUrl,
                                        ));
                                      },
                                      child: ClipOval(
                                        child: Container(
                                          width: 44,
                                          height: 44,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 4,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: FlutterFlowTheme.of(context)
                                                .matcha1,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AuthUserStreamWidget(
                            builder: (context) => Text(
                              currentUserDisplayName,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 8, 0, 10),
                            child: Text(
                              currentUserEmail,
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Noto Sans JP',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Color(0xFFD8E0D8),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0x33000000),
                          offset: Offset(
                            0,
                            -1,
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Text(
                                    'About me',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .matcha1,
                                          fontSize: 30,
                                          letterSpacing: 0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 8, 0, 5),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      valueOrDefault(
                                          currentUserDocument?.bio, ''),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Noto Sans JP',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 17,
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 10, 0, 0),
                                  child: Text(
                                    'Your Matcha Posts',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .matcha1,
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                StreamBuilder<List<PostRecord>>(
                                  stream: queryPostRecord(
                                    queryBuilder: (postRecord) =>
                                        postRecord.where(
                                      'userId',
                                      isEqualTo: currentUserUid,
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
                                                      Text(
                                                        listViewPostRecord
                                                            .username,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'MATCHA_PROFILE_PAGE_Icon_42zzu50q_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Icon_alert_dialog');
                                                                var confirmDialogResponse =
                                                                    await showDialog<
                                                                            bool>(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Delete Post'),
                                                                              content: Text('Are you sure you want to delete this post? This action cannot be undone!'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                  child: Text('Cancel'),
                                                                                ),
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                  child: Text('Delete'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        ) ??
                                                                        false;
                                                                if (confirmDialogResponse) {
                                                                  logFirebaseEvent(
                                                                      'Icon_backend_call');
                                                                  await listViewPostRecord
                                                                      .reference
                                                                      .delete();
                                                                }
                                                              },
                                                              child: Icon(
                                                                Icons.delete,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .matcha1,
                                                                size: 30,
                                                              ),
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
                                                        width: 324,
                                                        height: 308,
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
                                                                      'MATCHA_PROFILE_PAGE_Text_eqjgkevy_ON_TAP');
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
                                              'containerOnPageLoadAnimation']!),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
