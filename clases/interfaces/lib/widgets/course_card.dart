import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String titulo;
  final String categoria;
  final String duracion;
  final String nivel;
  final String imagen;

  final VoidCallback onPressed;

  const CourseCard({
    super.key,
    required this.titulo,
    required this.categoria,
    required this.duracion,
    required this.nivel,
    required this.imagen,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context){
    return Card(
      clipBehavior: Clip.antiAlias,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo),

          Expanded(
            child: Image.network(
              imagen,
              width: double.infinity,
              fit: BoxFit.cover,

              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,

                  child: const Center(
                    child: Icon(
                      Icons.broken_image_outlined,
                      size: 40,
                    ),
                  ),
                );
              },
            )
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,

                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Text(
                    categoria,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                
                const SizedBox(
                    height: 12,
                ),

                
              ],
            ),
          ),
        ],
      ),
    );
  }
}