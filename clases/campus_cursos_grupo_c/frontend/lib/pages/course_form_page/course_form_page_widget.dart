import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui/widgets/course_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'course_form_page_model.dart';

export 'course_form_page_model.dart';

class CourseFormPageWidget extends StatefulWidget {
  const CourseFormPageWidget({super.key, required this.courseId});

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
    _model.cacherFieldTextController ??= TextEditingController();
    _model.cacherFieldFocusNode ??= FocusNode();
    _model.semesterFieldTextController ??= TextEditingController();
    _model.semesterFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final horizontalPadding =
        MediaQuery.sizeOf(context).width < 600.0 ? 20.0 : 32.0;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Curso',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          elevation: 2.0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 24.0,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760.0),
                child: Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(18.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Crear / editar curso',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 24.0),
                        CourseTextField(
                          controller: _model.nameFieldTextController,
                          focusNode: _model.nameFieldFocusNode,
                          label: 'Nombre del curso',
                          hint: 'Ej. Programación móvil',
                          validator: _model.nameFieldTextControllerValidator
                              ?.asValidator(context),
                        ),
                        const SizedBox(height: 16.0),
                        CourseTextField(
                          controller: _model.descriptionFieldTextController,
                          focusNode: _model.descriptionFieldFocusNode,
                          label: 'Descripcion',
                          hint: 'Ej. Escribe alguna descripcion',
                          maxLines: 4,
                          validator: _model
                              .descriptionFieldTextControllerValidator
                              ?.asValidator(context),
                        ),
                        const SizedBox(height: 16.0),
                        CourseTextField(
                          controller: _model.cacherFieldTextController,
                          focusNode: _model.cacherFieldFocusNode,
                          label: 'Profesor',
                          hint: 'Nombre completo',
                          validator: _model.cacherFieldTextControllerValidator
                              ?.asValidator(context),
                        ),
                        const SizedBox(height: 16.0),
                        CourseTextField(
                          controller: _model.semesterFieldTextController,
                          focusNode: _model.semesterFieldFocusNode,
                          label: 'Semestre',
                          hint: 'numero del semestre',
                          keyboardType: TextInputType.number,
                          validator: _model.semesterFieldTextControllerValidator
                              ?.asValidator(context),
                        ),
                        const SizedBox(height: 24.0),
                        Align(
                          alignment: Alignment.center,
                          child: FFButtonWidget(
                            onPressed: _saveCourse,
                            text: 'Guardar',
                            options: FFButtonOptions(
                              height: 44.0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              iconPadding: EdgeInsets.zero,
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _saveCourse() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Guardando',
          style: TextStyle(color: FlutterFlowTheme.of(context).primaryText),
        ),
        duration: const Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }
}
