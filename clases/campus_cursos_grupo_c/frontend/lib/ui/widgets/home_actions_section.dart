import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeActionsSection extends StatelessWidget {
  const HomeActionsSection({
    required this.onViewCourses,
    required this.onAddCourse,
    required this.onAbout,
    super.key,
  });

  final VoidCallback onViewCourses;
  final VoidCallback onAddCourse;
  final VoidCallback onAbout;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontalPadding = width < 600.0 ? 20.0 : 40.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    '¿Qué quieres aprender?',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                          fontSize: 26.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 20.0),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final buttonWidth = constraints.maxWidth < 320.0
                          ? constraints.maxWidth
                          : 320.0;
                      return Wrap(
                        spacing: 16.0,
                        runSpacing: 16.0,
                        alignment: WrapAlignment.center,
                        children: [
                          _ActionButton(
                            width: buttonWidth,
                            label: 'Ver cursos',
                            icon: Icons.list,
                            onPressed: onViewCourses,
                          ),
                          _ActionButton(
                            width: buttonWidth,
                            label: 'Agregar Curso',
                            icon: Icons.add,
                            onPressed: onAddCourse,
                          ),
                          _ActionButton(
                            width: buttonWidth,
                            label: 'Acerca de',
                            icon: Icons.help,
                            onPressed: onAbout,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.width,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final double width;
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: onPressed,
      text: label,
      icon: Icon(icon, size: 30.0),
      options: FFButtonOptions(
        width: width,
        height: 54.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        iconPadding: EdgeInsets.zero,
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.interTight(),
              color: Colors.white,
              letterSpacing: 0.0,
            ),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(14.0),
      ),
    );
  }
}
