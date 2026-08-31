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
        title: const Text('Campus cursos'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          Text(
            'Hola estudiante',
            style: Theme.of(context)
                .textTheme.headlineSmall,
          ),

          SizedBox(
            height: 4,
          ),

          Text(
            'Que quieres aprender',
            style: Theme.of(context)
              .textTheme
              .bodyLarge,
          )
        ],
      ),
    );
  }
}