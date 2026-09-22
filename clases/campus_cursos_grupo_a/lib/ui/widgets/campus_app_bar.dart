import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildCampusAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: FlutterFlowTheme.of(context).primary,
    automaticallyImplyLeading: false,
    title: Text(
      title,
      style: FlutterFlowTheme.of(context).headlineMedium.override(
            font: GoogleFonts.interTight(),
            color: Colors.white,
            fontSize: 22,
            letterSpacing: 0,
          ),
    ),
    centerTitle: false,
    elevation: 2,
  );
}
