import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import '/ui/widgets/campus_app_bar.dart';
import '/ui/widgets/campus_page_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: campusPageBackground,
        appBar: buildCampusAppBar(context, 'Acerca de...'),
        body: CampusPageLayout(
          maxWidth: 700,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://picsum.photos/seed/568/600',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Grupo A ISC',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                        fontSize:
                            MediaQuery.sizeOf(context).width < 600 ? 32 : 40,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),
                FFButtonWidget(
                  onPressed: () => context.pushNamed(HomePageWidget.routeName),
                  text: 'Home',
                  icon: const Icon(Icons.home, size: 25),
                  options: FFButtonOptions(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    iconPadding: EdgeInsets.zero,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(),
                          color: Colors.white,
                          letterSpacing: 0,
                        ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
