import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import 'campus_primary_button.dart';

class HomeActionsSection extends StatelessWidget {
  const HomeActionsSection({
    super.key,
    required this.onViewCourses,
    required this.onAddCourse,
    required this.onAbout,
  });

  final VoidCallback onViewCourses;
  final VoidCallback onAddCourse;
  final VoidCallback onAbout;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(color: theme.secondaryBackground),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text(
              '¿Qué quieres aprender?',
              textAlign: TextAlign.center,
              style: theme.bodyMedium.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                fontSize: 26,
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            LayoutBuilder(
              builder: (context, constraints) {
                final buttonWidth =
                    constraints.maxWidth < 320 ? constraints.maxWidth : 320.0;

                return Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    CampusPrimaryButton(
                      text: 'Ver cursos',
                      icon: Icons.list,
                      width: buttonWidth,
                      height: 54,
                      onPressed: () async => onViewCourses(),
                    ),
                    CampusPrimaryButton(
                      text: 'Agregar curso',
                      icon: Icons.add,
                      width: buttonWidth,
                      height: 54,
                      onPressed: () async => onAddCourse(),
                    ),
                    CampusPrimaryButton(
                      text: 'Acerca de',
                      icon: Icons.help,
                      width: buttonWidth,
                      height: 54,
                      onPressed: () async => onAbout(),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
