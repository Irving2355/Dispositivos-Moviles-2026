import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/ui/widgets/campus_app_bar.dart';
import '/ui/widgets/campus_primary_button.dart';
import '/ui/widgets/responsive_page_section.dart';
import 'about_page_model.dart';

export 'about_page_model.dart';

class AboutPageWidget extends StatefulWidget {
  const AboutPageWidget({super.key});

  static String routeName = 'AboutPage';
  static String routePath = '/aboutPage';

  @override
  State<AboutPageWidget> createState() => _AboutPageWidgetState();
}

class _AboutPageWidgetState extends State<AboutPageWidget> {
  late AboutPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, AboutPageModel.new);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final titleSize = width < 600 ? 32.0 : (width < 1024 ? 38.0 : 42.0);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: theme.primaryBackground,
        appBar: const CampusAppBar(title: 'Acerca de...'),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: ResponsivePageSection(
              maxWidth: 700,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://picsum.photos/seed/582/600',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Gurpo B ISC',
                    textAlign: TextAlign.center,
                    style: theme.bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: theme.bodyMedium.fontWeight,
                        fontStyle: theme.bodyMedium.fontStyle,
                      ),
                      fontSize: titleSize,
                      letterSpacing: 0,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CampusPrimaryButton(
                    text: 'Home',
                    icon: Icons.home,
                    height: 40,
                    borderRadius: 16,
                    onPressed: () async =>
                        context.pushNamed(HomePageWidget.routeName),
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
