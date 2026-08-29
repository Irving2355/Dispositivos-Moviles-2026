import 'package:flutter/material.dart';

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
                    'https://ro.pinterest.com/pin/115264071703225016/',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}