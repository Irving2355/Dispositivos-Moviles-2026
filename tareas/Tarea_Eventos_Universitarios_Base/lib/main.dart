import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const CampusEventosApp());
}

class CampusEventosApp extends StatelessWidget {
  const CampusEventosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Eventos',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
