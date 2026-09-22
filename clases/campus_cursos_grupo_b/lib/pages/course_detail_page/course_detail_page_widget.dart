import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/ui/widgets/campus_app_bar.dart';
import '/ui/widgets/course_detail_card.dart';
import '/ui/widgets/responsive_page_section.dart';
import 'course_detail_page_model.dart';

export 'course_detail_page_model.dart';

class CourseDetailPageWidget extends StatefulWidget {
  const CourseDetailPageWidget({
    super.key,
    required this.courseId,
  });

  final int? courseId;

  static String routeName = 'CourseDetailPage';
  static String routePath = '/courseDetailPage';

  @override
  State<CourseDetailPageWidget> createState() => _CourseDetailPageWidgetState();
}

class _CourseDetailPageWidgetState extends State<CourseDetailPageWidget> {
  late CourseDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, CourseDetailPageModel.new);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  void _editCourse() {
    context.pushNamed(
      CourseFormPageWidget.routeName,
      queryParameters: {
        'courseId': serializeParam(0, ParamType.int),
      }.withoutNulls,
    );
  }

  void _showDeletingMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Eliminando...',
          style: TextStyle(color: FlutterFlowTheme.of(context).primaryText),
        ),
        duration: const Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: const CampusAppBar(title: 'Cursos'),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: ResponsivePageSection(
              maxWidth: 900,
              child: CourseDetailCard(
                onEdit: _editCourse,
                onDelete: _showDeletingMessage,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
