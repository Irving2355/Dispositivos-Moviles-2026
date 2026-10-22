import 'package:flutter/material.dart';
import 'ui/pantalla_principal.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NexaSoftApp());
}

class NexaSoftApp extends StatelessWidget {
  const NexaSoftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NexaSoft | Mesa de ayuda',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF174C83)),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF174C83),
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
      ),
      home: const PantallaPrincipal(),
    );
  }
}
