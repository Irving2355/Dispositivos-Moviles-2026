import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/ui/widgets/campus_app_bar.dart';
import '/ui/widgets/campus_page_layout.dart';
import '/ui/widgets/course_sections.dart';
import 'package:flutter/material.dart';

import 'courses_page_model.dart';
import '/repositories/course_repository.dart';
import '/models/course.dart';
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

  final CourseRepository _courseRepository = CourseRepository();
  late Future<List<Course>> _coursesFuture;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, CoursesPageModel.new);
    _reloadCourses();
  }

  void _reloadCourses(){
    _coursesFuture = _courseRepository.getCourses();
  }

  @override
  void dispose() {
    _courseRepository.dispose();
    _model.dispose();
    super.dispose();
  }

  Future<void> _openCourseForm() async {
    await context.pushNamed(
      CourseFromPageWidget.routeName,
      queryParameters: {
        'courseId': serializeParam(0, ParamType.int),
      }.withoutNulls,
    );

    if(!mounted) return;

    setState(() {
      _reloadCourses();
    });
  }


  Future<void> _openCourseDetails(Course course) async {
    if(course.id == null) return;

    await context.pushNamed(
      CourseDetailPageWidget.routeName,
      queryParameters: {
        'courseId': serializeParam(0, ParamType.int),
      }.withoutNulls,
    );

    if(!mounted) return;
    setState(() {
      _reloadCourses();
    });
  } 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: campusPageBackground,
        appBar: buildCampusAppBar(context, 'Cursos'),
        body: FutureBuilder<List<Course>>(
          future: _coursesFuture,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }

            if(snapshot.hasError){
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            final courses = snapshot.data ?? [];

            if(courses.isEmpty){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('No hay cursos disponibles.'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _openCourseForm,
                      child: const Text('Agregar Curso'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            }

            return CampusPageLayout(
              children: [
                CourseGridSection(
                  courses: courses,
                  onViewDetails: _openCourseDetails,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
