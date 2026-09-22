import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/ui/widgets/campus_app_bar.dart';
import '/ui/widgets/campus_page_layout.dart';
import '/ui/widgets/home_sections.dart';
import 'package:flutter/material.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, HomePageModel.new);
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: campusPageBackground,
        appBar: buildCampusAppBar(context, 'Page Title'),
        body: CampusPageLayout(
          children: [
            const CampusHeroSection(),
            HomeActionsSection(
              onCoursesPressed: () =>
                  context.pushNamed(CoursesPageWidget.routeName),
              onAboutPressed: () =>
                  context.pushNamed(AboutPageWidget.routeName),
              onAddCoursePressed: _openCourseForm,
            ),
          ],
        ),
      ),
    );
  }
}
