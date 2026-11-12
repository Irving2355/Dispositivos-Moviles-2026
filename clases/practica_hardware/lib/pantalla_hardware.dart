import 'package:flutter/material.dart';

// BASE: los tres botones estan visibles,
// pero NO se implemento el acceso a camara, GPS ni sensores.
class PantallaHardware extends StatefulWidget {
  const PantallaHardware({super.key});

  @override
  State<PantallaHardware> createState() => _PantallaHardwareState();
}

class _PantallaHardwareState extends State<PantallaHardware> {
  String _mensajeFoto = 'No hay una fotografia.';
  String _mensajeUbicacion = 'Ubicacion no consultada.';
  String _mensajeSensor = 'Sensor detenido.';
  bool _sensorActivo = false;

  // FOTO. Reemplazar el metodo.
  Future<void> _tomarFoto() async {
    setState(() => _mensajeFoto = 'Pendiente: conectar la camara.');
  }

  // UBICACION. Reemplazar el metodo.
  Future<void> _leerUbicacion() async {
    setState(() => _mensajeUbicacion = 'Pendiente: consultar el GPS.');
  }

  // SENSOR. Reemplazar el metodo.
  void _alternarSensor() {
    setState(() => _mensajeSensor = 'Pendiente: escuchar el sensor.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hardware del dispositivo')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('1. Camara', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text(_mensajeFoto),
                  const SizedBox(height: 8),
                  // VISTA PREVIA. Sustituir este Text.
                  const Text('Aqui aparecera la fotografia.'),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: _tomarFoto,
                    child: const Text('Tomar foto'),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('2. Ubicacion', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text(_mensajeUbicacion),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: _leerUbicacion,
                    child: const Text('Consultar ubicacion'),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('3. Acelerometro', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text(_mensajeSensor),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: _alternarSensor,
                    child: Text(
                      _sensorActivo ? 'Detener sensor' : 'Iniciar sensor',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}