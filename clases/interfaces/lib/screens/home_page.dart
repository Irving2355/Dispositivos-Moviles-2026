//fstful
import 'package:flutter/material.dart';
import '../data/course_data.dart';
import '../widgets/category_chip.dart';
import '../widgets/course_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({ super.key });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _categoriaSeleccionada = 'Todos';

  List<Map<String, String>> _obtenerCursos(){
    if(_categoriaSeleccionada == 'Todos'){
      return cursos;
    }

    final List<Map<String, String>> resultado = [];

    for(final curso in cursos){
      if(curso['categoria'] == _categoriaSeleccionada){
        resultado.add(curso);
      }
    }

    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    final cursosFiltrados = _obtenerCursos();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus cursos',),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Hola estudiante',
            style: 
            Theme.of(context)
            .textTheme.headlineSmall,
          ),

          const SizedBox(
            height: 4,
          ),

          Text(
            'Que quieres aprender hoy?',
            style: Theme.of(context)
            .textTheme
            .bodyLarge,
          ),

          SizedBox(
            height: 20,
          ),

          AspectRatio(
            aspectRatio: 16/7,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://fotografias.lasexta.com/clipping/cmsimages02/2023/06/12/2D1E1A88-3CCB-4EF5-BFAC-65A34B6706F3/fondos-pantalla-clasicos-windows-calidad_98.jpg?crop=1300,731,x0,y0&width=1900&height=1069&optimize=high&format=webply',
                    fit: BoxFit.cover,
                  ),

                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black87,
                        ],
                      ),
                    ),
                  ),

                  const Positioned(
                    left: 20,
                    right: 20,
                    bottom: 18,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          'Aprende algo nuevo hoy...',
                          style: 
                          TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 22,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categorias',
                style: 
                Theme.of(context).textTheme.titleLarge,
              ),

              const Text('Explorar',),
            ],
          ),

          const SizedBox(
            height: 12,
          ),

          SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categorias.length,
              separatorBuilder: (context, index){
                return const SizedBox(
                  width: 8,
                );
              },

              itemBuilder: (context, index) {
                final categoria = categorias[index];

                return CategoryChip(
                  label: categoria, 
                  selected: _categoriaSeleccionada == categoria, 
                  onTap: (){
                    setState(() {
                      _categoriaSeleccionada = categoria;
                    });
                  }
                  );
              },
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          Text(
            'Cursos disponibles',
            style: Theme.of(context).textTheme.titleLarge,
          ),

          const SizedBox(
            height: 12,
          ),

          GridView.builder(
            shrinkWrap: true,

            physics: const NeverScrollableScrollPhysics(),
            itemCount: cursosFiltrados.length,

            gridDelegate: 
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.68,
            ),
            
            itemBuilder:(context, index) {
              final curso = cursosFiltrados[index];

              return CourseCard(
                titulo: curso['titulo']!, 
                categoria: curso['categoria']!, 
                duracion: curso['duracion']!, 
                nivel: curso['nivel']!, 
                imagen: curso['imagen']!, 
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: 
                    Text('Seleccionaste ${curso['titulo']}'))
                  );
                }
                );
            },
          ),
        ],
      ),
    );
  }
}