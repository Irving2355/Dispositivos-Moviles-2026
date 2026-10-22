import 'package:flutter/material.dart';

import '../models/equipment.dart';
import '../state/app_controller.dart';

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({super.key, required this.data});
  final AppController data;

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = widget.data.equipments.where((equipment) {
      return equipment.name.toLowerCase().contains(query.toLowerCase()) ||
          equipment.category.toLowerCase().contains(query.toLowerCase());
    }).toList();
    filtered.sort((a, b) => a.name.compareTo(b.name));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Buscar equipos',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) => setState(() => query = value),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final item = filtered[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(child: Icon(item.available > 0 ? Icons.devices_other : Icons.block)),
                  title: Text(item.name),
                  subtitle: Text('${item.id}  ·  ${item.category}\n${item.location}  ·  ${item.available}/${item.total} disponibles'),
                  isThreeLine: true,
                  trailing: IconButton(
                    tooltip: 'Editar equipo',
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () => editItem(index, item),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> editItem(int row, Equipment item) async {
    final name = TextEditingController(text: item.name);
    final category = TextEditingController(text: item.category);
    final total = TextEditingController(text: '${item.total}');
    final available = TextEditingController(text: '${item.available}');
    final location = TextEditingController(text: item.location);

    final changed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Editar ${item.id}'),
        content: SizedBox(
          width: 430,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: name, decoration: const InputDecoration(labelText: 'Nombre')),
                TextField(controller: category, decoration: const InputDecoration(labelText: 'Categoría')),
                TextField(controller: location, decoration: const InputDecoration(labelText: 'Ubicación')),
                TextField(controller: total, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Total')),
                TextField(controller: available, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Disponibles')),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: const Text('Cancelar')),
          FilledButton(onPressed: () => Navigator.pop(dialogContext, true), child: const Text('Guardar')),
        ],
      ),
    );
    if (changed == true) {
      final count = int.tryParse(total.text) ?? item.total;
      final stock = int.tryParse(available.text) ?? item.available;
      if (name.text.trim().isEmpty || count < 0 || stock < 0 || stock > count) {
        if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Revise los datos del equipo.')));
      } else {
        await widget.data.updateEquipment(
          row,
          Equipment(
            id: item.id,
            name: name.text.trim(),
            category: category.text.trim(),
            total: count,
            available: stock,
            location: location.text.trim(),
          ),
        );
        if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Equipo actualizado.')));
      }
    }
    name.dispose();
    category.dispose();
    total.dispose();
    available.dispose();
    location.dispose();
  }
}
