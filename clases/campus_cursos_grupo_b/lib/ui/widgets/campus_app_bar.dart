import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/flutter_flow/flutter_flow_theme.dart';

class CampusAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CampusAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return AppBar(
      backgroundColor: theme.primary,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: theme.headlineMedium.override(
          font: GoogleFonts.interTight(
            fontWeight: theme.headlineMedium.fontWeight,
            fontStyle: theme.headlineMedium.fontStyle,
          ),
          color: Colors.white,
          fontSize: 22,
          letterSpacing: 0,
        ),
      ),
      centerTitle: false,
      elevation: 2,
    );
  }
}
