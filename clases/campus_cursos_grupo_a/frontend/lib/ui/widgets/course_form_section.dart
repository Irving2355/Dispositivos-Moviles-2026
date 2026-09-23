import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseFormSection extends StatelessWidget {
  const CourseFormSection({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.nameFocusNode,
    required this.nameValidator,
    required this.descriptionController,
    required this.descriptionFocusNode,
    required this.descriptionValidator,
    required this.teacherController,
    required this.teacherFocusNode,
    required this.teacherValidator,
    required this.semesterController,
    required this.semesterFocusNode,
    required this.semesterValidator,
    required this.onSave,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final FocusNode nameFocusNode;
  final FormFieldValidator<String>? nameValidator;
  final TextEditingController descriptionController;
  final FocusNode descriptionFocusNode;
  final FormFieldValidator<String>? descriptionValidator;
  final TextEditingController teacherController;
  final FocusNode teacherFocusNode;
  final FormFieldValidator<String>? teacherValidator;
  final TextEditingController semesterController;
  final FocusNode semesterFocusNode;
  final FormFieldValidator<String>? semesterValidator;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          Text(
            'Crear / editar curso',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                  fontSize: MediaQuery.sizeOf(context).width < 600 ? 26 : 34,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          _CourseTextField(
            controller: nameController,
            focusNode: nameFocusNode,
            label: 'Nombre del curso',
            hint: 'Ej. Programacion',
            validator: nameValidator,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          _CourseTextField(
            controller: descriptionController,
            focusNode: descriptionFocusNode,
            label: 'Descripcion',
            hint: 'Dame una descripcion breve',
            validator: descriptionValidator,
            minLines: 1,
            maxLines: 5,
            textInputAction: TextInputAction.newline,
          ),
          const SizedBox(height: 20),
          _CourseTextField(
            controller: teacherController,
            focusNode: teacherFocusNode,
            label: 'Nombre del profesor',
            hint: 'Ej. Juan Perez',
            validator: teacherValidator,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          _CourseTextField(
            controller: semesterController,
            focusNode: semesterFocusNode,
            label: 'Semestre',
            validator: semesterValidator,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => onSave(),
          ),
          const SizedBox(height: 20),
          FFButtonWidget(
            onPressed: onSave,
            text: 'Guardar',
            options: FFButtonOptions(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              iconPadding: EdgeInsets.zero,
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.interTight(),
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 0,
                  ),
              elevation: 0,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}

class _CourseTextField extends StatelessWidget {
  const _CourseTextField({
    required this.controller,
    required this.focusNode,
    required this.label,
    required this.validator,
    this.hint,
    this.keyboardType,
    this.textInputAction,
    this.minLines,
    this.maxLines = 1,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final String? hint;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? minLines;
  final int? maxLines;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final borderRadius = BorderRadius.circular(8);

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        isDense: true,
        labelText: label,
        hintText: hint,
        labelStyle: theme.labelMedium,
        hintStyle: theme.labelMedium,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.error),
          borderRadius: borderRadius,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.error),
          borderRadius: borderRadius,
        ),
        filled: true,
        fillColor: theme.secondaryBackground,
      ),
      style: theme.bodyMedium,
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      cursorColor: theme.primaryText,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
