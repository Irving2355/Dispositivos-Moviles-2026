import '/flutter_flow/flutter_flow_util.dart';
import 'course_from_page_widget.dart' show CourseFromPageWidget;
import 'package:flutter/material.dart';

class CourseFromPageModel extends FlutterFlowModel<CourseFromPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  String? _nameFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nombre del curso is required';
    }

    return null;
  }

  // State field(s) for descriptionField widget.
  FocusNode? descriptionFieldFocusNode;
  TextEditingController? descriptionFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionFieldTextControllerValidator;
  String? _descriptionFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Descripcion is required';
    }

    if (val.length < 30) {
      return 'Requires at least 30 characters.';
    }

    return null;
  }

  // State field(s) for teacherField widget.
  FocusNode? teacherFieldFocusNode;
  TextEditingController? teacherFieldTextController;
  String? Function(BuildContext, String?)? teacherFieldTextControllerValidator;
  String? _teacherFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nombre del profesor is required';
    }

    return null;
  }

  // State field(s) for semesterField widget.
  FocusNode? semesterFieldFocusNode;
  TextEditingController? semesterFieldTextController;
  String? Function(BuildContext, String?)? semesterFieldTextControllerValidator;
  String? _semesterFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Semestre is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nameFieldTextControllerValidator = _nameFieldTextControllerValidator;
    descriptionFieldTextControllerValidator =
        _descriptionFieldTextControllerValidator;
    teacherFieldTextControllerValidator = _teacherFieldTextControllerValidator;
    semesterFieldTextControllerValidator =
        _semesterFieldTextControllerValidator;
  }

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    descriptionFieldFocusNode?.dispose();
    descriptionFieldTextController?.dispose();

    teacherFieldFocusNode?.dispose();
    teacherFieldTextController?.dispose();

    semesterFieldFocusNode?.dispose();
    semesterFieldTextController?.dispose();
  }
}
