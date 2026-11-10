import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PeliculasPage(),
    );
  }
}

class PeliculasPage extends StatefulWidget {
  const PeliculasPage({super.key});

  @override
  State<PeliculasPage> createState() => _PeliculasPageState();
}

class _PeliculasPageState extends State<PeliculasPage> {
  // Cambiar por 10.0.2.2 (emulador), localhost (escritorio)
  // o la IPv4 de la computadora servidor (telefono fisico).
  static const String url = 'http://10.0.2.2:3000/api/peliculas';
  final SharedPreferencesAsync preferencias = SharedPreferencesAsync();
  List<dynamic> peliculas = [];
  String mensaje = 'Pulsa Consultar';
  bool cargando = false;

  @override
  void initState() {
    super.initState();
    cargarGuardados(); // Mostrar copia local antes de consultar la API.
  }

  Future<void> cargarGuardados() async {
    final texto = await preferencias.getString('peliculas_cache');
    if (!mounted) return; // El widget pudo cerrarse durante el await.
    if (texto != null) {
      setState(() {
        peliculas = jsonDecode(texto) as List<dynamic>;
        mensaje = 'Datos guardados localmente';
      });
    }
  }

  Future<void> consultar() async {
    setState(() {
      cargando = true;
      mensaje = 'Consultando MySQL por medio de la API...';
    });
    try {
      final respuesta = await http.get(Uri.parse(url))
          .timeout(const Duration(seconds: 8));
      if (respuesta.statusCode != 200) {
        throw Exception('HTTP ${respuesta.statusCode}');
      }
      final datos = jsonDecode(respuesta.body) as List<dynamic>;
      await preferencias.setString('peliculas_cache', respuesta.body);
      if (!mounted) return; // No llamar setState despues de cerrar la pantalla.
      setState(() {
        peliculas = datos;
        mensaje = 'Datos obtenidos del servidor';
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        mensaje = 'Sin conexion. Se conservan los datos locales. ($error)';
      });
    } finally {
      if (mounted) setState(() => cargando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalogo Sakila')),
      body: Column(
        children: [
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: cargando ? null : consultar,
            child: const Text('Consultar peliculas'),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(mensaje),
          ),
          if (cargando) const CircularProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: peliculas.length,
              itemBuilder: (context, index) {
                final pelicula = peliculas[index] as Map<String, dynamic>;
                return ListTile(
                  title: Text(pelicula['titulo'].toString()),
                  subtitle: Text('Anio: ${pelicula['anio'] ?? 'Sin dato'}'),
                  leading: CircleAvatar(child: Text('${pelicula['id']}')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
