import 'package:flutter/material.dart';

const campusPageBackground = Color(0xFFF8FAFC);
const campusSectionBackground = Color(0xFFEEF2FF);

double campusResponsivePadding(double width) {
  if (width < 600) return 20;
  if (width < 900) return 32;
  return 48;
}

double campusResponsiveTitleSize(double width) {
  if (width < 600) return 34;
  if (width < 900) return 42;
  return 50;
}

class CampusPageLayout extends StatelessWidget {
  const CampusPageLayout({
    super.key,
    required this.children,
    this.maxWidth = 1100,
    this.spacing = 24,
  });

  final List<Widget> children;
  final double maxWidth;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final padding = campusResponsivePadding(constraints.maxWidth);
                return Padding(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (var index = 0; index < children.length; index++) ...[
                        if (index > 0) SizedBox(height: spacing),
                        children[index],
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
