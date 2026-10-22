import 'package:flutter/material.dart';
import '../services/gestor_incidencias.dart';
import '../model/incidencia.dart';

class PantallaNueva extends StatefulWidget {
  final GestorIncidencias gestor;
  const PantallaNueva({super.key, required this.gestor});

  @override
  State<PantallaNueva> createState() => _PantallaNuevaState();
}

class _PantallaNuevaState extends State<PantallaNueva> {
  final llave = GlobalKey<FormState>();
  final titulo = TextEditingController();
  final descripcion = TextEditingController();
  final cliente = TextEditingController();
  String categoria = 'Software';
  String prioridad = 'Media'; // FEAT-001: prioridad predeterminada del alta.
  bool ocupado = false;

  @override
  void dispose() {
    titulo.dispose();
    descripcion.dispose();
    cliente.dispose();
    super.dispose();
  }

  Future<void> guardar() async {
    if (!(llave.currentState?.validate() ?? false)) return;
    setState(() => ocupado = true);
    try {
      await widget.gestor.crear(
        titulo.text.trim(),
        descripcion.text.trim(),
        cliente.text.trim(),
        categoria,
        prioridad: prioridad,
      );
      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('No se pudo registrar: $e')));
      }
    } finally {
      if (mounted) setState(() => ocupado = false);
    }
  }

  Widget campo(String etiqueta, TextEditingController control,
      {int lineas = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: control,
        maxLines: lineas,
        decoration: InputDecoration(
            labelText: etiqueta, border: const OutlineInputBorder()),
        validator: (texto) =>
            (texto == null || texto.trim().isEmpty) ? 'Campo requerido' : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar incidencia')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Form(
            key: llave,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text('Nuevo reporte',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                campo('Título', titulo),
                campo('Descripción', descripcion, lineas: 4),
                campo('Cliente', cliente),
                DropdownButtonFormField<String>(
                  initialValue: categoria,
                  decoration: const InputDecoration(
                      labelText: 'Categoría', border: OutlineInputBorder()),
                  items: ['Software', 'Hardware', 'Redes']
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: ocupado
                      ? null
                      : (v) => setState(() => categoria = v ?? 'Software'),
                ),
                const SizedBox(height: 16),
                // FEAT-001: se agrega el selector de prioridad al formulario.
                DropdownButtonFormField<String>(
                  initialValue: prioridad,
                  decoration: const InputDecoration(
                      labelText: 'Prioridad', border: OutlineInputBorder()),
                  items: Incidencia.prioridades
                      .map((v) => DropdownMenuItem(value: v, child: Text(v)))
                      .toList(),
                  onChanged: ocupado
                      ? null
                      : (v) => setState(() => prioridad = v ?? 'Media'),
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: ocupado ? null : guardar,
                  icon: const Icon(Icons.save_outlined),
                  label: const Text('Registrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
