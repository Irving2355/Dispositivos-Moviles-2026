import '/flutter_flow/flutter_flow_util.dart';
import '/ui/widgets/campus_app_bar.dart';
import '/ui/widgets/campus_page_layout.dart';
import '/ui/widgets/course_form_section.dart';
import 'package:flutter/material.dart';

import 'course_from_page_model.dart';
export 'course_from_page_model.dart';

class CourseFromPageWidget extends StatefulWidget {
  const CourseFromPageWidget({
    super.key,
    required this.courseId,
  });

  final int? courseId;

  static String routeName = 'CourseFromPage';
  static String routePath = '/courseFromPage';

  @override
  State<CourseFromPageWidget> createState() => _CourseFromPageWidgetState();
}

class _CourseFromPageWidgetState extends State<CourseFromPageWidget> {
  late CourseFromPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, CourseFromPageModel.new);
    _model.nameFieldTextController ??= TextEditingController();
    _model.nameFieldFocusNode ??= FocusNode();
    _model.descriptionFieldTextController ??= TextEditingController();
    _model.descriptionFieldFocusNode ??= FocusNode();
    _model.teacherFieldTextController ??= TextEditingController();
    _model.teacherFieldFocusNode ??= FocusNode();
    _model.semesterFieldTextController ??= TextEditingController();
    _model.semesterFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  void _saveCourse() {
    if (_model.formKey.currentState == null ||
        !_model.formKey.currentState!.validate()) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: campusPageBackground,
        appBar: buildCampusAppBar(context, 'Formulario'),
        body: CampusPageLayout(
          maxWidth: 760,
          children: [
            CourseFormSection(
              formKey: _model.formKey,
              nameController: _model.nameFieldTextController!,
              nameFocusNode: _model.nameFieldFocusNode!,
              nameValidator:
                  _model.nameFieldTextControllerValidator.asValidator(context),
              descriptionController: _model.descriptionFieldTextController!,
              descriptionFocusNode: _model.descriptionFieldFocusNode!,
              descriptionValidator: _model
                  .descriptionFieldTextControllerValidator
                  .asValidator(context),
              teacherController: _model.teacherFieldTextController!,
              teacherFocusNode: _model.teacherFieldFocusNode!,
              teacherValidator: _model.teacherFieldTextControllerValidator
                  .asValidator(context),
              semesterController: _model.semesterFieldTextController!,
              semesterFocusNode: _model.semesterFieldFocusNode!,
              semesterValidator: _model.semesterFieldTextControllerValidator
                  .asValidator(context),
              onSave: _saveCourse,
            ),
          ],
        ),
      ),
    );
  }
}
