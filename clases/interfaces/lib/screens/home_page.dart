import 'package:flutter/material.dart';
import '../data/course_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus cursos',),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Hola estudiante',
            style: 
            Theme.of(context)
            .textTheme
            .headlineSmall,
          ),

          const SizedBox(
            height: 4,
          ),

          Text(
            'Que quieres aprender...',
            style: 
            Theme.of(context)
            .textTheme
            .bodyLarge,
          ),

          const SizedBox(
            height: 20,
          ),

          AspectRatio(
            aspectRatio: 16/7,
            child:
            ClipRRect(
              borderRadius: BorderRadius.circular(20),

              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFkWgcso8JkGeUGMK_Q6BgEPKjJ_QtqhMO7iQXHUWRw-ZYpXILY5IgThc&s=10',
                    fit: BoxFit.cover,
                  ),

                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors:[ Colors.transparent,
                        Colors.black87,]
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                'Categorias',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Text(
                'Explorar',
              ),
            ],
          ),

          const SizedBox(
            height: 48,
          ),

          SizedBox(
            height: 40,
            child: 
            ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categorias.length,
              separatorBuilder: (context, index){
                return const SizedBox(width: 8,);
              },

              itemBuilder: (context, index){
                return Text(categorias[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}