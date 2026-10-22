import 'package:flutter/material.dart';

import '../state/app_controller.dart';

class NewLoanPage extends StatefulWidget {
  const NewLoanPage({super.key, required this.data});
  final AppController data;

  @override
  State<NewLoanPage> createState() => _NewLoanPageState();
}

class _NewLoanPageState extends State<NewLoanPage> {
  final name = TextEditingController();
  final notes = TextEditingController();
  String? selectedId;
  DateTime dueAt = DateTime.now().add(const Duration(days: 7));
  bool busy = false;

  @override
  void dispose() {
    name.dispose();
    notes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final equipment = [...widget.data.equipments]..sort((a, b) => a.name.compareTo(b.name));
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo préstamo')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Complete los datos para entregar un dispositivo.'),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: selectedId,
            decoration: const InputDecoration(labelText: 'Dispositivo', border: OutlineInputBorder()),
            items: equipment.map((item) => DropdownMenuItem(value: item.id, child: Text('${item.name} (${item.available} disponibles)'))).toList(),
            onChanged: (value) => setState(() => selectedId = value),
          ),
          const SizedBox(height: 14),
          TextField(controller: name, decoration: const InputDecoration(labelText: 'Nombre del responsable', border: OutlineInputBorder())),
          const SizedBox(height: 14),
          TextField(controller: notes, maxLines: 2, decoration: const InputDecoration(labelText: 'Observaciones (opcional)', border: OutlineInputBorder())),
          const SizedBox(height: 14),
          OutlinedButton.icon(
            icon: const Icon(Icons.calendar_today_outlined),
            label: Text('Fecha límite: ${dueAt.day}/${dueAt.month}/${dueAt.year}'),
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: dueAt,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (date != null) setState(() => dueAt = date);
            },
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: busy ? null : save,
            icon: const Icon(Icons.save_outlined),
            label: const Text('Registrar préstamo'),
          ),
        ],
      ),
    );
  }

  Future<void> save() async {
    if (selectedId == null || name.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Seleccione un dispositivo e indique un responsable.')));
      return;
    }
    setState(() => busy = true);
    try {
      await widget.data.createLoan(equipmentId: selectedId!, borrower: name.text, dueAt: dueAt, notes: notes.text);
      if (mounted) Navigator.pop(context);
    } catch (exception) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$exception')));
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }
}
