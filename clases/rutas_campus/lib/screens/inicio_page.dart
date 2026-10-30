import 'package:flutter/material.dart';
import 'dart:async';
import '../data/lugares_repository.dart';
import '../models/lugar.dart';

// PUNTO DE PARTIDA: esta pantalla es deliberadamente sencilla.
// En los dias 1-5 la convertiremos en un StatefulWidget y agregaremos
// datos, recursos, gestos, animaciones y una distribucion responsiva.

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
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

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _segundos++;
      });
    }); 

    _cargarLugares();
  }

  void _aliasCambio() {
    setState(() {
      // Actualizamos la UI cuando el alias cambia.
    });
  }

  Future<void> _cargarLugares() async {
    final lugares = await _lugaresRepository.cargar();
    if (!mounted){
      debugPrint('No actualizamos la UI porque el widget ya no está montado.');
      return;
    }

    setState(() {
      _lugares = List<Lugar>.of(lugares);
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
        actions: [
          Center(child: Text('$_segundos s'),),
          IconButton(
            tooltip: 'Salir para observar dispose',
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const PantallaPausa()),
              );
            },
          ),
        ]
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _aliasController,
              decoration: const InputDecoration(
                labelText: 'Tu alias (opcional)',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Text(_aliasController.text.isEmpty
              ? 'Bienvenido al campus'
              : 'Hola, ${_aliasController.text}'),
          Text("Seleccion inicial: ${_seleccionadoId ?? 'ninguna'}"),
          Expanded(
            child: _cargando
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _lugares.length,
                    itemBuilder: (context, index) {
                      final lugar = _lugares[index];
                      return ListTile(
                        leading: Image.asset(lugar.imagen, width: 56),
                        title: Text(lugar.nombre),
                        subtitle: Text(lugar.descripcion),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class PantallaPausa extends StatelessWidget {
const PantallaPausa({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla de pausa'),
      ),
      body: Center(
        child: FilledButton(
          onPressed: ()=> Navigator.of(context).pushReplacement(
            MaterialPageRoute<void>(builder: (_)=>
            const InicioPage()),
          ), 
          child: const Text('Volver al home')),
      ),
    );
  }
}