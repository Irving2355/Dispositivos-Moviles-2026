import 'package:flutter/material.dart';

//fstless -> material
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
          //Text(titulo),

          Expanded(
            child: Image.network(
              imagen,
              width: double.infinity,
              fit: BoxFit.cover,

              errorBuilder: (context, error, stackTrace){
                return Container(
                  color: Theme.of(context)
                  .colorScheme
                  .surfaceContainerHighest,

                  child: const Center(
                    child: Icon(Icons.broken_image_outlined,
                    size: 40,),
                  ),
                );
              },
            ),
          ),

          const SizedBox(
              height: 8,
          ),

          
          // Nombre del curso.
          Text(
            titulo,
            maxLines:
                1,
            overflow:
                TextOverflow.ellipsis,
            style:
                Theme.of(context)
                    .textTheme
                    .titleMedium,
          ),

          const SizedBox(
            height: 6,
          ),

          // Nivel y duración.
          Row(
            children: [
              const Icon(
                Icons.schedule,
                size: 16,
              ),

              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  '$nivel - $duracion',
                  maxLines:
                      1,
                  overflow:
                      TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 10,
          ),

          SizedBox(
            width:
                double.infinity,
            child:
                FilledButton.icon(
              onPressed:
                  onPressed,
              icon:
                  const Icon(
                Icons.visibility,
              ),

              label:
                  const Text(
                'Ver',
              ),
            ),
          ),
        ],
      ),
    );
  }
}