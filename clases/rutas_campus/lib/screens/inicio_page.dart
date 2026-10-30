import 'package:flutter/material.dart';
import '../data/lugares_repository.dart';
import '../models/lugar.dart';
import 'dart:async';

// PUNTO DE PARTIDA: esta pantalla es deliberadamente sencilla.
// En los dias 1-5 la convertiremos en un StatefulWidget y agregaremos
// datos, recursos, gestos, animaciones y una distribucion responsiva.

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  final LugaresRepository _lugaresRepository = LugaresRepository();
  final TextEditingController _aliasController = TextEditingController();
  Timer? _timer;
  List<Lugar> _lugares = [];
  bool _cargando = true;
  int _segundos = 0;
  String? _seleccionadoId;

  @override
  void initState() {
    super.initState();
    debugPrint('InicioPage: initState');

    _aliasController.addListener(_aliasCambio);
    
    _timer = Timer.periodic(const Duration(seconds: 1), (_){
      if(!mounted) return;
      setState(() {
        _segundos++;
      });
    });
  
    _cargarLugares();
  }

  void _aliasCambio() {
    setState(() {
      // Actualizamos la UI cuando cambia el alias.
    });
  }

  Future<void> _cargarLugares() async {
    final resultado = await _lugaresRepository.cargar();

    if(!mounted){
      debugPrint('InicioPage: _cargarLugares: la pantalla ya no esta montada');
      return;
    }

    setState(() {
      _lugares = List<Lugar>.of(resultado);
      _seleccionadoId = _lugares.isEmpty ? null : _lugares.first.id;
      _cargando = false;
    });
  }

  @override
  void dispose() {
    debugPrint('InicioPage: dispose');
    _timer?.cancel();
    _aliasController.removeListener(_aliasCambio);
    _aliasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rutas del campus'),
        actions:[
          Center(child: Text('${_segundos}s'),),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const PantallaPausa()),
              );
            },
          ),
        ]
      ),
      body: _cargando
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _aliasController,
                    decoration: const InputDecoration(
                      labelText: 'Alias',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Segundos transcurridos: $segundos'),
                  const SizedBox(height: 16),
                  DropdownButton<String>(
                    value: _seleccionadoId,
                    items: _lugares.map((lugar) {
                      return DropdownMenuItem<String>(
                        value: lugar.id,
                        child: Text(lugar.nombre),
                      );
                    }).toList(),
                    onChanged: (String? nuevoId) {
                      setState(() {
                        _seleccionadoId = nuevoId;
                      });
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
