import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import 'campus_primary_button.dart';

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
    final theme = FlutterFlowTheme.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final headingSize =
        screenWidth < 600 ? 22.0 : (screenWidth < 1024 ? 30.0 : 34.0);
    final descriptionSize =
        screenWidth < 600 ? 15.0 : (screenWidth < 1024 ? 17.0 : 18.0);

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.arrow_back, color: theme.primaryText, size: 55),
          const SizedBox(height: 14),
          Text(
            'Hello World',
            textAlign: TextAlign.center,
            style: theme.bodyMedium.override(
              font: GoogleFonts.inter(fontWeight: FontWeight.bold),
              fontSize: headingSize,
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Hello World',
            textAlign: TextAlign.justify,
            style: theme.bodyMedium.override(
              font: GoogleFonts.inter(
                fontWeight: theme.bodyMedium.fontWeight,
                fontStyle: theme.bodyMedium.fontStyle,
              ),
              fontSize: descriptionSize,
              letterSpacing: 0,
              lineHeight: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          Divider(thickness: 2, color: theme.alternate),
          const SizedBox(height: 14),
          Text(
            'Hello World',
            style: theme.bodyMedium.copyWith(
              fontSize: screenWidth < 600 ? 16 : 18,
            ),
          ),
          const SizedBox(height: 14),
          Text('Hello World', style: theme.bodyMedium),
          const SizedBox(height: 14),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              CampusPrimaryButton(
                text: 'Editar',
                icon: Icons.edit,
                width: 150,
                height: 40,
                fontSize: 25,
                onPressed: () async => onEdit(),
              ),
              CampusPrimaryButton(
                text: 'Eliminar',
                icon: Icons.delete,
                width: 150,
                height: 40,
                fontSize: 25,
                onPressed: () async => onDelete(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
