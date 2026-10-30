import 'package:flutter/material.dart';
import 'screens/inicio_page.dart';

void main() {
  // runApp establece el widget raiz de nuestra aplicacion.
  runApp(const RutasCampusApp());
}

class RutasCampusApp extends StatelessWidget {
  const RutasCampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rutas del campus',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006D77)),
        scaffoldBackgroundColor: const Color(0xFFF6F8F9),
      ),
      home: const InicioPage(),
    );
  }
}
