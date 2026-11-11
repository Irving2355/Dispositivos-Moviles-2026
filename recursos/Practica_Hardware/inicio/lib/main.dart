import 'package:flutter/material.dart';
import 'pantalla_hardware.dart';

// Punto de entrada: no accedemos al hardware desde main().
// main() solo inicia la aplicacion y delega la UI a otra clase.
void main() {
  runApp(const AplicacionHardware());
}

class AplicacionHardware extends StatelessWidget {
  const AplicacionHardware({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laboratorio de hardware',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const PantallaHardware(),
    );
  }
}
