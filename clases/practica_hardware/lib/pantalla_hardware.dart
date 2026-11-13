import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';

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
  final ImagePicker _selectorImagen = ImagePicker();
  XFile? _foto;

  StreamSubscription<AccelerometerEvent>? _sensorSub;

  // FOTO. Reemplazar el metodo.
  Future<void> _tomarFoto() async {
    try{
      final XFile? image = await _selectorImagen.pickImage(source: ImageSource.camera,
      imageQuality: 70,
      maxWidth: 1280,
      );

      if(!mounted) return;

      if(image == null){
        setState(()=> _mensajeFoto = 'Tomale foto we');
        return;
      }

      setState(() {
        _foto = image;
        _mensajeFoto = 'Fiu fiu';
      });
    }catch(error){
      if(!mounted) return;
      setState(() {
        _mensajeFoto = 'No se puede $error';
      });
    }
  }

  // UBICACION. Reemplazar el metodo.
  Future<void> _leerUbicacion() async {
    try {
      final activo = await Geolocator.isLocationServiceEnabled();
      if(!activo){
        if(!mounted) return;
        setState(() => _mensajeUbicacion = 'Activa la ubi we');
        return;
      }

      var permiso = await Geolocator.checkPermission();
      if(permiso == LocationPermission.denied){
        permiso = await Geolocator.requestPermission();
      }

      if(permiso == LocationPermission.denied || 
      permiso == LocationPermission.deniedForever){
        if(!mounted) return;
        setState(() {
          _mensajeUbicacion= 'No tengo permiso';
        });
        return;
      }

      final posicion = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 15),
        )
      );

      if(!mounted)return;
      setState(() {
        _mensajeUbicacion = 
        'Lat: ${posicion.latitude.toStringAsFixed(6)} '
        'Lon: ${posicion.longitude.toStringAsFixed(6)} '
        'Presicion: ${posicion.accuracy.toStringAsFixed(0)} m';
      });
    } catch (e) {
      if(!mounted) return;
      setState(() {
        _mensajeUbicacion = '$e';
      });
    }
  }

  // SENSOR. Reemplazar el metodo.
  void _alternarSensor() {
    if(_sensorSub != null){
      _sensorSub?.cancel();
      _sensorSub = null;
      setState(() {
        _sensorActivo = false;
        _mensajeSensor = 'Sensor desactivado';
      });
      return;
    }

    _sensorSub = accelerometerEventStream(
      samplingPeriod: SensorInterval.normalInterval
    ).listen(
      (evento){
        if(!mounted) return;
        setState(() {
          _mensajeSensor = 
          'X: ${evento.x.toStringAsFixed(2)} '
          'Y: ${evento.y.toStringAsFixed(2)} '
          'Z: ${evento.z.toStringAsFixed(2)} m/s2';
        });
      },
      onError: (Object error){
        if(!mounted) return;
        setState(() {
          _sensorActivo = false;
          _mensajeSensor = '$error';
        });
        _sensorSub = null;
      },
      cancelOnError: true,
    );

    setState(() {
      _sensorActivo = true;
    });
  } 

  @override
  void dispose() {
    _sensorSub?.cancel();
    super.dispose();
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
                  _foto == null ?
                  const Text('Aqui aparece la foto')
                  : Image.file(
                    File(_foto!.path),
                    width: double.infinity,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
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