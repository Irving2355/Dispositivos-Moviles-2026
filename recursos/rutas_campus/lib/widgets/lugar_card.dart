import 'package:flutter/material.dart';
import '../models/lugar.dart';

// VERSION BASE: la decoracion animada se agrega hasta el dia 4.
// En el dia 3 se conectan los callbacks en InicioPage.
class LugarCard extends StatelessWidget {
  const LugarCard({
    super.key,
    required this.lugar,
    required this.seleccionado,
    required this.onTap,
    required this.onLongPress,
    required this.dragHandle,
  });

  final Lugar lugar;
  final bool seleccionado;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final Widget dragHandle;

  @override
  Widget build(BuildContext context) {
    // Dia 4: convertir Card en AnimatedContainer y animar el favorito.
    return Card(
      color: seleccionado ? Colors.teal.shade50 : null,
      child: ListTile(
        leading: Image.asset(lugar.imagen, width: 56, fit: BoxFit.cover),
        title: Text(lugar.nombre),
        subtitle: Text(lugar.descripcion),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(lugar.favorito ? Icons.star : Icons.star_border),
            dragHandle,
          ],
        ),
        onTap: onTap,
        onLongPress: onLongPress,
      ),
    );
  }
}
