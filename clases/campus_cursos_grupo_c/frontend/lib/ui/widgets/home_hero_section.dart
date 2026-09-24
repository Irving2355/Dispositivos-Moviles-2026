import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeroSection extends StatelessWidget {
  const HomeHeroSection({super.key});

  static const _description =
      'Lorem ipsum es un texto de relleno estándar que se usa en diseño '
      'gráfico y web para ocupar espacio y ver cómo quedará la tipografía '
      'antes de poner el contenido real.';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontalPadding = width < 600.0 ? 20.0 : 40.0;
    final titleSize = width < 600.0 ? 34.0 : (width < 1024.0 ? 42.0 : 52.0);
    final descriptionSize = width < 600.0 ? 16.0 : 18.0;

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
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 40.0,
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.school_sharp,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 58.0,
                  ),
                  const SizedBox(height: 14.0),
                  Text(
                    'Campus Cursos',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                          fontSize: titleSize,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 14.0),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 760.0),
                    child: Text(
                      _description,
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(),
                            fontSize: descriptionSize,
                            letterSpacing: 0.0,
                            lineHeight: 1.4,
                          ),
                    ),
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
