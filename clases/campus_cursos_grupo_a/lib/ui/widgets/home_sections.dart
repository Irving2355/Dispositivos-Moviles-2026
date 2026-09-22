import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'campus_page_layout.dart';

class CampusHeroSection extends StatelessWidget {
  const CampusHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => DecoratedBox(
        decoration: const BoxDecoration(color: campusSectionBackground),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          child: Column(
            children: [
              const Icon(Icons.school_sharp,
                  color: Color(0xFF4F46E5), size: 58),
              const SizedBox(height: 14),
              Text(
                'Campus Cursos',
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
            ],
          ),
        ),
      ),
    );
  }
}

class HomeActionsSection extends StatelessWidget {
  const HomeActionsSection({
    super.key,
    required this.onCoursesPressed,
    required this.onAboutPressed,
    required this.onAddCoursePressed,
  });

  final VoidCallback onCoursesPressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onAddCoursePressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: campusSectionBackground),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: Column(
          children: [
            Text(
              '¿Qué quieres aprender hoy?',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                    fontSize: 20,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                _ActionButton(
                  label: 'Ver cursos',
                  icon: Icons.list,
                  onPressed: onCoursesPressed,
                ),
                _ActionButton(
                  label: 'Acerca de',
                  icon: Icons.help,
                  onPressed: onAboutPressed,
                ),
                _ActionButton(
                  label: 'Agregar Curso',
                  icon: Icons.add,
                  onPressed: onAddCoursePressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: FFButtonWidget(
        onPressed: onPressed,
        text: label,
        icon: Icon(icon, size: 30),
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
    );
  }
}
