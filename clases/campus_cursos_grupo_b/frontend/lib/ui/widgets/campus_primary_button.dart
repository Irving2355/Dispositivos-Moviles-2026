import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

class CampusPrimaryButton extends StatelessWidget {
  const CampusPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.width,
    this.height = 48,
    this.fontSize,
    this.borderRadius = 8,
  });

  final String text;
  final Future<void> Function()? onPressed;
  final IconData? icon;
  final double? width;
  final double height;
  final double? fontSize;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return FFButtonWidget(
      onPressed: onPressed,
      text: text,
      icon: icon == null ? null : Icon(icon, size: 24),
      options: FFButtonOptions(
        width: width,
        height: height,
        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
        iconPadding: EdgeInsets.zero,
        color: theme.primary,
        textStyle: theme.titleSmall.override(
          font: GoogleFonts.interTight(
            fontWeight: theme.titleSmall.fontWeight,
            fontStyle: theme.titleSmall.fontStyle,
          ),
          color: Colors.white,
          fontSize: fontSize,
          letterSpacing: 0,
        ),
        elevation: 0,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
