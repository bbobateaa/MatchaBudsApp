import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  List<String> followedUID = [];
  void addToFollowedUID(String item) => followedUID.add(item);
  void removeFromFollowedUID(String item) => followedUID.remove(item);
  void removeAtIndexFromFollowedUID(int index) => followedUID.removeAt(index);
  void insertAtIndexInFollowedUID(int index, String item) =>
      followedUID.insert(index, item);
  void updateFollowedUIDAtIndex(int index, Function(String) updateFn) =>
      followedUID[index] = updateFn(followedUID[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  List<PostRecord>? toggleIconPreviousSnapshot1;
  List<PostRecord>? toggleIconPreviousSnapshot2;
  List<PostRecord>? toggleIconPreviousSnapshot3;
  List<PostRecord>? toggleIconPreviousSnapshot4;
  List<PostRecord>? toggleIconPreviousSnapshot5;
  List<PostRecord>? toggleIconPreviousSnapshot6;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
  }
}
