import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'campus_page_layout.dart';

class CoursesHeaderSection extends StatelessWidget {
  const CoursesHeaderSection({
    super.key,
    required this.onAddCourse,
  });

  final VoidCallback onAddCourse;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => InkWell(
        onTap: onAddCourse,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: campusSectionBackground,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          child: Column(
            children: [
              Text(
                'Cursos disponibles',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                      color: const Color(0xFF0F172A),
                      fontSize: campusResponsiveTitleSize(constraints.maxWidth),
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),
              Text(
                'El Lorem ipsum es un texto de relleno estándar que se usa en diseño gráfico y web para probar maquetas y tipografías antes de tener el contenido final.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(),
                      fontSize: constraints.maxWidth < 600 ? 16 : 18,
                      letterSpacing: 0,
                      lineHeight: 1.4,
                    ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: 280,
                child: FFButtonWidget(
                  onPressed: onAddCourse,
                  text: 'Agregar Curso',
                  icon: const Icon(Icons.add, size: 30),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 54,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    iconPadding: EdgeInsets.zero,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(),
                          color: Colors.white,
                          fontSize: 24,
                          letterSpacing: 0,
                        ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseGridSection extends StatelessWidget {
  const CourseGridSection({super.key, required this.onViewDetails});

  final VoidCallback onViewDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: campusSectionBackground,
      padding: const EdgeInsets.all(14),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: [
          CourseCard(onViewDetails: onViewDetails),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.onViewDetails});

  final VoidCallback onViewDetails;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 340),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(),
        ),
        child: Column(
          children: [
            Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 55,
            ),
            const SizedBox(height: 10),
            Text(
              'Titulo',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                    fontSize: 22,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Text('Profesor', style: FlutterFlowTheme.of(context).bodyMedium),
            const SizedBox(height: 10),
            Text('Semestre', style: FlutterFlowTheme.of(context).bodyMedium),
            const SizedBox(height: 10),
            Text(
              'Descripcion',
              textAlign: TextAlign.justify,
              style:
                  FlutterFlowTheme.of(context).bodyMedium.copyWith(height: 1.4),
            ),
            const SizedBox(height: 10),
            FFButtonWidget(
              onPressed: onViewDetails,
              text: 'Ver detalle',
              options: FFButtonOptions(
                width: double.infinity,
                height: 45,
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
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseDetailCard extends StatelessWidget {
  const CourseDetailCard({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });

  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(),
      ),
      child: Column(
        children: [
          Icon(Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primaryText, size: 70),
          const SizedBox(height: 14),
          Text(
            'Hello World',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                  fontSize: 30,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 14),
          Text(
            'Hello World',
            textAlign: TextAlign.justify,
            style:
                FlutterFlowTheme.of(context).bodyMedium.copyWith(height: 1.4),
          ),
          const SizedBox(height: 14),
          Divider(thickness: 2, color: FlutterFlowTheme.of(context).alternate),
          const SizedBox(height: 14),
          Text('Hello World', style: FlutterFlowTheme.of(context).bodyMedium),
          const SizedBox(height: 14),
          Text('Hello World', style: FlutterFlowTheme.of(context).bodyMedium),
          const SizedBox(height: 14),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _DetailActionButton(
                label: 'Editar',
                icon: Icons.edit,
                onPressed: onEdit,
              ),
              _DetailActionButton(
                label: 'Eliminar',
                icon: Icons.delete,
                onPressed: onDelete,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DetailActionButton extends StatelessWidget {
  const _DetailActionButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: onPressed,
      text: label,
      icon: Icon(icon, size: 22),
      options: FFButtonOptions(
        width: 150,
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        iconPadding: EdgeInsets.zero,
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.interTight(),
              color: Colors.white,
              fontSize: 25,
              letterSpacing: 0,
            ),
        elevation: 0,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
