import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String titulo;
  final String categoria;
  final String nivel;
  final String duracion;
  final String imagen;

  final VoidCallback onPressed;
  const CourseCard({
    super.key,
    required this.titulo,
    required this.categoria,
    required this.nivel,
    required this.duracion,
    required this.imagen,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context){
    return Card(
      clipBehavior: Clip.antiAlias,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imagen,
              width: double.infinity,
              fit: BoxFit.cover,

              errorBuilder: (context, error, stackTrace){
                return Container(
                  color: Theme.of(context)
                  .colorScheme.surfaceContainerHighest,

                  child: const Icon(
                    Icons.broken_image_outlined,
                    size: 40,
                  ),
                );
              },
            )
          ),
        ],
      ),
    );
  }
}