import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/flutter_flow/flutter_flow_theme.dart';

class CampusHeroSection extends StatelessWidget {
  const CampusHeroSection({
    super.key,
    this.showIcon = false,
    this.action,
  });

  static const description =
      'Lorem ipsum es un texto de relleno estándar que se usa en diseño '
      'gráfico y web para ocupar espacio y ver cómo quedará la tipografía '
      'antes de poner el contenido real.';

  final bool showIcon;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final titleSize =
        screenWidth < 600 ? 34.0 : (screenWidth < 1024 ? 42.0 : 52.0);
    final bodySize =
        screenWidth < 600 ? 16.0 : (screenWidth < 1024 ? 18.0 : 19.0);

    return DecoratedBox(
      decoration: BoxDecoration(color: theme.secondaryBackground),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showIcon) ...[
              Icon(Icons.school_sharp, color: theme.primaryText, size: 58),
              const SizedBox(height: 14),
            ],
            Text(
              'Campus Cursos',
              textAlign: TextAlign.center,
              style: theme.bodyMedium.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                fontSize: titleSize,
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              description,
              textAlign: TextAlign.center,
              style: theme.bodyMedium.override(
                font: GoogleFonts.inter(
                  fontWeight: theme.bodyMedium.fontWeight,
                  fontStyle: theme.bodyMedium.fontStyle,
                ),
                fontSize: bodySize,
                letterSpacing: 0,
                lineHeight: 1.4,
              ),
            ),
            if (action case final action?) ...[
              const SizedBox(height: 14),
              action,
            ],
          ],
        ),
      ),
    );
  }
}
