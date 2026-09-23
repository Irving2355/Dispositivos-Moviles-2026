import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/ui/widgets/campus_app_bar.dart';
import '/ui/widgets/course_form.dart';
import '/ui/widgets/responsive_page_section.dart';
import 'course_form_page_model.dart';

export 'course_form_page_model.dart';

class CourseFormPageWidget extends StatefulWidget {
  const CourseFormPageWidget({
    super.key,
    required this.courseId,
  });

  final int? courseId;

  static String routeName = 'CourseFormPage';
  static String routePath = '/courseFormPage';

  @override
  State<CourseFormPageWidget> createState() => _CourseFormPageWidgetState();
}

class _CourseFormPageWidgetState extends State<CourseFormPageWidget> {
  late CourseFormPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, CourseFormPageModel.new);

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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: const CampusAppBar(title: 'Formulario'),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: ResponsivePageSection(
              maxWidth: 760,
              child: CourseForm(
                formKey: _model.formKey,
                nameController: _model.nameFieldTextController!,
                nameFocusNode: _model.nameFieldFocusNode!,
                nameValidator: _model.nameFieldTextControllerValidator
                    .asValidator(context),
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
            ),
          ),
        ),
      ),
    );
  }
}
