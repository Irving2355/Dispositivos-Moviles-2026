import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/ui/widgets/campus_app_bar.dart';
import '/ui/widgets/campus_hero_section.dart';
import '/ui/widgets/home_actions_section.dart';
import '/ui/widgets/responsive_page_section.dart';
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
        appBar: const CampusAppBar(title: 'Page Title'),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ResponsivePageSection(
                  child: CampusHeroSection(showIcon: true),
                ),
                ResponsivePageSection(
                  child: HomeActionsSection(
                    onViewCourses: () =>
                        context.pushNamed(CoursesPageWidget.routeName),
                    onAddCourse: () => context.pushNamed(
                      CourseFormPageWidget.routeName,
                      queryParameters: {
                        'courseId': serializeParam(0, ParamType.int),
                      }.withoutNulls,
                    ),
                    onAbout: () => context.pushNamed(AboutPageWidget.routeName),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
