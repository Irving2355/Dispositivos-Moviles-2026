import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/ui/widgets/campus_app_bar.dart';
import '/ui/widgets/campus_hero_section.dart';
import '/ui/widgets/campus_primary_button.dart';
import '/ui/widgets/course_card.dart';
import '/ui/widgets/responsive_page_section.dart';
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
      CourseFormPageWidget.routeName,
      queryParameters: {
        'courseId': serializeParam(0, ParamType.int),
      }.withoutNulls,
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
            child: Column(
              children: [
                ResponsivePageSection(
                  child: CampusHeroSection(
                    action: LayoutBuilder(
                      builder: (context, constraints) {
                        final width = constraints.maxWidth < 320
                            ? constraints.maxWidth
                            : 320.0;
                        return CampusPrimaryButton(
                          text: 'Agregar curso',
                          width: width,
                          height: 54,
                          onPressed: () async => _openCourseForm(),
                        );
                      },
                    ),
                  ),
                ),
                ResponsivePageSection(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: [
                          SizedBox(
                            width: constraints.maxWidth < 360
                                ? constraints.maxWidth
                                : 360,
                            child: CourseCard(
                              title: 'titulo',
                              teacher: 'profesor',
                              semester: 'semestre',
                              description: 'descripcion',
                              onViewDetails: () => context.pushNamed(
                                CourseDetailPageWidget.routeName,
                                queryParameters: {
                                  'courseId': serializeParam(0, ParamType.int),
                                }.withoutNulls,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
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
