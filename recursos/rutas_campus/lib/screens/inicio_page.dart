import 'package:flutter/material.dart';

// PUNTO DE PARTIDA: esta pantalla es deliberadamente sencilla.
// En los dias 1-5 la convertiremos en un StatefulWidget y agregaremos
// datos, recursos, gestos, animaciones y una distribucion responsiva.
class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rutas del campus')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Proyecto base. Dia 1: ciclo de vida y carga de datos.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
