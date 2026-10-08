import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/ui/widgets/campus_app_bar.dart';
import '/ui/widgets/course_form.dart';
import '/ui/widgets/responsive_page_section.dart';
import 'course_form_page_model.dart';

import '/models/course.dart';
import '/repositories/course_repository.dart';

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

  final CourseRepository _repository = CourseRepository();

  bool _loadingCourse = false;

  bool _saving = false;

  bool get _isEditing{
    final id = widget.courseId;
    return id != null && id > 0;
  }

  Future<void> _loadCourse() async {
    try{
      final course = await _repository.getCourse(widget.courseId!);

      if(!mounted) return;

      _model.nameFieldTextController!
      .text = course.title;

      _model.descriptionFieldTextController!
      .text = course.description;

      _model.teacherFieldTextController!
      .text = course.teacher;

      _model.semesterFieldTextController!
      .text = course.semester;
      
    }catch(e){
      print('Error loading course: $e');
    }finally{
      setState(() {
        _loadingCourse = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    if(_isEditing){
      _loadingCourse = true;
      _loadCourse();
    }

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
    _repository.dispose();
    _model.dispose();
    super.dispose();
  }

  Future<void> _saveCourse()async {
    if(_saving){
      return;
    }

    if (_model.formKey.currentState == null ||
        !_model.formKey.currentState!.validate()) {
      return;
    }

    final course = Course(
      id: widget.courseId,
      title: _model.nameFieldTextController!.text.trim(),
      description: _model.descriptionFieldTextController!.text.trim(),
      teacher: _model.teacherFieldTextController!.text.trim(),
      semester: _model.semesterFieldTextController!.text.trim(),
    );

    setState(() {
      _saving = true;
    });

    try {
      if(_isEditing){
        await _repository.updateCourse(course);
      }else{
        await _repository.createCourse(course);
      }

      if(!mounted) return;

      context.pop(true);
    } catch (e) {
      print(e.toString());
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
