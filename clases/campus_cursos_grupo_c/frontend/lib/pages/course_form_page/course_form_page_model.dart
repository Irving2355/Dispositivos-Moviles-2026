import '/flutter_flow/flutter_flow_util.dart';
import 'course_form_page_widget.dart' show CourseFormPageWidget;
import 'package:flutter/material.dart';

class CourseFormPageModel extends FlutterFlowModel<CourseFormPageWidget> {
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

    return null;
  }

  // State field(s) for cacherField widget.
  FocusNode? cacherFieldFocusNode;
  TextEditingController? cacherFieldTextController;
  String? Function(BuildContext, String?)? cacherFieldTextControllerValidator;
  String? _cacherFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Profesor is required';
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
    cacherFieldTextControllerValidator = _cacherFieldTextControllerValidator;
    semesterFieldTextControllerValidator =
        _semesterFieldTextControllerValidator;
  }

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    descriptionFieldFocusNode?.dispose();
    descriptionFieldTextController?.dispose();

    cacherFieldFocusNode?.dispose();
    cacherFieldTextController?.dispose();

    semesterFieldFocusNode?.dispose();
    semesterFieldTextController?.dispose();
  }
}
