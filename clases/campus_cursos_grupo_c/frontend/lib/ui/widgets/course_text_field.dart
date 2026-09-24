import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseTextField extends StatelessWidget {
  const CourseTextField({
    required this.controller,
    required this.focusNode,
    required this.label,
    required this.hint,
    required this.validator,
    this.keyboardType,
    this.maxLines = 1,
    super.key,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String label;
  final String hint;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: FlutterFlowTheme.of(context).alternate),
      borderRadius: BorderRadius.circular(14.0),
    );

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: true,
        labelText: label,
        hintText: hint,
        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
              font: GoogleFonts.inter(),
              letterSpacing: 0.0,
            ),
        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
              font: GoogleFonts.inter(),
              letterSpacing: 0.0,
            ),
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: FlutterFlowTheme.of(context).primary),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: FlutterFlowTheme.of(context).error),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: FlutterFlowTheme.of(context).error),
        ),
        filled: true,
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.inter(),
            fontSize: 16.0,
            letterSpacing: 0.0,
          ),
      cursorColor: FlutterFlowTheme.of(context).primaryText,
      validator: validator,
    );
  }
}
