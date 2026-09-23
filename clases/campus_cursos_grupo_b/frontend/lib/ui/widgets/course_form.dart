import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import 'campus_primary_button.dart';

class CourseForm extends StatelessWidget {
  const CourseForm({
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
    final theme = FlutterFlowTheme.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final headingSize =
        screenWidth < 600 ? 24.0 : (screenWidth < 1024 ? 32.0 : 36.0);

    return DecoratedBox(
      decoration: BoxDecoration(color: theme.secondaryBackground),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Crear / editar curso',
                textAlign: TextAlign.center,
                style: theme.bodyMedium.override(
                  font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                  fontSize: headingSize,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _CourseTextField(
                controller: nameController,
                focusNode: nameFocusNode,
                label: 'Nombre del curso',
                hint: 'Ej. Programacion',
                validator: nameValidator,
              ),
              const SizedBox(height: 12),
              _CourseTextField(
                controller: descriptionController,
                focusNode: descriptionFocusNode,
                label: 'Descripcion',
                hint: 'Dame una descripcion breve',
                validator: descriptionValidator,
                textAlign: TextAlign.justify,
                maxLines: 5,
              ),
              const SizedBox(height: 12),
              _CourseTextField(
                controller: teacherController,
                focusNode: teacherFocusNode,
                label: 'Profesor',
                hint: 'Nombre del profesor',
                validator: teacherValidator,
                maxLines: 5,
              ),
              const SizedBox(height: 12),
              _CourseTextField(
                controller: semesterController,
                focusNode: semesterFocusNode,
                label: 'Semestre',
                validator: semesterValidator,
                keyboardType: TextInputType.number,
                maxLines: 5,
              ),
              const SizedBox(height: 12),
              CampusPrimaryButton(
                text: 'Guardar',
                height: 40,
                onPressed: () async => onSave(),
              ),
            ],
          ),
        ),
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
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.keyboardType,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final String? hint;
  final FormFieldValidator<String>? validator;
  final TextAlign textAlign;
  final int maxLines;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final transparentBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(8),
    );
    final errorBorder = OutlineInputBorder(
      borderSide: BorderSide(color: theme.error),
      borderRadius: BorderRadius.circular(8),
    );

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        isDense: true,
        labelText: label,
        hintText: hint,
        alignLabelWithHint: true,
        labelStyle: theme.labelMedium,
        hintStyle: theme.labelMedium,
        enabledBorder: transparentBorder,
        focusedBorder: transparentBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        filled: true,
        fillColor: theme.secondaryBackground,
      ),
      style: theme.bodyMedium,
      textAlign: textAlign,
      maxLines: maxLines,
      minLines: 1,
      keyboardType: keyboardType,
      cursorColor: theme.primaryText,
      validator: validator,
    );
  }
}
