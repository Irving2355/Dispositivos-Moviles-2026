import 'package:flutter/material.dart';

class ResponsivePageSection extends StatelessWidget {
  const ResponsivePageSection({
    super.key,
    required this.child,
    this.maxWidth = 1100,
    this.verticalPadding = 24,
  });

  final Widget child;
  final double maxWidth;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontalPadding = switch (constraints.maxWidth) {
          < 600 => 16.0,
          < 1024 => 32.0,
          _ => 48.0,
        };

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: SizedBox(width: double.infinity, child: child),
            ),
          ),
        );
      },
    );
  }
}
