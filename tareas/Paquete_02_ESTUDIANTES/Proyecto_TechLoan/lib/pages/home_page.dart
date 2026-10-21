import 'package:flutter/material.dart';

import '../state/app_controller.dart';
import '../widgets/metric_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.data});

  final AppController data;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        Text('Resumen operativo', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 6),
        const Text('Centro de préstamo de tecnología · Estado general'),
        const SizedBox(height: 16),
        LayoutBuilder(builder: (context, constraints) {
          final cols = constraints.maxWidth >= 750 ? 3 : (constraints.maxWidth >= 480 ? 2 : 1);
          return GridView.count(
            crossAxisCount: cols,
            childAspectRatio: cols == 1 ? 2.1 : 1.7,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              MetricCard(label: 'Tipos de equipo', value: '${data.equipments.length}', icon: Icons.devices),
              MetricCard(label: 'Unidades disponibles', value: '${data.availableCount}', icon: Icons.inventory_2_outlined),
              MetricCard(label: 'Préstamos activos', value: '${data.activeCount}', icon: Icons.assignment_outlined),
            ],
          );
        }),
        const SizedBox(height: 20),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Avisos de operación', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text('Revise los préstamos y la disponibilidad antes de asignar nuevos equipos.'),
                const SizedBox(height: 6),
                const Text('La información se conserva localmente en el dispositivo.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
