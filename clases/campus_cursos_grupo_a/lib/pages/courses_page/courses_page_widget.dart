import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/ui/widgets/campus_app_bar.dart';
import '/ui/widgets/campus_page_layout.dart';
import '/ui/widgets/course_sections.dart';
import 'package:flutter/material.dart';

import 'courses_page_model.dart';
export 'courses_page_model.dart';

class CoursesPageWidget extends StatefulWidget {
  const CoursesPageWidget({super.key});

  static String routeName = 'CoursesPage';
  static String routePath = '/coursesPage';

  @override
  State<CoursesPageWidget> createState() => _CoursesPageWidgetState();
}

class _CoursesPageWidgetState extends State<CoursesPageWidget> {
  late CoursesPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, CoursesPageModel.new);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  void _openCourseForm() {
    context.pushNamed(
      CourseFromPageWidget.routeName,
      queryParameters: {
        'courseId': serializeParam(0, ParamType.int),
      }.withoutNulls,
    );
  }

  void _openCourseDetails() {
    context.pushNamed(
      CourseDetailPageWidget.routeName,
      queryParameters: {
        'courseId': serializeParam(0, ParamType.int),
      }.withoutNulls,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: campusPageBackground,
        appBar: buildCampusAppBar(context, 'Cursos'),
        body: CampusPageLayout(
          children: [
            CoursesHeaderSection(onAddCourse: _openCourseForm),
            CourseGridSection(onViewDetails: _openCourseDetails),
          ],
        ),
      ),
    );
  }
}
