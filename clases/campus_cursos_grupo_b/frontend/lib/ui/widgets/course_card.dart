import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import 'campus_primary_button.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.title,
    required this.teacher,
    required this.semester,
    required this.description,
    required this.onViewDetails,
  });

  final String title;
  final String teacher;
  final String semester;
  final String description;
  final VoidCallback onViewDetails;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final titleSize =
        screenWidth < 600 ? 16.0 : (screenWidth < 1024 ? 18.0 : 19.0);

    return Container(
      width: 360,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF290303)),
      ),
      child: Column(
        children: [
          Icon(Icons.code, color: theme.primaryText, size: 45),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.bodyMedium.override(
              font: GoogleFonts.inter(fontWeight: FontWeight.bold),
              fontSize: titleSize,
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(teacher, style: theme.bodyMedium),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Text(semester, style: theme.bodyMedium),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.justify,
            style: theme.bodyMedium.override(
              font: GoogleFonts.inter(
                fontWeight: theme.bodyMedium.fontWeight,
                fontStyle: theme.bodyMedium.fontStyle,
              ),
              letterSpacing: 0,
              lineHeight: 1.4,
            ),
          ),
          const SizedBox(height: 10),
          CampusPrimaryButton(
            text: 'Ver detalles',
            width: double.infinity,
            height: 45,
            fontSize: 22,
            borderRadius: 14,
            onPressed: () async => onViewDetails(),
          ),
        ],
      ),
    );
  }
}
